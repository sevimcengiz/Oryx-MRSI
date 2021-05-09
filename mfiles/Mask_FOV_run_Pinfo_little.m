%% This function is written to create binary mask volumes of all voxels in the FOV area with the same dimensions of the reference anatomical image volume.
% Author: Sevim Cengiz, Sevim Cengiz, Bogazici University, 2020
% Contact: sevim_cengiz@icloud.com
% It considers chemical shift correction, if chemical shift correction
% button is on. Also, it creates 9 different binary masks of metabolites considering chemical shift amount.  

% Credits: This function is modified from GannetMask_Philips.m. Link: https://github.com/richardedden/Gannet3.1
% Reference: Edden RAE, Puts NAJ, Harris AD, Barker PB, Evans CJ. Gannet: A batch-processing tool for the quantitative analysis of gamma-aminobutyric acid-edited MR spectroscopy spectra. J. Magn. Reson. Imaging 2014;40:1445–1452. doi: 10.1002/jmri.24478)
% Inputs: Pinfo struct, metabolite number (k), voxel mask file path,
% chemical shift ex, eco and echo2 values, RFOV direction. 
% Outputs: Pinfo struct. 
% All output files will be saved under ~spectra/nifti/binary_mask_littlevoxels
% folder as nifti files if you uncomment line 147.
% Binary mask volumes of all voxels will be saved according to their slice, row and column number.  
function [Pinfo] = Mask_FOV_run_Pinfo_little(Pinfo,sli,row,col,met,littleFOVMask_file,chem_shift_ex,chem_shift_echo,chem_shift_echo2,RFOV_dir)

nii=Pinfo.MRI;
[pathnii,namenii,extnii] = fileparts(nii);
gunzip(nii,pathnii);
nii_file=[pathnii,filesep,namenii];

V=spm_vol(nii_file);
[MRI,XYZ]=spm_read_vols(V);
% H=spm_read_hdr(nii_file); 

[~,voxdim] = spm_get_bbox(V,'fv'); 
voxdim = abs(voxdim)';
halfpixshift = -voxdim(1:3)/2;

%Shift imaging voxel coordinates by half an imaging voxel so that the XYZ matrix
%tells us the x,y,z coordinates of the MIDDLE of that imaging voxel.
% halfpixshift = -H.dime.pixdim(1:3).'/2;  %Eski kod
halfpixshift(3) = -halfpixshift(3);
XYZ=XYZ+repmat(halfpixshift,[1 size(XYZ,2)]);


% get information from SPAR - change later to be read in
% 
ap_size = Pinfo.FOV/Pinfo.nrow;% little voxel size 10 mm on AP way
lr_size = Pinfo.FOV/Pinfo.ncol;% little voxel size 10 mm on LR way
cc_size =  Pinfo.slithickness/Pinfo.nsli;% little voxel size 12 mm on FH way
ap_ang = Pinfo.voxangap;
lr_ang = Pinfo.voxanglr;
cc_ang = Pinfo.voxangcc;
[offcenter]=Pinfo.littlevoxels(sli,row,col).loc;

switch RFOV_dir
    case 'RL'

ap_off = offcenter(:,2)+chem_shift_ex;
lr_off = offcenter(:,3)+chem_shift_echo;
cc_off = offcenter(:,1)+chem_shift_echo2;

    otherwise % AP
        
        
ap_off = offcenter(:,2)+chem_shift_echo;
lr_off = offcenter(:,3)+chem_shift_ex;
cc_off = offcenter(:,1)+chem_shift_echo2;

end


%We need to flip ap and lr axes to match NIFTI convention
ap_off = -ap_off;
lr_off = -lr_off;


ap_ang = -ap_ang;
lr_ang = -lr_ang;


% define the voxel - use x y z  
% currently have spar convention that have in AUD voxel - will need to
% check for everything in future...
% x - left = positive
% y - posterior = postive
% z - superior = positive
vox_ctr = ...
      [lr_size/2 -ap_size/2 cc_size/2 ;
       -lr_size/2 -ap_size/2 cc_size/2 ;
       -lr_size/2 ap_size/2 cc_size/2 ;
       lr_size/2 ap_size/2 cc_size/2 ;
       -lr_size/2 ap_size/2 -cc_size/2 ;
       lr_size/2 ap_size/2 -cc_size/2 ;
       lr_size/2 -ap_size/2 -cc_size/2 ;
       -lr_size/2 -ap_size/2 -cc_size/2 ];
   
% make rotations on voxel
rad = pi/180;
initrot = zeros(3,3);

xrot = initrot;
xrot(1,1) = 1;
xrot(2,2) = cos(lr_ang *rad);
xrot(2,3) =-sin(lr_ang*rad);
xrot(3,2) = sin(lr_ang*rad);
xrot(3,3) = cos(lr_ang*rad);


yrot = initrot;
yrot(1,1) = cos(ap_ang*rad);
yrot(1,3) = sin(ap_ang*rad);
yrot(2,2) = 1;
yrot(3,1) = -sin(ap_ang*rad);
yrot(3,3) = cos(ap_ang*rad);


zrot = initrot;
zrot(1,1) = cos(cc_ang*rad);
zrot(1,2) = -sin(cc_ang*rad);
zrot(2,1) = sin(cc_ang*rad);
zrot(2,2) = cos(cc_ang*rad);
zrot(3,3) = 1;


% rotate voxel
vox_rot = xrot*yrot*zrot*vox_ctr.';

% calculate corner coordinates relative to xyz origin
vox_ctr_coor = [lr_off ap_off cc_off];
vox_ctr_coor = repmat(vox_ctr_coor.', [1,8]);
vox_corner = vox_rot+vox_ctr_coor;

%%% make new comment
mask = zeros(1,size(XYZ,2));
sphere_radius = sqrt((lr_size/2)^2+(ap_size/2)^2+(cc_size/2)^2);
distance2voxctr=sqrt(sum((XYZ-repmat([lr_off ap_off cc_off].',[1 size(XYZ, 2)])).^2,1));
sphere_mask(distance2voxctr<=sphere_radius)=1;

mask(sphere_mask==1) = 1;
XYZ_sphere = XYZ(:,sphere_mask == 1);

tri = delaunayn([vox_corner.'; [lr_off ap_off cc_off]]);
tn = tsearchn([vox_corner.'; [lr_off ap_off cc_off]], tri, XYZ_sphere.');
isinside = ~isnan(tn);
mask(sphere_mask==1) = isinside;
mask = reshape(mask, V.dim);



V_mask.fname=[littleFOVMask_file];
V_mask.descrip='MRS_Voxel_Mask';
V_mask.dim=V.dim;
V_mask.dt=V.dt;
V_mask.mat=V.mat;

%  V_mask=spm_write_vol(V_mask,mask);  % uncomment if you want to save
% little voxels

Pinfo.metab(met).littlevoxels(sli,row,col).name=littleFOVMask_file;
Pinfo.metab(met).littlevoxels(sli,row,col).littlemask=mask;
[a,n,t] = ind2sub(size(mask),find(mask >0));
Pinfo.metab(met).littlevoxels(sli,row,col).loc = [a,n,t];

end

