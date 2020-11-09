function CreatingAnalysisData(Pinfo,Metabolites,prob_cutoff)


out_Analysis=[Pinfo.spectrapath,filesep,'nifti',filesep,'MNI_Regist_Probabilistic',filesep];
if ~exist(out_Analysis,'dir')
    mkdir(out_Analysis);
end

pressboxmaskpath=[Pinfo.spectrapath,filesep,'nifti',filesep,'MNI_Regist',filesep];
pressboxmasklist=dir([pressboxmaskpath,'*PressBox_mask_reg_MNI.nii.gz']);

for i=1:numel(pressboxmasklist)
    
    PBmaskfile=[pressboxmasklist(i).folder,filesep, pressboxmasklist(i).name];
    PBmask=load_untouch_nii(PBmaskfile);
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

    [seperatepath,matches]=strsplit(PBmaskfile,'_');
    for k=1:numel(Metabolites)
        [r,c]=find(strcmp(seperatepath,Metabolites(k).name));
        
        if r>0 
            break
        end
    end
    metname=seperatepath(1,(c));
    
    allfiles=[Pinfo.spectrapath,filesep,'nifti',filesep,'MNI_Regist',filesep];
    metfind=sprintf('*%s*',metname{1,1});
    allfileslist=dir([pressboxmaskpath, metfind]);
    
    for m=1:numel(allfileslist)
        otherfile=  [allfileslist(m).folder,filesep,allfileslist(m).name];
        
        tf = strcmp(PBmaskfile,otherfile);
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
        otherfilenewpat=sprintf('%d.nii.gz',prob_cutoff);
        otherfilenewpath=[otherfilenew,otherfilenewpat];
        otherfilevol.untouch=1;
        save_untouch_nii(  otherfilevol, otherfilenewpath);
         end
    end
    
end
end
