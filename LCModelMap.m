%It finds concentration and std values of metabolites listed below. It
%doesn't check ratio values of metabolites because of the chemical shift
%displacement.

% we calculate tCr and mI ratio values of metabolites in the following
% steps considering chemical shift correction.

function [NumStd,Conc]=LCModelMap(tableinfo)

Metname={'Cr+PCr' 'Glu+Gln' 'GPC+PCh' 'Ins' 'Lac' 'Lip13a' 'Lip13b' 'Lip13a+Lip13b' 'NAA+NAAG'};

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