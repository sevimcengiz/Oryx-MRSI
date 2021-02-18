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
- Oryx-MRSI is tested on MAC and Ubuntu...

# Installation
Download Oryx-MRSI,

Addpath with subfolders SPM12.

Please make sure that FSL usage from Matlab command window installation is completed properly.

Befor using Oryx-MRSI, please open matlab and run ```check_fsl_usage_from_matlab.m``` script which is given under Oryx-MRSI Github repo.

- If you use ```MAC```, check [this link](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation/MacOsX) (Advance Usage part-Using FSL from MATLAB)
- If you use ```LINUX```, check [this link](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation/Linux) (Using FSL from MATLAB)

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
