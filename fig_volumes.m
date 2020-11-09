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
im1 = squeeze(MRI(:,:,slice(3)));
im1 = im1(end:-1:1,:)'; 
im1 = flipdim(im1 ,1); 
im3 = squeeze(MRI(:,slice(2),:));
im3 = im3(end:-1:1,end:-1:1)'; 
im2 = squeeze(MRI(slice(1),:,:));
im2 = im2(:,end:-1:1)';
three_plane_img(:,1:size_max) = image_center(im1, size_max);
three_plane_img(:,size_max*2+(1:size_max))=image_center(im3,size_max);
three_plane_img(:,size_max+(1:size_max))=image_center(im2,size_max);
end