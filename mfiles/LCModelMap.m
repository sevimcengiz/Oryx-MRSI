% This function pars LCModel output files to get concentration, std values. 
% It doesn't check ratio values of metabolites because of the chemical shift
% displacement.
% It finds concentration and std values of metabolites including Cr+PCr, Glu+Gln, GPC+PCh, Ins, Lac, Lip13a, Lip13b, Lip13a+Lip13b, NAA+NAAG.
% We calculate tCr and mI ratio values of metabolites in the following
% steps considering chemical shift correction.
% Author: Sevim Cengiz, Bogazici University, Turkey (2020-11-27)
% Contact: sevim_cengiz@icloud.com


function [NumStd,Conc]=LCModelMap(tableinfo,newmap,newmapname,newmapppm)

%T1segmentation(Pinfo);

switch newmap
    case'Above-mentioned maps'

Metname={'Cr+PCr' 'Glu+Gln' 'GPC+PCh' 'Ins' 'Lac' 'Lip13a' 'Lip13b' 'Lip13a+Lip13b' 'NAA+NAAG'};
    otherwise
Metname={'Cr+PCr' 'Glu+Gln' 'GPC+PCh' 'Ins' 'Lac' 'Lip13a' 'Lip13b' 'Lip13a+Lip13b' 'NAA+NAAG' newmapname};
end

for noMet=1:numel(Metname)
    tableidx=find(ismember(tableinfo,Metname{1,noMet})==1);
    if tableidx > 0
        %         Ratio2Cr(noMet,1)=str2num(tableinfo{tableidx-1});
        Std=(tableinfo{tableidx-2});
        NumStd(noMet,1)=str2num(Std(1:end-1));
        Conc(noMet,1)=str2num(tableinfo{tableidx-3});
    else
        %         Ratio2Cr(noMet,1)=0;
        NumStd(noMet,1)=str2num('999');
        Conc(noMet,1)=0;
    end
end

end