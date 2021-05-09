%% This function is written to create files for the data analysis. 
% Author: Sevim Cengiz, Bogazici University, 2020.
% Contact: sevim_cengiz@icloud.com

function CreatingAnalysisData(Pinfo,Metabolites,prob_cutoff)

out_Analysis=[Pinfo.spectrapath,filesep,'nifti',filesep,'MNI_Regist_Probabilistic',filesep];
if ~exist(out_Analysis,'dir')
    mkdir(out_Analysis);
end

pressboxmaskpath=[Pinfo.spectrapath,filesep,'nifti',filesep,'MNI_Regist',filesep];

for k=1:numel(Metabolites)
    PBmaskfile=dir([pressboxmaskpath,Pinfo.sparname,'_', Metabolites(k).name,'_PressBox_mask_reg_MNI.nii.gz']);
    PBmask=load_untouch_nii([PBmaskfile.folder,filesep,PBmaskfile.name]);
    [xsz ysz zsz]=size(PBmask.img);
    
    for x=1:xsz
        for y=1:ysz
            for z=1:zsz
                
                if PBmask.img(x,y,z)>=prob_cutoff
                    PBmask.img(x,y,z)=1;
                else
                    PBmask.img(x,y,z)=0;
                end
                
            end
        end
    end
    
    pressboxmaskpathprob=[Pinfo.spectrapath,filesep,'nifti',filesep,'Pressbox_prob_files'];
    if ~exist(pressboxmaskpathprob,'dir')
        mkdir(pressboxmaskpathprob);
    end
    PBmaskfilename1 = strsplit(PBmaskfile.name,'.nii.gz');
    PBmaskfilename1= [PBmaskfilename1{1,1},'_prob_'];
    PBmaskfilename2=sprintf('%0.2d.nii.gz',prob_cutoff);
    
    PBmaskfilenameout=[pressboxmaskpathprob,filesep,PBmaskfilename1,PBmaskfilename2];
    PBmask.folder=pressboxmaskpathprob;
    PBmask.untouch=1;
    save_untouch_nii(PBmask,PBmaskfilenameout);
    
    allfileslist=dir([pressboxmaskpath,Pinfo.sparname,'_',Metabolites(k).name,'_','*']);
    
    for m=1:numel(allfileslist)
        otherfile=  [allfileslist(m).folder,filesep,allfileslist(m).name];
        
        tf = strcmp([PBmaskfile.folder,filesep,PBmaskfile.name],otherfile);
        if tf==0
            
            otherfilevol=load_untouch_nii(otherfile);
            for x=1:xsz
                for y=1:ysz
                    for z=1:zsz
                        otherfilevol.img(x,y,z)=PBmask.img(x,y,z)*otherfilevol.img(x,y,z);
                    end
                end
            end
            
            filename=strsplit(allfileslist(m).name,'.nii.gz');
            otherfilenew = [out_Analysis,filename{1,1},'_prob_'];
            otherfilenewpat=sprintf('%0.2d.nii.gz',prob_cutoff);
            otherfilenewpath=[otherfilenew,otherfilenewpat];
            otherfilevol.untouch=1;
            save_untouch_nii(  otherfilevol, otherfilenewpath);
            
        end
    end
    
end
end

