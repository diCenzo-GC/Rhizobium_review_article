## Make the phylogeny

# Make the necessary directories
mkdir intermediaryFiles
mkdir Proteomes
mkdir ProteomesNewNames
mkdir MarkerScannerOutput
mkdir MarkerScannerCounted
mkdir MarkerScannerGood
mkdir Mafft
mkdir TrimAl
mkdir TrimAlmodified
mkdir OutputFiles

# Download genomes
mv refseqGenomeInformation.txt intermediaryFiles/ # move this file location
perl Scripts/downloadGenomes.pl intermediaryFiles/refseqGenomeInformation.txt # download the proteomes of interest
perl Scripts/switchNames.pl # switch the names of the proteins in the faa files
cat ProteomesNewNames/*.faa > intermediaryFiles/combined_proteomes.faa # combine the faa files into one file

# Run MarkerScanner analysis
perl Scripts/updateNumber.pl # updates the number of sequences in the MarkerScanner.pl script
perl Scripts/MarkerScannerNumber.pl -Bacteria intermediaryFiles/combined_proteomes.faa # perform the MarkerScanner analysis
mv *.pep MarkerScannerOutput/ # move output of MarkerScanner output directory
perl Scripts/countProteins.pl # check that the proteins are found in enough genomes
perl Scripts/checkSpecies.pl # check that in those genomes, the protein is found in single copy

# Run alignments and prepare concatenated alignment
perl Scripts/align.pl # run mafft on all individual sets of proteins
perl Scripts/trim.pl # run trimAl on all individual sets of proteins
perl Scripts/modifyTrimAl.pl # modify the trimAl output to prepare it for combining the alignments
perl Scripts/sortProteins.pl # sort each of the trimAl output files that will be used for further analysis
perl Scripts/combineAlignments.pl > OutputFiles/MLSA_final_alignment_strains.fasta # concatenate the alignment files
perl Scripts/modifyFinalAlignment.pl OutputFiles/MLSA_final_alignment_strains.fasta > OutputFiles/MLSA_final_alignment_species.fasta # remove strain number

# Prepare phylogeny
FastTree OutputFiles/MLSA_final_alignment_species.fasta > OutputFiles/MLSA_FastTree_phylogeny_species_fasttree.tre # prepare a phylogeny with FastTree
# Ran RAxML on CIPRES

## Identify nod and nif genes

# Set up directories
mkdir ProteomesHMM
mkdir HMMsearch
mkdir HMMsearchParsed
mkdir HMMsearchHits
mkdir HMMscan
mkdir hmmDatabaseFiles
mkdir HMMscanParsed
mkdir HMMscanTop

# Prepare protein files
perl Scripts/switchNames2.pl # switch the names of the proteins in the faa files
cat ProteomesHMM/*.faa > intermediaryFiles/combined_proteomes_HMM.faa # combine the faa files into one file
perl Scripts/modifyFasta.pl intermediaryFiles/combined_proteomes_HMM.faa > intermediaryFiles/combined_proteomes_HMM_modified.faa # modify the fasta file for easy extraction

# Perform the HMMsearch screens
perl Scripts/performHMMsearch.pl # a short script to repeat for all HMM files, the build, hmmsearch, parsing, and hit extraction

# Perform the HMM scan screens
wget ftp://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/Pfam-A.hmm.gz # get the Pfam HMM files
wget ftp://ftp.jcvi.org/pub/data/TIGRFAMs//TIGRFAMs_15.0_HMM.LIB.gz # get the TIGRFAM HMM files
gunzip Pfam-A.hmm.gz # unzip the Pfam files
gunzip TIGRFAMs_15.0_HMM.LIB.gz # unzip the TIGRFAM files
mv Pfam-A.hmm hmmDatabaseFiles/Pfam-A.hmm # move the Pfam files
mv TIGRFAMs_15.0_HMM.LIB hmmDatabaseFiles/TIGRFAMs_15.0_HMM.LIB # move the TIGRFAM files
hmmconvert hmmDatabaseFiles/Pfam-A.hmm > hmmDatabaseFiles/Pfam-A_converted.hmm # convert the database to the necessary format
hmmconvert hmmDatabaseFiles/TIGRFAMs_15.0_HMM.LIB > hmmDatabaseFiles/TIGRFAM_converted.hmm # convert the database to the necessary format 
cat hmmDatabaseFiles/Pfam-A_converted.hmm hmmDatabaseFiles/TIGRFAM_converted.hmm > hmmDatabaseFiles/converted_combined.hmm # combined all hidden Markov models into a single file
hmmpress hmmDatabaseFiles/converted_combined.hmm # prepare files for hmmscan searches
perl Scripts/performHMMscan.pl # a short script to repeat for all the HMM search output files, to perform hmmscan, parse, and hit extraction

# Determine species with each protein
perl Scripts/determineProteinPresence.pl > OutputFiles/proteinPresenceAbsence_strains.txt # determine which of the six proteins are in each of the strains
sort -k1 OutputFiles/proteinPresenceAbsence_strains.txt -o OutputFiles/proteinPresenceAbsence_strains.txt # sort the previous file by species name
perl Scripts/prepareAnnotations.pl OutputFiles/proteinPresenceAbsence_strains.txt > OutputFiles/proteinPresenceAbsence_species.txt # determine which species have at least one strain with NodABC and/or NifHDK
