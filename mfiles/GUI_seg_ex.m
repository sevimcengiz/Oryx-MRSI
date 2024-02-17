df%% This function is written to calculate volume fraction.
% If chemical shift correction button is on, the volume fractions at each slice, row and column of all
% metabolites are calculated considering the chemical shift correction.
% If MRSI is acquired after T1w-MRI, CSF, WM and GM segmentation is used
% directly. However, if MRSI is acquired after T2w-MRI, all CSF, WM, and GM volumes, which are the segmentation volumes of T1w-MRI, are registered onto T2w-MRI.
% For more detail information of the registration onto T2w-MRI, please
% check T1registrationtoT2.m file.
%% This function creates conc, std, FWHM, SNR maps of the voxels.

% Author: Sevim Cengiz, Bogazici University, Turkey (2020-11-27)
% Contact: sevim_cengiz@icloud.com


function [Pinfo, AlFWHM, AlSNR, AllNumStd, AllConc]=GUI_seg(UIFigure,Metabolites,Pinfo, chem_shift_ex, chem_shift_echo, chem_shift_echo2,ChemicalshiftcorrectionButtonGroup_SelectedObject_Text,MRSIacquiredafterButtonGroup_SelectedObject_Text,litoutpath,RFOV_dir,newmap,newmapname,newmapppm)
wait=uiprogressdlg(UIFigure,'Message','This process will take some time (~30 min).','Title','Segmentation');

T1segmentation(Pinfo);

switch newmap
    case'Above-mentioned maps'

Metname={'Cr+PCr' 'Glu+Gln' 'GPC+PCh' 'Ins' 'Lac' 'Lip13a' 'Lip13b' 'Lip13a+Lip13b' 'NAA+NAAG'};
    otherwise
Metname={'Cr+PCr' 'Glu+Gln' 'GPC+PCh' 'Ins' 'Lac' 'Lip13a' 'Lip13b' 'Lip13a+Lip13b' 'NAA+NAAG' newmapname};
end


name=[Pinfo.coordpath,Pinfo.sparname];   %% for LCModel output read and Concentration map generation
n=1;
counter=1;
%% Volume of Fraction Calculation

switch MRSIacquiredafterButtonGroup_SelectedObject_Text
    %% mrsi acquired after t1w-mri
    case 'T1w-MRI'
        % CSF, WM, and GM volumes will be used for fraction calculation of each little voxels.
        
        csf_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,Pinfo.name,'_Bet_pve_0.nii.gz'];
        gm_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,Pinfo.name,'_Bet_pve_1.nii.gz'];
        wm_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,Pinfo.name,'_Bet_pve_2.nii.gz'];
        [csf_img]=ext_unzip(csf_path);
        [gm_img]=ext_unzip(gm_path);
        [wm_img]=ext_unzip(wm_path);
        
        %Volume fraction calculation at each slice, row and column of all
        %metabolites. (Due to the chemical shift correction, each metabolite has different FOX box and little voxels locations.)

        for k=1:numel(Metabolites)
            
            [sli row col]=size(Pinfo.littlevoxels);
            maxcount=numel(Metabolites)*sli*row*col;
            for isli=1:sli
                for irow=1:row
                    for icol=1:col
                        
                        counter=counter+1;
                        wait.Value=0.9/(((maxcount)/counter));
                        
                        %Creating mask of each spectra voxel (little voxels)
                        locname=sprintf('sl%d_r%d_c%d',isli,irow,icol);
                        littleFOVMask_file=[litoutpath,filesep,Pinfo.sparname,'_',locname,'_',Metabolites(k).name,'_FOV_mask.nii'];
                        n=n+1;
                        
                        switch ChemicalshiftcorrectionButtonGroup_SelectedObject_Text
                            case 'On'
                                [Pinfo] = Mask_FOV_run_Pinfo_little(Pinfo,isli,irow,icol,k,littleFOVMask_file,chem_shift_ex(k).no,chem_shift_echo(k).no,chem_shift_echo2(k).no,RFOV_dir);
                                
                            otherwise
                                chem_shift_ex(k).no=0;
                                chem_shift_echo(k).no=0;
                                chem_shift_echo2(k).no=0;
                                [Pinfo] = Mask_FOV_run_Pinfo_little(Pinfo,isli,irow,icol,k,littleFOVMask_file,chem_shift_ex(k).no,chem_shift_echo(k).no,chem_shift_echo2(k).no,RFOV_dir);
                        end
                        
                        [Pinfo]=VolFracCal(Pinfo,isli,irow,icol,k,csf_img,gm_img,wm_img);
                        
                        tablename=sprintf('%s_sl%d_%d-%d.table', name, isli, irow, icol);
                        
                        if exist(tablename,'file')
                            tableinfo=textread(tablename,'%s');
                            [NumStd,Conc]=LCModelMap(tableinfo,newmap,newmapname,newmapppm);
                            AllNumStd(:,isli,irow,icol)=NumStd;
                            AllConc(:,isli,irow,icol)=Conc;
                            [FWHM,SNR]=LCMout_info(tableinfo);
                            AlFWHM(isli,irow,icol)=FWHM;
                            AlSNR(isli,irow,icol)=SNR;
                        else
                            Conc=zeros(numel(Metname),1);
                            NumStd=zeros(numel(Metname),1);
                            NumStd(:,1)=999;
                            AllNumStd(:,isli,irow,icol)=NumStd;
                            AllConc(:,isli,irow,icol)=Conc;
                            AlFWHM(isli,irow,icol)=str2num('2'); % If FWHM not found,number 2 is given to label FWHM for exclusion the voxel.
                            AlSNR(isli,irow,icol)=str2num('0');% If SNR not found,number 0 is given to label SNR for exclusion the voxel.
                            
                        end
                        
                        
                        Pinfo.metab(k).littlevoxels(isli,irow,icol).littlemask=[];
                        
                        
                        
                    end
                end
            end
        end
        
        %% MRSI acquired after t2w-mri
    otherwise % T2w-MRI
        
        T1registrationtoT2(Pinfo);
        % T1w-MRI and CSF,WM and GM volumes will be registered onto T2w-MRI
        % because MRSI acquired after T2w-MRI.
        
        csf_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,'Regist_T1_to_T2',filesep,Pinfo.name,'_Bet_pve_0_reg_T1_to_T2.nii.gz'];
        gm_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,'Regist_T1_to_T2',filesep,Pinfo.name,'_Bet_pve_1_reg_T1_to_T2.nii.gz'];
        wm_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,'Regist_T1_to_T2',filesep,Pinfo.name,'_Bet_pve_2_reg_T1_to_T2.nii.gz'];
        [csf_img]=ext_unzip(csf_path);
        [gm_img]=ext_unzip(gm_path);
        [wm_img]=ext_unzip(wm_path);
        
        
        % onto T2w-MRI registered CSF, WM and GM volumes will be used for fraction calculation.
        
        for k=1:numel(Metabolites)
            [sli row col]=size(Pinfo.littlevoxels);
            maxcount=numel(Metabolites)*sli*row*col;
            for isli=1:sli
                for irow=1:row
                    for icol=1:col
                        
                        counter=counter+1;
                        wait.Value=0.9/(((maxcount)/counter));
                        
                        %Creating mask of each spectra voxel (little voxels)
                        locname=sprintf('sl%d_r%d_c%d',isli,irow,icol);
                        littleFOVMask_file=[litoutpath,filesep,Pinfo.sparname,'_',locname,'_',Metabolites(k).name,'_FOV_mask.nii'];
                        
                        n=n+1;
                        %                         wait.Value=0.5*(n/(numel(Metabolites)*sli*row*col));
                        
                        switch ChemicalshiftcorrectionButtonGroup_SelectedObject_Text
                            case 'On'
                                [Pinfo] = Mask_FOV_run_Pinfo_little(Pinfo,isli,irow,icol,k,littleFOVMask_file,chem_shift_ex(k).no,chem_shift_echo(k).no,chem_shift_echo2(k).no,RFOV_dir);
                            otherwise
                                chem_shift_ex(k).no=0;
                                chem_shift_echo(k).no=0;
                                chem_shift_echo2(k).no=0;
                                [Pinfo] = Mask_FOV_run_Pinfo_little(Pinfo,isli,irow,icol,k,littleFOVMask_file,chem_shift_ex(k).no,chem_shift_echo(k).no,chem_shift_echo2(k).no,RFOV_dir);
                        end
                        
                        [Pinfo]=VolFracCal(Pinfo,isli,irow,icol,k,csf_img,gm_img,wm_img);
                        
                        
                        tablename=sprintf('%s_sl%d_%d-%d.table', name, isli, irow, icol);
                        
                        if exist(tablename,'file')
                            tableinfo=textread(tablename,'%s');
                            [NumStd,Conc]=LCModelMap(tableinfo,newmap,newmapname,newmapppm);
                            AllNumStd(:,isli,irow,icol)=NumStd;
                            AllConc(:,isli,irow,icol)=Conc;
                            [FWHM,SNR]=LCMout_info(tableinfo);
                            AlFWHM(isli,irow,icol)=FWHM;
                            AlSNR(isli,irow,icol)=SNR;
                        else
                            Conc=zeros(numel(Metname),1);
                            NumStd=zeros(numel(Metname),1);
                            NumStd(:,1)=999;
                            AllNumStd(:,isli,irow,icol)=NumStd;
                            AllConc(:,isli,irow,icol)=Conc;
                            AlFWHM(isli,irow,icol)=str2num('2'); % If FWHM not found,number 2 is given to label FWHM for exclusion the voxel.
                            AlSNR(isli,irow,icol)=str2num('0');% If SNR not found,number 0 is given to label SNR for exclusion the voxel.
                            
                        end
                        
                        Pinfo.metab(k).littlevoxels(isli,irow,icol).littlemask=[];
                        
                    end
                end
            end
        end
end

