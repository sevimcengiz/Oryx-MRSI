# Oryx-MRSI
<img src="https://user-images.githubusercontent.com/5468765/108315274-9c0c7680-71d4-11eb-9040-7e6248ea55b8.png" width="100" height="100">
Oryx-MRSI is a fully automated software for a comprehensive clinic 3D multivoxel proton magnetic resonance spectroscopic imaging (1H-MRSI) data analysis from the top on down. 

# Features
- ```Main Page``` The user needs to provide parameters for the 3D multivoxel 1H-MRSI data.
  Required parameters: 
 
   a. exclusion criteria for fCSF, SNR, FWHM, CRLB 
 
   b. RF bandwidhth of the system for chemical shift correction 
 
   c. cut-off value for the probabilistic binary map after registration

- ```Load Data``` Reads the raw 1H-MRSI data and LCModel otput files for raw data and Coord file visualization of spectra.

- ```Co-registration``` Coregisters FOV,Press-Box(VOI), all voxels of spectra considering chemical shift correction if chemical shift correction is 'On'.

- ```Segmentation``` Calculation of WM, GM, CSF fractions in each voxel of all metabolites considering chemical shift correction. 

- ```FWHM-SNR``` Visualization of FWHM and SNR values for all voxels

- ```Included Voxels``` Visualization of included voxels into the 1H-MRSI data analysis after exclusion criteria values considering FWHM, SNR, CRLB, and fCSF. 

- ```Metabolite Map``` All metabolite results are used to create metabolite maps including: 
  - concentration map,
  - concentation map to Ins or Cr+PCr ratio 
  - CSF corrected concentration map, 
  - CSF corrected concentration map to Ins or Cr+PCr ratio.

- ```Registration``` Generates MNI-Registered metabolite maps including the outputs created in the previous module.

- ```ROI Analysis``` Region of interest (ROI) analysis at multiple brain atlases like Schafer2018 100/400 Parcels on 7 resting-state (rs-fMRI) networks[*](https://pubmed.ncbi.nlm.nih.gov/28981612/) or MNI thr 0/25/50 brain regions[*](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/Atlases). 


# Prerequiretes 
- [MATLAB R2020a](https://www.fil.ion.ucl.ac.uk/spm/software/download/)
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

# How to get started

# Release
- Version 1.0

# User Documentation
- Please, read the documentation in the Github Repository. 
- [Oryx-MRSI Documentation](http://sevimcengiz.github.io/)

# Help and Support
- There isn't known any bug or issue up to now. 
- If you see any bug or issue, please contact: sevim_cengiz@icloud.com
- If you support or contribute the code, please contact: sevim_cengiz@icloud.com

# Licencing
- Apache-2.0 License

# Acknowledgement
- This project was funded by TUBITAK 115S219. We thank all open-source MR and MRS tools. 
- Oryx-MRSI uses some functions of [FID-A](https://github.com/CIC-methods/FID-A), check [this link](https://github.com/CIC-methods/FID-A/blob/master/LICENSE.txt) for licence.
- Oryx-MRSI uses some functions of [Gannet](https://github.com/richardedden/Gannet3.1).
    - Edden RAE, Puts NAJ, Harris AD, Barker PB, Evans CJ. Gannet: A batch-processing tool for the quantitative analysis of gamma-aminobutyric acid-edited MR      spectroscopy spectra. J. Magn. Reson. Imaging 2014;40:1445–1452. doi: 10.1002/jmri.24478)
- Oryx-MRSI uses some functions of [Osprey](https://github.com/schorschinho/osprey), check [this link](https://github.com/schorschinho/osprey/blob/develop/LICENSE.md) for licence.
    - G Oeltzschner, HJ Zöllner, SCN Hui, M Mikkelsen, MG Saleh, S Tapper, RAE Edden. Osprey: Open-Source Processing, Reconstruction & Estimation of Magnetic Resonance Spectroscopy Data. J Neurosci Meth 343:108827 (2020).
- Oryx-MRSI uses some functions of [MRS_MRI_libs](https://github.com/chenkonturek/MRS_MRI_libs), check [this link](https://github.com/chenkonturek/MRS_MRI_libs/blob/master/LICENSE) for license.
- Oryx-MRSI uses some functionf of [NIFTI-Matlab](https://github.com/NIFTI-Imaging/nifti_matlab), check [this link](https://github.com/NIFTI-Imaging/nifti_matlab/blob/master/license.txt) for licence.
- Oryx-MRSI uses some functions written by (Jamie Near)(https://www.mcgill.ca/psychiatry/jamie-near) (McGill University)
- Oryx-MRSI uses some functions written by [H.Ratiney](https://www.creatis.insa-lyon.fr/site7/en/users/ratiney) (CREATIS-LRMN) 
- Oryx-MRSI uses Schaefer2018_100/400Parcels_7Networks_order_FSLMNI152_2mm.nii. See Github [link](https://github.com/ThomasYeoLab/Standalone_CBIG_fMRI_Preproc2016), for [licence](https://github.com/ThomasYeoLab/Standalone_CBIG_fMRI_Preproc2016/blob/master/LICENSE.md).
- Oryx-MRSI uses MNI152_T1_2mm_brain.nii.gz, MNI-maxprob-thr0/25/50-2mm.nii.gz acquired from [FSL](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/Atlases), for [licence](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/Licence). 
- If there is any function that I forget to mention about name/link/citation, please let me know.

