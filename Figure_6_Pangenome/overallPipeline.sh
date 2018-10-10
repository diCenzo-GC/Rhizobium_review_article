#Reannotate genomes
prokka --outdir prokka/Sinorhizobium_meliloti_BL225C --prefix Sinorhizobium_meliloti_BL225C --fast --norrna --notrna genomes/Sinorhizobium_meliloti_BL225C.fna
prokka --outdir prokka/Sinorhizobium_meliloti_AK83 --prefix Sinorhizobium_meliloti_AK83 --fast --norrna --notrna genomes/Sinorhizobium_meliloti_AK83.fna
prokka --outdir prokka/Sinorhizobium_meliloti_SM11 --prefix Sinorhizobium_meliloti_SM11 --fast --norrna --notrna genomes/Sinorhizobium_meliloti_SM11.fna
prokka --outdir prokka/Sinorhizobium_meliloti_Rm41 --prefix Sinorhizobium_meliloti_Rm41 --fast --norrna --notrna genomes/Sinorhizobium_meliloti_Rm41.fna
prokka --outdir prokka/Sinorhizobium_meliloti_GR4 --prefix Sinorhizobium_meliloti_GR4 --fast --norrna --notrna genomes/Sinorhizobium_meliloti_GR4.fna
prokka --outdir prokka/Sinorhizobium_meliloti_RMO17 --prefix Sinorhizobium_meliloti_RMO17 --fast --norrna --notrna genomes/Sinorhizobium_meliloti_RMO17.fna
prokka --outdir prokka/Sinorhizobium_meliloti_RU11 --prefix Sinorhizobium_meliloti_RU11 --fast --norrna --notrna genomes/Sinorhizobium_meliloti_RU11.fna
prokka --outdir prokka/Sinorhizobium_meliloti_USDA1157 --prefix Sinorhizobium_meliloti_USDA1157 --fast --norrna --notrna genomes/Sinorhizobium_meliloti_USDA1157.fna
prokka --outdir prokka/Sinorhizobium_meliloti_Rm41 --prefix Sinorhizobium_meliloti_Rm41 --fast --norrna --notrna genomes/Sinorhizobium_meliloti_Rm41.fna
prokka --outdir prokka/Sinorhizobium_meliloti_USDA1106 --prefix Sinorhizobium_meliloti_USDA1106 --fast --norrna --notrna genomes/Sinorhizobium_meliloti_USDA1106.fna
prokka --outdir prokka/Sinorhizobium_meliloti_M270 --prefix Sinorhizobium_meliloti_M270 --fast --norrna --notrna genomes/Sinorhizobium_meliloti_M270.fna
prokka --outdir prokka/Sinorhizobium_meliloti_KH35c --prefix Sinorhizobium_meliloti_KH35c --fast --norrna --notrna genomes/Sinorhizobium_meliloti_KH35c.fna
prokka --outdir prokka/Sinorhizobium_meliloti_M162 --prefix Sinorhizobium_meliloti_M162 --fast --norrna --notrna genomes/Sinorhizobium_meliloti_M162.fna
prokka --outdir prokka/Sinorhizobium_meliloti_T073 --prefix Sinorhizobium_meliloti_T073 --fast --norrna --notrna genomes/Sinorhizobium_meliloti_T073.fna
prokka --outdir prokka/Sinorhizobium_meliloti_HM006 --prefix Sinorhizobium_meliloti_HM006 --fast --norrna --notrna genomes/Sinorhizobium_meliloti_HM006.fna
prokka --outdir prokka/Sinorhizobium_meliloti_USDA1021 --prefix Sinorhizobium_meliloti_USDA1021 --fast --norrna --notrna genomes/Sinorhizobium_meliloti_USDA1021.fna
prokka --outdir prokka/Sinorhizobium_meliloti_KH46 --prefix Sinorhizobium_meliloti_KH46 --fast --norrna --notrna genomes/Sinorhizobium_meliloti_KH46.fna
prokka --outdir prokka/Sinorhizobium_meliloti_CCMM_B554 --prefix Sinorhizobium_meliloti_CCMM_B554 --fast --norrna --notrna genomes/Sinorhizobium_meliloti_CCMM_B554.fna
prokka --outdir prokka/Sinorhizobium_meliloti_B401 --prefix Sinorhizobium_meliloti_B401 --fast --norrna --notrna genomes/Sinorhizobium_meliloti_B401.fna
prokka --outdir prokka/Sinorhizobium_meliloti_B399 --prefix Sinorhizobium_meliloti_B399 --fast --norrna --notrna genomes/Sinorhizobium_meliloti_B399.fna

# Move the gff3 files
mkdir gff3
cp prokka/Sinorhizobium_meliloti_Rm1021/Sinorhizobium_meliloti_Rm1021.gff gff3/Sinorhizobium_meliloti_Rm1021.gff
cp prokka/Sinorhizobium_meliloti_BL225C/Sinorhizobium_meliloti_BL225C.gff gff3/Sinorhizobium_meliloti_BL225C.gff
cp prokka/Sinorhizobium_meliloti_AK83/Sinorhizobium_meliloti_AK83.gff gff3/Sinorhizobium_meliloti_AK83.gff
cp prokka/Sinorhizobium_meliloti_SM11/Sinorhizobium_meliloti_SM11.gff gff3/Sinorhizobium_meliloti_SM11.gff
cp prokka/Sinorhizobium_meliloti_Rm41/Sinorhizobium_meliloti_Rm41.gff gff3/Sinorhizobium_meliloti_Rm41.gff
cp prokka/Sinorhizobium_meliloti_GR4/Sinorhizobium_meliloti_GR4.gff gff3/Sinorhizobium_meliloti_GR4.gff
cp prokka/Sinorhizobium_meliloti_RMO17/Sinorhizobium_meliloti_RMO17.gff gff3/Sinorhizobium_meliloti_RMO17.gff
cp prokka/Sinorhizobium_meliloti_RU11/Sinorhizobium_meliloti_RU11.gff gff3/Sinorhizobium_meliloti_RU11.gff
cp prokka/Sinorhizobium_meliloti_USDA1157/Sinorhizobium_meliloti_USDA1157.gff gff3/Sinorhizobium_meliloti_USDA1157.gff
cp prokka/Sinorhizobium_meliloti_Rm41/Sinorhizobium_meliloti_Rm41.gff gff3/Sinorhizobium_meliloti_Rm41.gff
cp prokka/Sinorhizobium_meliloti_USDA1106/Sinorhizobium_meliloti_USDA1106.gff gff3/Sinorhizobium_meliloti_USDA1106.gff
cp prokka/Sinorhizobium_meliloti_M270/Sinorhizobium_meliloti_M270.gff gff3/Sinorhizobium_meliloti_M270.gff
cp prokka/Sinorhizobium_meliloti_KH35c/Sinorhizobium_meliloti_KH35c.gff gff3/Sinorhizobium_meliloti_KH35c.gff
cp prokka/Sinorhizobium_meliloti_M162/Sinorhizobium_meliloti_M162.gff gff3/Sinorhizobium_meliloti_M162.gff
cp prokka/Sinorhizobium_meliloti_T073/Sinorhizobium_meliloti_T073.gff gff3/Sinorhizobium_meliloti_T073.gff
cp prokka/Sinorhizobium_meliloti_HM006/Sinorhizobium_meliloti_HM006.gff gff3/Sinorhizobium_meliloti_HM006.gff
cp prokka/Sinorhizobium_meliloti_USDA1021/Sinorhizobium_meliloti_USDA1021.gff gff3/Sinorhizobium_meliloti_USDA1021.gff
cp prokka/Sinorhizobium_meliloti_KH46/Sinorhizobium_meliloti_KH46.gff gff3/Sinorhizobium_meliloti_KH46.gff
cp prokka/Sinorhizobium_meliloti_CCMM_B554/Sinorhizobium_meliloti_CCMM_B554.gff gff3/Sinorhizobium_meliloti_CCMM_B554.gff
cp prokka/Sinorhizobium_meliloti_B401/Sinorhizobium_meliloti_B401.gff gff3/Sinorhizobium_meliloti_B401.gff
cp prokka/Sinorhizobium_meliloti_B399/Sinorhizobium_meliloti_B399.gff gff3/Sinorhizobium_meliloti_B399.gff

# Create the pangenome
mkdir roaryOutput/
roary -e --mafft -p 8 -f roaryOutput/ gff3/*.gff
