function corrected_conc_maps_to_ratio_maps(Pinfo)

out_MetMaps=[Pinfo.spectrapath,filesep,'nifti',filesep,'corrected_conc_maps',filesep];
folder=dir([out_MetMaps,Pinfo.sparname,'*.nii']);

%% Metabolite / Cr+PCr volume generation

Metname={'Glu+Gln' 'GPC+PCh' 'Ins' 'Lac' 'Lip13a' 'Lip13b' 'Lip13a+Lip13b' 'NAA+NAAG'};

for n=1:numel(Metname)
    Metabolites(n).no=n;
    Metabolites(n).name=Metname{1,n};
end


CrPCr=dir([out_MetMaps,Pinfo.sparname,'*_Cr+PCr_conc_corrected.nii']);
CrPCr_path=[CrPCr.folder,filesep,CrPCr.name];
CrPCr_mask=load_untouch_nii(CrPCr_path);
[xsz ysz zsz]=size(CrPCr_mask.img);

out_MetMaps_CrPCrRatio=[Pinfo.spectrapath,filesep,'nifti',filesep,'corrected_conc_maps_to_tCr_ratio',filesep];
if ~exist(out_MetMaps_CrPCrRatio,'dir')
    mkdir(out_MetMaps_CrPCrRatio);
end

metno=size(Metabolites);
for n=1:metno(1,2)
    
    
    Metab_path=[out_MetMaps,Pinfo.sparname,'_',Metabolites(n).name,'_conc_corrected.nii'];
    Metab_mask=load_untouch_nii(Metab_path);
    
    MetabCrPCrRatio=zeros(xsz,ysz,zsz);
    for x=1:xsz
        for y=1:ysz
            for z=1:zsz
                if Metab_mask.img(x,y,z)>0 & CrPCr_mask.img(x,y,z)>0
                    
                    MetabCrPCrRatio(x,y,z)= Metab_mask.img(x,y,z)/CrPCr_mask.img(x,y,z);
                end
            end
        end
    end
    
    MetabCrRatio_path=[out_MetMaps_CrPCrRatio,filesep,Pinfo.sparname,'_',Metabolites(n).name,'_conc_to_tCr_ratio_corrected.nii'];
    Metab_mask.untouch=1;
    Metab_mask.img=MetabCrPCrRatio;
    Metab_mask.fileprefix= MetabCrRatio_path;
    save_untouch_nii(Metab_mask, MetabCrRatio_path)
    
end

%% Metabolite /Ins volume generation


Metname2={'Cr+PCr' 'Glu+Gln' 'GPC+PCh' 'Lac' 'Lip13a' 'Lip13b' 'Lip13a+Lip13b' 'NAA+NAAG'};


for n=1:numel(Metname2)
    Metabolites2(n).no=n;
    Metabolites2(n).name=Metname2{1,n};
end



Ins=dir([out_MetMaps,Pinfo.sparname,'*_Ins_conc_corrected.nii']);
Ins_path=[Ins.folder,filesep,Ins.name];
Ins_mask=load_untouch_nii(Ins_path);

out_MetMaps_InsRatio=[Pinfo.spectrapath,filesep,'nifti',filesep,'corrected_conc_maps_to_Ins_ratio',filesep];
if ~exist(out_MetMaps_InsRatio,'dir')
    mkdir(out_MetMaps_InsRatio);
end

metno2=size(Metabolites2);
for n=1:metno2(1,2)
      
    Metab_path=[out_MetMaps,Pinfo.sparname,'_',Metabolites2(n).name,'_conc_corrected.nii'];
    Metab_mask=load_untouch_nii(Metab_path);

    MetabInsRatio=zeros(xsz,ysz,zsz);
    for x=1:xsz
        for y=1:ysz
            for z=1:zsz
                if Metab_mask.img(x,y,z)>0 & Ins_mask.img(x,y,z)>0
                    MetabInsRatio(x,y,z)= Metab_mask.img(x,y,z)/Ins_mask.img(x,y,z);
                end
            end
        end
    end
    
    MetabInsRatio_path=[out_MetMaps_InsRatio,filesep,Pinfo.sparname,'_',Metabolites2(n).name,'_conc_to_Ins_ratio_corrected.nii'];
    Metab_mask.untouch=1;
    Metab_mask.img=MetabInsRatio;
    Metab_mask.fileprefix= MetabInsRatio_path;
    save_untouch_nii(Metab_mask, MetabInsRatio_path)
    
end
end