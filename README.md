[![Website monip.org](https://img.shields.io/website-up-down-green-red/http/monip.org.svg)](https://sevimcengiz.github.io/)
[![Documentation Status](https://readthedocs.org/projects/ansicolortags/badge/?version=latest)](https://sevimcengiz.github.io/oryx/)
![Open Source? Yes!](https://badgen.net/badge/Open%20Source%20%3F/Yes%21/blue?icon=github)
[![Ask Me Anything !](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)](https://github.com/sevimcengiz)
# Oryx-MRSI
<img src="https://user-images.githubusercontent.com/5468765/108315274-9c0c7680-71d4-11eb-9040-7e6248ea55b8.png" width="100" height="100">
Oryx-MRSI is a fully automated and complementary software for a comprehensive multi-slice proton magnetic resonance spectroscopic imaging (1H-MRSI) data analysis. It includes multi-slice MRSI raw data and LCModel .coord file output visualizations, tissue fraction calculation, chemical shift correction, metabolite maps generation, registration onto MNI152 brain atlas,atlas-based ROI analysis, and distributions.

# Features
- ```Main Page``` The user needs to provide parameters for the multi-slice 1H-MRSI data.
  Required parameters: 
 
   a. Exclusion criteria for fCSF, SNR, FWHM, CRLB 
 
   b. RF bandwidhth of the system for chemical shift correction 
 
   c. Cut-off value for the probabilistic binary map after registration
   
   d. Chemical shift correction is ```On``` or ```Off```
   
   e. RFOV dir is ```RL``` or ```AP```
   
   f. Chemical shift dir (AP) is ```A``` or ```P```
   
   g. Chemical shift dir (LR) is ```L``` or ```R```
   
   h. Chemical shift dir (FH) is ```F``` or ```H```
   
   i. Reference metabolite

- ```Load Data``` Reads the raw 1H-MRSI data (Spar or MRS-NIfTI format) and LCModel .coord otput files for raw data and Coord file visualization of spectra.

- ```Co-registration``` Coregisters FOV,Press-Box(VOI), all voxels of spectra considering chemical shift correction if chemical shift correction is 'On'.

- ```Segmentation``` Calculation of WM, GM, CSF fractions in each voxel of all metabolites considering chemical shift correction. 

- ```CRLB-FWHM-SNR``` Visualization of CRLB, FWHM and SNR values.

- ```Spectral Quality``` Visualization of included voxels into the 1H-MRSI data analysis after exclusion criteria values considering FWHM, SNR, CRLB, and fCSF. It also enables manual exclusion/includion.

- ```Metabolite Map``` All metabolite results are used to create metabolite maps including: 
  - concentration map,
  - concentration map to Ins ratio, 
  - concentration map to Cr+PCr ratio,
  - CSF corrected concentration map, 
  - CSF corrected concentration map to Ins ratio,
  - CSF corrected concentration map to Cr+PCr ratio.

- ```Registration``` Generates MNI152 brain atlas-Registered metabolite maps including the outputs created in the previous module.

- ```ROI Analysis``` Region of interest (ROI) analysis at multiple brain atlases like [Schafer2018 100/400 Parcels on 7 resting-state (rs-fMRI) networks](https://pubmed.ncbi.nlm.nih.gov/28981612/) or [MNI thr 0/25/50 brain regions](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/Atlases). 
- ```Distributions``` The box-plot visualization of specta at the selected brain region.

# Prerequirements
- [MATLAB R2020b](https://www.fil.ion.ucl.ac.uk/spm/software/download/)
- [FSL](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSL) for FLIRT 
- [SPM12](https://www.fil.ion.ucl.ac.uk/spm/software/download/)
- [GUI Layout Toolbox](https://www.mathworks.com/matlabcentral/fileexchange/47982-gui-layout-toolbox)
- [Widgets Toolbox](https://www.mathworks.com/matlabcentral/fileexchange/66235-widgets-toolbox-compatibility-support)
- Oryx-MRSI is tested on MAC (2.9 GHz Quad-Core Intel Core i7, 16 GB 2133 MHz LPDDR3, Radeon Pro 560 4 GB
Intel HD Graphics 630 1536 MB ) and Ubuntu 18.04.4 LTS (Memory 32GIB, Processor Intel Core i7-9800X CPU @3.8GHzx16, Graphics GeForce RTX 2070/PCle/SSE2)

# Installation
Oryx-MRSI uses FSL-Flirt function so using FSL from MATLAB should be ready. 

If you want to install FSL into your computer, check [this link](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation)

If you use ```MAC```, check [this link](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation/MacOsX) (Advance Usage part-Using FSL from MATLAB)

If you use ```LINUX```, check [this link](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation/Linux) (Using FSL from MATLAB)

Plase download SPM12 using [this link](https://www.fil.ion.ucl.ac.uk/spm/software/download/)

Download Oryx-MRSI from Github repository,

Addpath Oryx-MRSI with subfolders.

Addpath SPM12 with subfolders.

Please make sure that FSL usage from Matlab command window installation is completed properly.
Before running a data analysis using Oryx-MRSI, let's check that FSL usage is from Matlab is done.

Please open matlab and run ```check_fsl_usage_from_matlab.m``` script which is given under Oryx-MRSI Github repo.

If there is no error, FSL usage from Matlab is completely installed.

If you get an error, plese check these:

   If you use ```MAC```, check [this link](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation/MacOsX) (Advance Usage part-Using FSL from MATLAB)
    
   If you use ```LINUX```, check [this link](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation/Linux) (Using FSL from MATLAB)

# How to get started and User Documentation and YouTube links
- [Oryx-MRSI Documentation](https://sevimcengiz.github.io/oryx/)

- [YouTube videos](https://www.youtube.com/channel/UCopJKJyorr-HztT-xGIe7iQ)


# Developers

Sevim Cengiz

Muhammed Yildirim

Abdullah Bas

Esin Ozturk Isik

Should you publish material that made use of Oryx-MRSI, please cite the following publication:

**Cengiz S, Yildirim M,Bas A, Ozturk-Isik E. ORYX-MRSI: A fully-automated open-source software for proton magnetic resonance spectroscopic imaging data analysis. Int J Imaging Syst Technol. 2022;1‐16.[doi:10.1002/ima.22748](https://doi.org/10.1002/ima.22748) **

# Release
- Version 1.1

# Help and Support
- There isn't known any bug or issue up to now. 
- If you see any bug or issue, please  submit a topic in issues, or contact: sevim_cengiz@icloud.com
- If you support or contribute the code, most welcome to Oryx-MRSI Github Repository.

# License
- MIT License

# Acknowledgement
- This project was funded by TUBITAK 115S219. We thank all open-source MR and MRS tools. 
- Oryx-MRSI uses some functions of [FID-A](https://github.com/CIC-methods/FID-A), check [this link](https://github.com/CIC-methods/FID-A/blob/master/LICENSE.txt) for license.
- Oryx-MRSI uses some functions of [Gannet](https://github.com/richardedden/Gannet3.1).
    - Edden RAE, Puts NAJ, Harris AD, Barker PB, Evans CJ. Gannet: A batch-processing tool for the quantitative analysis of gamma-aminobutyric acid-edited MR      spectroscopy spectra. J. Magn. Reson. Imaging 2014;40:1445–1452. doi: 10.1002/jmri.24478)
- Oryx-MRSI uses some functions of [Osprey](https://github.com/schorschinho/osprey), check [this link](https://github.com/schorschinho/osprey/blob/develop/LICENSE.md) for license.
    - G Oeltzschner, HJ Zöllner, SCN Hui, M Mikkelsen, MG Saleh, S Tapper, RAE Edden. Osprey: Open-Source Processing, Reconstruction & Estimation of Magnetic Resonance Spectroscopy Data. J Neurosci Meth 343:108827 (2020).
- Oryx-MRSI uses some functions of [MRS_MRI_libs](https://github.com/chenkonturek/MRS_MRI_libs), check [this link](https://github.com/chenkonturek/MRS_MRI_libs/blob/master/LICENSE) for license.
- Oryx-MRSI uses some functions of [NIFTI-Matlab](https://github.com/NIFTI-Imaging/nifti_matlab), check [this link](https://github.com/NIFTI-Imaging/nifti_matlab/blob/master/license.txt) for license.
- Oryx-MRSI uses some functions of [dicm2nii](https://github.com/xiangruili/dicm2nii), check [this link](https://github.com/xiangruili/dicm2nii/blob/master/LICENSE) for license.
- Oryx-MRSI uses some functions written by [Jamie Near](https://www.mcgill.ca/psychiatry/jamie-near) (McGill University)
- Oryx-MRSI uses some functions written by [H.Ratiney](https://www.creatis.insa-lyon.fr/site7/en/users/ratiney) (CREATIS-LRMN) 
- Oryx-MRSI uses Schaefer2018_100/400Parcels_7Networks_order_FSLMNI152_2mm.nii. See Github [link](https://github.com/ThomasYeoLab/Standalone_CBIG_fMRI_Preproc2016), for [license](https://github.com/ThomasYeoLab/Standalone_CBIG_fMRI_Preproc2016/blob/master/LICENSE.md).
- Oryx-MRSI uses MNI152_T1_2mm_brain.nii.gz, MNI-maxprob-thr0/25/50-2mm.nii.gz acquired from [FSL](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/Atlases), for [license](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/License). 
- If there is any function that I forget to mention about name/link/citation, please let me know.

