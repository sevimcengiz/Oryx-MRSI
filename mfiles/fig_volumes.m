%% This function is written for the visualization of the anatomical images and metabolite maps.

% Inputs: It takes Pinfo struct and referans nii volume.
% Outputs: it creates three plane img for the visualization. 
% Credits: This function is modified from GannetMask_Philips.m. Link: https://github.com/richardedden/Gannet3.1
% Reference: Edden RAE, Puts NAJ, Harris AD, Barker PB, Evans CJ. Gannet: A batch-processing tool for the quantitative analysis of gamma-aminobutyric acid-edited MR spectroscopy spectra. J. Magn. Reson. Imaging 2014;40:1445–1452. doi: 10.1002/jmri.24478)
% Author: Sevim Cengiz, Bogazici University, 2020
% Contact: sevim_cengiz@icloud.com

function [three_plane_img]=fig_volumes(Pinfo,refnii)
slice=Pinfo.refimg.slice;
V=spm_vol(refnii);
[MRI,XYZ]=spm_read_vols(V);
MRIimg=zeros(size(MRI));
mask = zeros(1,size(XYZ,2));
mask = reshape(mask, V.dim);
MRIimg = MRIimg + .2*mask;
size_max=max(size(MRIimg));
three_plane_img=zeros([size_max 3*size_max]);
[sz_x sz_y sz_z]=size(MRI);
if slice(3)<sz_z
    im1 = squeeze(MRI(:,:,slice(3)));
else
    im1 = squeeze(MRI(:,:,round(sz_z/2)));
end
im1 = im1(end:-1:1,:)';
im1 = flipdim(im1 ,1);  %vertical mirror (Now; up is Anterior, down is Posterior)
im1 = flipdim(im1,2); %horizantal mirror (Now: right left display)
if slice(2)<sz_y
    im3 = squeeze(MRI(:,slice(2),:));
else
    im3 = squeeze(MRI(:,round(sz_y/2),:));
end
im3 = im3(end:-1:1,end:-1:1)';
im3 = flipdim(im3,2);%horizantal mirror (Now: right left display)
if slice(1)<sz_x
    im2 = squeeze(MRI(slice(1),:,:));
else
    im2 = squeeze(MRI(:,round(sz_x/2),:));
end
im2 = im2(:,end:-1:1)';
three_plane_img(:,1:size_max) = image_center(im1, size_max);
three_plane_img(:,size_max*2+(1:size_max))=image_center(im3,size_max);
three_plane_img(:,size_max+(1:size_max))=image_center(im2,size_max);
end