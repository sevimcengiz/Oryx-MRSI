function overlayslice(a,nslice,nrow,ncol,rootname)

selectedslice = inputdlg({'What is the slice that you want to see of MRSI Data? - Choose 1,2 or 3'},'What is the slice that you want to see of MRSI Data? - Choose 1,2 or 3', [1 100]);
sh=str2num(selectedslice{1,1})
%for sh=1:nslice
axisin = inputdlg(('Change the axis limits! x-axis ranges from 0 to 1024 and the y-axis ranges from -10000 to 10000. Ex: 400 800 -30000 30000'),'Axis limits', [1 100]);
axisinfo= str2num(axisin{1,1})


figure('units','normalized','outerposition',[0 0 10000 10000], 'innerposition',[0 0 100000 100000]);

n=1;
for k=1:nrow
    for j=1:ncol
        subplot(nrow,ncol,n);
        % plot(squeeze(real(a(sh,k,j,:))),'r','LineWidth',2.3);
        %plot(squeeze(real(flipdim(a(sh,k,j,:)))),'k' );% flipdim'de kullanilabilir
        plot(squeeze(real(flip(a(sh,k,j,:)))),'k' );% flipdim'de kullanilabilir
        
        axis(axisinfo)
        
        %axis ([100 1024 min(real(a(sh,k,j,:))) max(real(a(sh,k,j,:)))])
        
        box on;
        axis off;
        n=n+1;
    end
end
end
%end
%%%NAA,Cho,mI locationlari
%%%NAA 687.point
%%%Cr 620.point
%%%mI 562.point
