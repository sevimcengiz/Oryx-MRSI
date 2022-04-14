%% This function generates an array which keeps 3D image views including sagittal, coronal, and axial
% Author: Sevim Cengiz,  Bogazici University , 2022 - For revison.

function [three_plane_img]= view3D(slice,MRIimg_mas)
size_max=max(size(MRIimg_mas));
three_plane_img=zeros([size_max 3*size_max]);
im1 = squeeze(MRIimg_mas(:,:,slice(3)));
im1 = im1(end:-1:1,:)';
im1 = flipdim(im1 ,1);
im1 = flipdim(im1,2);
im3 = squeeze(MRIimg_mas(:,slice(2),:));
im3 = im3(end:-1:1,end:-1:1)';
im3 = flipdim(im3,2);
im2 = squeeze(MRIimg_mas(slice(1),:,:));
im2 = im2(:,end:-1:1)';
three_plane_img(:,1:size_max) = image_center(im1, size_max);
three_plane_img(:,size_max*2+(1:size_max))=image_center(im3,size_max);
three_plane_img(:,size_max+(1:size_max))=image_center(im2,size_max);
end