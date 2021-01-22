function [raw_data]=RawDataVisual(sparfilepath)
% This function is written for visualization of raw MRSI file. 
% It reads .spar file and shows spectral visualization considering number
% of slices, rows and columns.
% Credits: 
% This code is based on functions from the FID-A toolbox by
%       Dr. Jamie Near (McGill University)
%       https://github.com/CIC-methods/FID-A
%       Simpson et al., Magn Reson Med 77:23-33 (2017)
%       and 
% subplotposition (Yuheng Wang, Tianjin Univercity of Science & Tech,yuheng.w@gmail.com)
% Yuheng (2020). subplot position (https://www.mathworks.com/matlabcentral/fileexchange/56261-subplot-position), MATLAB Central File Exchange. Retrieved October 28, 2020.


[sig,Fe,Fref,B0]=Multivoxel_readPhilips_Sdat(sparfilepath); %Read raw MRSI data
raw_data=fftshift(fft(sig,[],4),4);


%% Visualition of raw MRSI data
% [nslice,nrow,ncol,t]= size(raw_data); 
% 
% [P_subplot,P_fig,P_colorbar] = subplot_position(300,300,nrow,ncol,1,20,20,30,30,50,50);
% flatdata=zeros(1024,(nrow*ncol));
% 
% for slice=1:nslice
% figure('Position',P_fig)
% count=1;
% for k=1:nrow
%     for j=1:ncol
%         flatdata(:,count)=squeeze(real(flip(raw_data(slice,k,j,:))));
%         count=count+1;
%     end
% end
% 
% for sp=1:(nrow*ncol)
%     subplot('position',P_subplot{sp})
%     plot(flatdata(:,sp),'k' ); 
%     ymin=(min(min(min(real(flip(raw_data(slice,:,:,333:350)))))));
%     ymax=(max(max(max(real(flip(raw_data(slice,:,:,333:350)))))));
% 
% %     ymin=(min(min(min(real((raw_data(1,:,:,532:800)))))));
% %     ymax=(max(max(max(real((raw_data(1,:,:,532:800)))))));
% 
%     axis ([532 800 ymin ymax])
%     set(gca,'XTickLabel',[])
%     set(gca,'XTick',[])
%     set(gca,'YTick',[])
%     set(gca,'xcolor','k')
%     set(gca,'ycolor','k')
% end
% end
end