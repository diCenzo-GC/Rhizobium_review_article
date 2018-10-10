%% Load model

sino = readCbModel('iGD726.xml');
sino = changeObjective(sino,'rxnBIOMASS');

%% Set output variables

% for storing reaction information
outputReactions = cell(1,10);
outputReactions{1,1} = 'ReactionID';
outputReactions{1,2} = 'ReactionName';
outputReactions{1,3} = 'SucroseFlux';
outputReactions{1,4} = 'GlucoseFlux';
outputReactions{1,5} = 'SuccinateFlux';
outputReactions{1,6} = 'GlucoseSuccinateFlux';
outputReactions{1,7} = 'SucroseEssentiality';
outputReactions{1,8} = 'GlucoseEssentiality';
outputReactions{1,9} = 'SuccinateEssentiality';
outputReactions{1,10} = 'GlucoseSuccinateEssentiality';
outputReactions{1,11} = 'SucroseFVAmin';
outputReactions{1,12} = 'SucroseFVAmax';
outputReactions{1,13} = 'GlucoseFVAmin';
outputReactions{1,14} = 'GlucoseFVAmax';
outputReactions{1,15} = 'SuccinateFVAmin';
outputReactions{1,16} = 'SuccinateFVAmax';
outputReactions{1,17} = 'GlucoseSuccinateFVAmin';
outputReactions{1,18} = 'GlucoseSuccinateFVAmax';
for n = 1:length(sino.rxns);
   outputReactions{n+1,1} = sino.rxns{n,1};
   outputReactions{n+1,2} = sino.rxnNames{n,1};
end

% for storing gene information
outputGenes = cell(1,5);
outputGenes{1,1} = 'LocusTag';
outputGenes{1,2} = 'SucroseFitness';
outputGenes{1,3} = 'GlucoseFitness';
outputGenes{1,4} = 'SuccinateFitness';
outputGenes{1,5} = 'GlucoseSuccinateFitness';
for n = 1:length(sino.genes);
   outputGenes{n+1,1} = sino.genes{n,1};
end

%% Test sucrose medium

% set sucrose as growth limiting
sinoSucrose = changeRxnBounds(sino,'EX_cpd00076_e0',-2.41,'l');
sinoSucrose = changeRxnBounds(sinoSucrose,'EX_cpd00027_e0',0,'l');
sinoSucrose = changeRxnBounds(sinoSucrose,'EX_cpd00036_e0',0,'l');

% turn off reactions
sinoSucrose = changeRxnBounds(sinoSucrose,'rxn00159',0,'b');
sinoSucrose = changeRxnBounds(sinoSucrose,'rxn00161',0,'b');
sinoSucrose = changeRxnBounds(sinoSucrose,'rxn00346',0,'b');

% flux distribution analysis
sinoSucroseSolution = optimizeCbModel(sinoSucrose,'max');
fluxSucrose = sinoSucroseSolution.x;
fluxSucrose = num2cell(fluxSucrose);

% turn back on reactions where applicable
sinoSucrose = changeRxnBounds(sinoSucrose,'rxn00346',1000,'u');

% reaction deletion analysis
for n = 1:length(sino.rxns)
    testModel = removeRxns(sinoSucrose,sino.rxns{n,1});
    testSolution = optimizeCbModel(testModel,'max');
    outputReactions{n+1,7} = testSolution.f;
    outputReactions{n+1,3} = fluxSucrose{n,1};
end

% gene deletion analysis
[grRatioSucrose,grRateKOSucrose,grRateWTSucrose,delRxnsSucrose,hasEffectSucrose] = singleGeneDeletion(sinoSucrose,'MOMA');
grRatioSucrose = num2cell(grRatioSucrose);
for n = 1:length(sino.genes)
   outputGenes{n+1,2} = round(grRatioSucrose{n,1},3);
end

%% Test glucose medium

% set glucose as growth limiting
sinoGlucose = changeRxnBounds(sino,'EX_cpd00076_e0',0,'l');
sinoGlucose = changeRxnBounds(sinoGlucose,'EX_cpd00027_e0',-2.41,'l');
sinoGlucose = changeRxnBounds(sinoGlucose,'EX_cpd00036_e0',0,'l');

% turn off reactions
sinoGlucose = changeRxnBounds(sinoGlucose,'rxn00159',0,'b');
sinoGlucose = changeRxnBounds(sinoGlucose,'rxn00161',0,'b');
sinoGlucose = changeRxnBounds(sinoGlucose,'rxn00346',0,'b');

% flux distribution analysis
sinoGlucoseSolution = optimizeCbModel(sinoGlucose,'max');
fluxGlucose = sinoGlucoseSolution.x;
fluxGlucose = num2cell(fluxGlucose);

% turn back on reactions where applicable
sinoGlucose = changeRxnBounds(sinoGlucose,'rxn00346',1000,'u');

% reaction deletion analysis
for n = 1:length(sino.rxns)
    testModel = removeRxns(sinoGlucose,sino.rxns{n,1});
    testSolution = optimizeCbModel(testModel,'max');
    outputReactions{n+1,8} = testSolution.f;
    outputReactions{n+1,4} = fluxGlucose{n,1};
end

% gene deletion analysis
[grRatioGlucose,grRateKOGlucose,grRateWTGlucose,delRxnsGlucose,hasEffectGlucose] = singleGeneDeletion(sinoGlucose,'MOMA');
grRatioGlucose = num2cell(grRatioGlucose);
for n = 1:length(sino.genes)
   outputGenes{n+1,3} = round(grRatioGlucose{n,1},3);
end

%% Test succinate medium

% set succinate as growth limiting
sinoSuccinate = changeRxnBounds(sino,'EX_cpd00076_e0',0,'l');
sinoSuccinate = changeRxnBounds(sinoSuccinate,'EX_cpd00027_e0',0,'l');
sinoSuccinate = changeRxnBounds(sinoSuccinate,'EX_cpd00036_e0',-6.252,'l');

% turn off reactions
sinoSuccinate = changeRxnBounds(sinoSuccinate,'rxn00250',0,'b');
sinoSuccinate = changeRxnBounds(sinoSuccinate,'rxn00346',0,'b');

% flux distribution analysis
sinoSuccinateSolution = optimizeCbModel(sinoSuccinate,'max');
fluxSuccinate = sinoSuccinateSolution.x;
fluxSuccinate = num2cell(fluxSuccinate);

% turn back on reactions where applicable
sinoGlucose = changeRxnBounds(sinoGlucose,'rxn00346',1000,'u');

% reaction deletion analysis
for n = 1:length(sino.rxns)
    testModel = removeRxns(sinoSuccinate,sino.rxns{n,1});
    testSolution = optimizeCbModel(testModel,'max');
    outputReactions{n+1,9} = testSolution.f;
    outputReactions{n+1,5} = fluxSuccinate{n,1};
end

% gene deletion analysis
[grRatioSuccinate,grRateKOSuccinate,grRateWTSuccinate,delRxnsSuccinate,hasEffectSuccinate] = singleGeneDeletion(sinoSuccinate,'MOMA');
grRatioSuccinate = num2cell(grRatioSuccinate);
for n = 1:length(sino.genes)
   outputGenes{n+1,4} = round(grRatioSuccinate{n,1},3);
end

%% Test glucose+succiante medium

% set glucose+succinate as growth limiting
sinoGlucoseSuccinate = changeRxnBounds(sino,'EX_cpd00076_e0',0,'l');
sinoGlucoseSuccinate = changeRxnBounds(sinoGlucoseSuccinate,'EX_cpd00027_e0',-2.41,'l');
sinoGlucoseSuccinate = changeRxnBounds(sinoGlucoseSuccinate,'EX_cpd00036_e0',-6.252,'l');

% turn off reactions
sinoGlucoseSuccinate = changeRxnBounds(sinoGlucoseSuccinate,'rxn00346',0,'b');

% flux distribution analysis
sinoGlucoseSuccinateSolution = optimizeCbModel(sinoGlucoseSuccinate,'max');
fluxGlucoseSuccinate = sinoGlucoseSuccinateSolution.x;
fluxGlucoseSuccinate = num2cell(fluxGlucoseSuccinate);

% turn back on reactions where applicable
sinoGlucoseSuccinate = changeRxnBounds(sinoGlucoseSuccinate,'rxn00346',1000,'u');

% reaction deletion analysis
for n = 1:length(sino.rxns)
    testModel = removeRxns(sinoGlucoseSuccinate,sino.rxns{n,1});
    testSolution = optimizeCbModel(testModel,'max');
    outputReactions{n+1,10} = testSolution.f;
    outputReactions{n+1,6} = fluxGlucoseSuccinate{n,1};
end

% gene deletion analysis
[grRatioGlucoseSuccinate,grRateKOGlucoseSuccinate,grRateWTGlucoseSuccinate,delRxnsGlucoseSuccinate,hasEffectGlucoseSuccinate] = singleGeneDeletion(sinoGlucoseSuccinate,'MOMA');
grRatioGlucoseSuccinate = num2cell(grRatioGlucoseSuccinate);
for n = 1:length(sino.genes)
   outputGenes{n+1,5} = round(grRatioGlucoseSuccinate{n,1},3);
end

%% Flux variability analysis

% Perform FVA
[minFluxSucrose,maxFluxSucrose] = fluxVariability(sinoSucrose);
[minFluxGlucose,maxFluxGlucose] = fluxVariability(sinoGlucose);
[minFluxSuccinate,maxFluxSuccinate] = fluxVariability(sinoSuccinate);
[minFluxGlucoseSuccinate,maxFluxGlucoseSuccinate] = fluxVariability(sinoGlucoseSuccinate);

% convert format
minFluxSucrose = num2cell(minFluxSucrose);
maxFluxSucrose = num2cell(maxFluxSucrose);
minFluxGlucose = num2cell(minFluxGlucose);
maxFluxGlucose = num2cell(maxFluxGlucose);
minFluxSuccinate = num2cell(minFluxSuccinate);
maxFluxSuccinate = num2cell(maxFluxSuccinate);
minFluxGlucoseSuccinate = num2cell(minFluxGlucoseSuccinate);
maxFluxGlucoseSuccinate = num2cell(maxFluxGlucoseSuccinate);

% Record FVA
for n = 1:length(sino.rxns)
    outputReactions{n+1,11} = minFluxSucrose{n,1};
    outputReactions{n+1,12} = maxFluxSucrose{n,1};
    outputReactions{n+1,13} = minFluxGlucose{n,1};
    outputReactions{n+1,14} = maxFluxGlucose{n,1};
    outputReactions{n+1,15} = minFluxSuccinate{n,1};
    outputReactions{n+1,16} = maxFluxSuccinate{n,1};
    outputReactions{n+1,17} = minFluxGlucoseSuccinate{n,1};
    outputReactions{n+1,18} = maxFluxGlucoseSuccinate{n,1};
end

%% Save and export

save('allOutput.mat');
clearvars -except output*;
outputReactionsTable = cell2table(outputReactions);
writetable(outputReactionsTable,'outputReactions.xlsx','WriteVariableNames',false);
outputGenesTable = cell2table(outputGenes);
writetable(outputGenesTable,'outputGenes.xlsx','WriteVariableNames',false);

