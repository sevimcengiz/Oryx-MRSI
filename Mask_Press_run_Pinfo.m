
function [Pinfo] = Mask_Press_run_Pinfo(Pinfo,k,MRIPressMask_file,chem_shift_ex,chem_shift_echo,chem_shift_echo2)

nii=Pinfo.MRI;
[pathnii,namenii,extnii] = fileparts(nii);
gunzip(nii,pathnii);
nii_file=[pathnii,filesep,namenii];

V=spm_vol(nii_file);
[MRI,XYZ]=spm_read_vols(V);

[~,voxdim] = spm_get_bbox(V,'fv'); 
voxdim = abs(voxdim)';
halfpixshift = -voxdim(1:3)/2;

%Shift imaging voxel coordinates by half an imaging voxel so that the XYZ matrix
%tells us the x,y,z coordinates of the MIDDLE of that imaging voxel.
halfpixshift(3) = -halfpixshift(3);
XYZ=XYZ+repmat(halfpixshift,[1 size(XYZ,2)]);


% get information from SPAR - change later to be read in
% 
if rem((Pinfo.apVOI/2),2)==0
     ap_size=Pinfo.apVOI;
        
else 
     voxsize1= Pinfo.FOV/ Pinfo.nrow;
   ap_size=Pinfo.apVOI-voxsize1; 
end
    


if rem((Pinfo.lrVOI/2),2)==0
     lr_size=Pinfo.lrVOI;
        
else 
     voxsize2=Pinfo.FOV/ Pinfo.ncol;
   lr_size=Pinfo.lrVOI-voxsize2;   
end
    
% ap_size = Pinfo(ii).sparinfo(j).apVOI;%MRS_struct.p.voxsize(ii, 2);
% lr_size = Pinfo(ii).sparinfo(j).lrVOI;%MRS_struct.p.voxsize(ii, 1);
cc_size =  Pinfo.slithickness;%MRS_struct.p.voxsize(ii, 3);
ap_off =Pinfo.voxoffap+chem_shift_ex;
lr_off = Pinfo.voxofflr+chem_shift_echo;
cc_off = Pinfo.voxoffcc+chem_shift_echo2;
ap_ang = Pinfo.voxangap;
lr_ang = Pinfo.voxanglr;
cc_ang = Pinfo.voxangcc;
% 
% 
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
V_mask.fname=[MRIPressMask_file];
V_mask.descrip='MRS_Voxel_Mask';
V_mask.dim=V.dim;
V_mask.dt=V.dt;
V_mask.mat=V.mat;
V_mask=spm_write_vol(V_mask,mask);
% Pinfo(ii).sparinfo(j).FOVmask=mask;
end

