%% Load Patient spar file and create a struct which includes;

% Sevim Cengiz, Bogazici University, Turkey (2020-11-27)
% sevim_cengiz@icloud.com
% Esin Ozturk Isik, Bogazici University, Turkey
% Muhammed Yildirim, Bogazici University, Turkey

%% GUI First Page

% Pinfo = struct
[Pinfo]= loadfile();

% Oryx-MRSI has 2 visualization options: raw data visualization and .coord files visualizarion.
% This part is selection of data visualization.
% If user selects 1; It will call raw data visualization function.
% If user selects 2; It will call Coord file visualization function.
VisualOption = inputdlg({'For Raw Data Visualization write:1 -- For Coord file Visualization write:2'},'For Raw Data Visualization write:1 -- For Coord file Visualization write:2', [1 80]);
VisualOptionNo= str2double(VisualOption{1,1});

% If MRSI acquired after T1w-MRI, it is directly coregistered onto T1w-MRI.
% If MRSI acquired after T2w-MRI, it is directly coregistered onto T2w-MRI.

MRSIacquiredafter = inputdlg({'If MRSI acquired after T1w-MRI, write:1 -- If MRSI acquired after T2w-MRI, write:2'},'If MRSI acquired after T1w-MRI, write:1 -- If MRSI acquired after T2w-MRI, write:2', [1 100]);
MRSIacquiredafterNo= str2double(MRSIacquiredafter{1,1});

% It ask user to choose chemical shift corrention on or off.
chemshift_on_off = inputdlg({'For chemical shift on, write:1 -- For chemical shift off, write:2'},'Chemical Shift Correction on or off', [1 100]);
chemshift_on_off_no= str2double(chemshift_on_off{1,1});

% It asks user to write RF bandwidth values of your system.
if chemshift_on_off_no == 1
    RF_info= inputdlg({'Please write RF bandwidth values of your system. RF_ex_bw, RF_echo_bw, RF_echo2_bw, respectively. Example (Default Values): 4253 1269 1269'} ,'RF bandwidth values of your system', [1 100]);
    RF_values= str2num(RF_info{1,1});
    RF_ex_bw=RF_values(1,1);
    RF_echo_bw=RF_values(1,2);
    RF_echo2_bw=RF_values(1,3);
end

% Exclusion criteria cut-off values

Exc_info= inputdlg({'Please write cut-off values for CSF fraction, SNR, FWHM  CRLB, respectively. Example (Recommended Values): 0.30 8 0.10 30'} ,'Exclusion Criteria Values', [1 100]);
Exc_struct.value= str2num(Exc_info{1,1});
Exc_struct.name=[{'fcsf'}, {'SNR'}, {'FWHM'}, {'CRLB'}];

% Cutt-off value for probabilistic map of binary mask after MNI registration
Probcutinfo = inputdlg({'Cutt-off value for probabilistic map of binary mask after MNI registration. Example: 1(Recomended)'},'Probabilistic Map', [1 220]);
prob_cutoff=str2double(Probcutinfo{1,1});

%%%End GUI First Page


%% Start GUI 2. Page (Load Data Module)
%NOTE: slice number'a gore resultlari scroll bar yapsak efsane olur hocam. 

%%Load Data according to the button that user click (Raw/Coord Visualization)
% Oryx-MRSI has 2 visualization options: raw data visualization and .coord files visualizarion.
% This part is selection of data visualization.
% If user selects 1; It will call raw data visualization function.
% If user selects 2; It will call Coord file visualization function.

if VisualOptionNo == 1
    RawDataVisual(Pinfo.sparfilepath);
else
    CoordfilesVisual(Pinfo);
end

%%End GUI 2. Page

%% Metabolite names and  shifted ppm struct definition

Metname={'Cr+PCr' 'Glu+Gln' 'GPC+PCh' 'Ins' 'Lac' 'Lip13a' 'Lip13b' 'Lip13a+Lip13b' 'NAA+NAAG'};
shiftedppm=[3.03 2.25 3.2 3.52 1.3 1.3 1.3 1.3 2.02 ];

for n=1:numel(Metname)
    Metabolites(n).no=n;
    Metabolites(n).name=Metname{1,n};
    Metabolites(n).ppm=shiftedppm(1,n);
end
%% MRSI acquired after T1w-MRI or T2w-MRI

% If MRSI acquired after T1w-MRI, it is directly coregistered onto T1w-MRI.
% If MRSI acquired after T2w-MRI, it is directly coregistered onto T2w-MRI.
if  MRSIacquiredafterNo == 1
    %it is directly coregistered onto T1w-MRI
    Pinfo.MRI= [Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,Pinfo.name,'_Bet.nii.gz'];
else
    %it is directly coregistered onto T2w-MRI
    Pinfo.MRI= [Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T2',filesep,'nifti',filesep,Pinfo.name,'_Bet.nii.gz'];
end

%% Coregistration
% It includes binary mask of FOV and press box of each metabolites.

coreg_path=[Pinfo.spectrapath,filesep,'nifti',filesep,'coreg_binary_mask']; % Output files of coregistration binary masks.
if ~exist(coreg_path,'dir')
    mkdir(coreg_path);
end

for k=1:numel(Metabolites)
    
    MRIFOVMask_file=[coreg_path,filesep,Pinfo.sparname,'_',Metabolites(k).name,'_FOV_mask.nii'];
    MRIpressMask_file=[coreg_path,filesep,Pinfo.sparname,'_',Metabolites(k).name,'_PressBox_mask.nii'];
    
    if chemshift_on_off_no == 1
        
        [GR_ex, GR_echo,GR_echo2]=gradient_strength_calc(Pinfo.apVOI,Pinfo.lrVOI,Pinfo.ccVOI,RF_ex_bw,RF_echo_bw,RF_echo2_bw);
        [chem_shift_ex,chem_shift_echo,chem_shift_echo2]=Chem_Shift_calculation(Metabolites(k).ppm,GR_ex,GR_echo,GR_echo2);
        [Pinfo] = Mask_FOV_run_Pinfo(Pinfo,k,MRIFOVMask_file,chem_shift_ex,chem_shift_echo,chem_shift_echo2);
        [Pinfo] = Mask_Press_run_Pinfo(Pinfo,k,MRIpressMask_file,chem_shift_ex,chem_shift_echo,chem_shift_echo2);
    else
        [Pinfo] = Mask_FOV_run_Pinfo(Pinfo,k,MRIFOVMask_file,0,0,0);
        [Pinfo] = Mask_Press_run_Pinfo(Pinfo,k,MRIpressMask_file,0,0,0);
    end
    
end

%% GUI 3.Page (Coregistration Module)
%%GUI will show figure 
%%Slice numbera gore scroll bar super olur.

A= Pinfo.FOVimg(Metabolites(1).no).fig; %Cr
B= Pinfo.FOVimg(Metabolites(5).no).fig; %Lac
C=Pinfo.refimg.fig;

Fused_cr=imfuse(A,C);
Fused_cr = rgb2gray(Fused_cr);
Fused_cr = double(Fused_cr);

Fused_lac=imfuse(B,C);
Fused_lac = rgb2gray(Fused_lac);
Fused_lac = double(Fused_lac);
Fused_all=imfuse(A,Fused_lac,'falsecolor');
Fused_all = rgb2gray(Fused_all);
Fused_all = double(Fused_all);

figure,
subplot(3,1,1);
imagesc(Fused_cr),title(Metabolites(1).name);
colormap gray
axis off;
subplot(3,1,2);
imagesc(Fused_lac),title(Metabolites(5).name);
colormap gray
axis off;
subplot(3,1,3);
imagesc(Fused_all),title([Metabolites(1).name,' FOV box & ',Metabolites(5).name,' FOV box']);
axis off;

%%End 3.Page Coregistration Module 

%% Coreg of Little Voxels and calculation of fractions including CSF, WM and GM of these little voxels.

litoutpath=[Pinfo.spectrapath,filesep,'nifti',filesep,'binary_mask_littlevoxels'];
if ~exist(litoutpath,'dir')
    mkdir(litoutpath);
end


for k=1:numel(Metabolites)
    [sli row col]=size(Pinfo.littlevoxels);
    for isli=1:sli
        for irow=1:row
            for icol=1:col
                locname=sprintf('sl%d_r%d_c%d',isli,irow,icol);
                littleFOVMask_file=[litoutpath,filesep,Pinfo.sparname,'_',locname,'_',Metabolites(k).name,'_FOV_mask.nii'];
                
                if chemshift_on_off_no == 1
                    [Pinfo] = Mask_FOV_run_Pinfo_little(Pinfo,isli,irow,icol,k,littleFOVMask_file,chem_shift_ex,chem_shift_echo,chem_shift_echo2);
                else
                    [Pinfo] = Mask_FOV_run_Pinfo_little(Pinfo,isli,irow,icol,k,littleFOVMask_file,0,0,0);
                end
                
                
            end
        end
    end
end

%% Segmentation

% T1 segmentation

T1segmentation(Pinfo);

%% Volume of Fraction Calculation

if  MRSIacquiredafterNo == 1
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
        for isli=1:sli
            for irow=1:row
                for icol=1:col
                    [Pinfo]=VolFracCal(Pinfo,isli,irow,icol,k,csf_img,gm_img,wm_img);
                end
            end
        end
    end
    
else
    
    % T1w-MRI and CSF,WM and GM volumes will be registered onto T2w-MRI
    % because MRSI acquired after T2w-MRI.
    T1registrationtoT2(Pinfo);
    
    csf_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,'Regist_T1_to_T2',filesep,Pinfo.name,'_Bet_pve_0_reg_T1_to_T2.nii.gz'];
    gm_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,'Regist_T1_to_T2',filesep,Pinfo.name,'_Bet_pve_1_reg_T1_to_T2.nii.gz'];
    wm_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,'Regist_T1_to_T2',filesep,Pinfo.name,'_Bet_pve_2_reg_T1_to_T2.nii.gz'];
    [csf_img]=segmentation_imgs(csf_path);
    [gm_img]=segmentation_imgs(gm_path);
    [wm_img]=segmentation_imgs(wm_path);
    % onto T2w-MRI registered CSF, WM and GM volumes will be used for fraction calculation.
    
    for k=1:numel(Metabolites)
        [sli row col]=size(Pinfo.littlevoxels);
        for isli=1:sli
            for irow=1:row
                for icol=1:col
                    [Pinfo]=VolFracCal(Pinfo,isli,irow,icol,k,csf_img,gm_img,wm_img);
                end
            end
        end
    end
end



outmat=[Pinfo.mainpath,'exam_1',filesep,'spectra',filesep,'MAT'];
if ~exist(outmat,'dir')
    mkdir(outmat);
end

fgm= Pinfo.frac_GM;
outgm=[outmat,filesep,Pinfo.sparname,'_fGM.mat'];
save(outgm, 'fgm');
fwm= Pinfo.frac_WM;
outwm=[outmat,filesep,Pinfo.sparname,'_fWM.mat'];
save(outwm, 'fwm');
fcsf=Pinfo.frac_CSF;
outCSF=[outmat,filesep,Pinfo.sparname,'_fCSF.mat'];
save(outCSF, 'fcsf');

litvox_pixloc=Pinfo.metab;
outloc=[outmat,filesep,Pinfo.sparname,'_litvox_pixloc.mat'];
save(outloc,'litvox_pixloc','-v7.3');

%% LCModel output read and Concentration map generation
name=[Pinfo.coordpath,Pinfo.sparname] ;
for isli=1:sli
    for irow=1:row
        for icol=1:col
            
            tablename=sprintf('%s_sl%d_%d-%d.table', name, isli, irow, icol);
            
            if exist(tablename,'file')
                tableinfo=textread(tablename,'%s');
                [NumStd,Conc]=LCModelMap(tableinfo);
                AllNumStd(:,isli,irow,icol)=NumStd;
                AllConc(:,isli,irow,icol)=Conc;
                [FWHM,SNR]=LCMout_info(tableinfo);
                AllFWHM(isli,irow,icol)=FWHM;
                AllSNR(isli,irow,icol)=SNR;
            else
                Conc=zeros(numel(Metname),1);
                NumStd=zeros(numel(Metname),1);
                NumStd(:,1)=999;
                AllNumStd(:,isli,irow,icol)=NumStd;
                AllConc(:,isli,irow,icol)=Conc;
                AllFWHM(isli,irow,icol)=str2num('2'); % If FWHM not found,number 2 is given to label FWHM for exclusion the voxel.
                AllSNR(isli,irow,icol)=str2num('0');% If SNR not found,number 0 is given to label SNR for exclusion the voxel.
                
            end
        end
    end
end

outCONC=[outmat,filesep,Pinfo.sparname,'_CONC.mat'];
save(outCONC,'AllConc');
outNumStd=[outmat,filesep,Pinfo.sparname,'_NumStd.mat'];
save(outNumStd,'AllNumStd');
outFWHM=[outmat,filesep,Pinfo.sparname,'_FWHM.mat'];
save(outFWHM,'AllFWHM');
outSNR=[outmat,filesep,Pinfo.sparname,'_SNR.mat'];
save(outSNR,'AllSNR');
%% Start GUI 4.Page Segmentation Module Figures 

% NOTE: Slice numbera gore scroll bar olabilir. 
% Fraction Figures in Segmentation Part
WhichMetab = inputdlg({'Which metabolite of fractions do you want to figure? Write: 1 for "Cr+PCr",2 for "Glu+Gln", 3 for "GPC+PCh", 4 for "Ins",5 for "Lac", 6 for "Lip13a", 7 for "Lip13b", 8 for "Lip13a+Lip13b", 9 for "NAA+NAAG" '},'Which Metabolite', [1 220]);
WhichMetabNo=str2double(WhichMetab{1,1});

figure,
count=1;
for isli=1:sli
    
    subplot(sli,3,count);
    imagesc(squeeze(fcsf(WhichMetabNo,isli,:,:)));title(sprintf('CSF at slice %d',isli)); colorbar
    count=count+1;
    subplot(sli,3,count);
    imagesc(squeeze(fwm(WhichMetabNo,isli,:,:)));title(sprintf('WM at slice %d',isli)); colorbar
    count=count+1;
    subplot(sli,3,count);
    imagesc(squeeze(fgm(WhichMetabNo,isli,:,:)));title(sprintf('GM at slice %d',isli)); colorbar
    count=count+1;
end
%%%END GUI 4.Page Segmentation Module Figures 
%% Start GUI 5.Page FWHM and SNR Figure

figure,
count=1;
for isli=1:sli
    
    subplot(sli,2,count);
    imagesc(squeeze(AllFWHM(isli,:,:)));title(sprintf('FWHM at slice %d',isli)); colorbar
    count=count+1;
    subplot(sli,2,count);
    imagesc(squeeze(AllSNR(isli,:,:)));title(sprintf('SNR at slice %d',isli)); colorbar
    count=count+1;
    
end
%%End GUI 5.Page FWHM and SNR Figure
%% Start of GUI 6.Page Included Voxels Module
%Note slice noya gore scroll bar olabilir
%Application of Exclusion Critetia and figure of included criteria

[includedvoxels]=ExclusionCriteria(Pinfo,AllFWHM,AllSNR,AllNumStd,Metname,Metabolites,outmat,Exc_struct);
WhichMetab = inputdlg({'Which metabolite of included voxels do you want to figure? Write: 1 for "Cr+PCr",2 for "Glu+Gln", 3 for "GPC+PCh", 4 for "Ins",5 for "Lac", 6 for "Lip13a", 7 for "Lip13b", 8 for "Lip13a+Lip13b", 9 for "NAA+NAAG" '},'Which Metabolite', [1 220]);
WhichMetabNo=str2double(WhichMetab{1,1});

figure,
for isli=1:sli
    subplot(1,sli,isli)
    imagesc(squeeze(includedvoxels(WhichMetabNo,isli,:,:)));title(sprintf('Included Voxels at slice %d',isli)); colorbar
end
%%End of GUI 6.Page Included Voxels Module

%% Metabolite Concetration Map and Corrected Metabolite Concentration Map Generation
Conc_Map_Generation(Pinfo,AllConc,coreg_path,Metabolites,includedvoxels);
corrected_conc_map_generation(Pinfo,AllConc,coreg_path,Metabolites,includedvoxels);


%% Start of GUI 7.Page Metabolite Image Module Production
%%Figure of Conc map of reference image
refnii=[Pinfo.spectrapath,filesep,'nifti',filesep,'conc_maps',filesep,Pinfo.sparname,'_NAA+NAAG_conc.nii'];
[three_plane_img]=fig_volumes(Pinfo,refnii);
Fused_img=imfuse(three_plane_img,Pinfo.refimg.fig);
Fused_img = rgb2gray(Fused_img);
Fused_img = double(Fused_img);
figure,
subplot(2,1,1);
imagesc(three_plane_img),title('NAA concentration map volume');
colormap gray
axis off;
subplot(2,1,2);
imagesc(Fused_img),title('Fused NAA concentration map volume and structutal MRI image');
colormap gray
axis off;
%%End of GUI 7.Page Metabolite Image Module Production

%% Metabolite /Cr+PCr and /Ins Map Generation and Corrected Metabolite /Cr+PCr and /Ins Map Generation
Conc_to_Ratio_Maps(Pinfo);
corrected_conc_maps_to_ratio_maps(Pinfo);
%% MNI152Brain atlas Registration
MNI_brain_Registration(Pinfo,MRSIacquiredafterNo);

%% Start of GUI 8.Page Registration to MNI atlas Module

%%Figure of Conc map of reference image registered onto MNI152 brain atlas
refnii=[Pinfo.spectrapath,filesep,'nifti',filesep,'MNI_regist',filesep,Pinfo.sparname,'_NAA+NAAG_conc_reg_MNI.nii.gz'];
[three_plane_img]=fig_volumes(Pinfo,refnii);
registmni=[Pinfo.spectrapath,filesep,'nifti',filesep,'MNI_regist',filesep,'reg_to_MNI.nii.gz'];
[three_plane_img2]=fig_volumes(Pinfo,registmni);
Fused_img=imfuse(three_plane_img,three_plane_img2);
Fused_img = rgb2gray(Fused_img);
Fused_img = double(Fused_img);
figure,
subplot(2,1,1);
imagesc(three_plane_img),title('NAA concentration map volume registered to MNI152 brain atlas');
colormap gray
axis off;
subplot(2,1,2);
imagesc(Fused_img),title('Fused NAA concentration map volume and structutal MRI image');
colormap gray
axis off;
%%End of GUI 8.Page Registration to MNI atlas Module

%% Registration Mask and Analysis Folder Creation

CreatingAnalysisData(Pinfo,Metabolites,prob_cutoff);

