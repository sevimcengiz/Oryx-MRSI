function sig_all = read_all_mrui_files(fileroot, sizex, sizey)
addpath 'C:\Users\GHale\Desktop\Compressed_Sensing_codes\CS_guncel';
%fileroot='Compressed_31P_WIP_2D_8x8_Compressed_27_1_raw_act';
%fileroot='NAIL_ADAK_31P_2D_DECOUPLE__NOE_5_1_raw_act';
n=0;
for x=1:sizey
    for y=1:sizex
        if floor(n/10)==0
            numroot=strcat('000', num2str(n));
        elseif floor(n/10)< 10
            numroot=strcat('00', num2str(n));
        elseif floor(n/10)< 100
            numroot=strcat('0', num2str(n));
        else numroot=num2str(n);
        end
        [sig,Fe Fref,nbPts_read]=readJmrui(sprintf('%s_%s.SDAT.mrui', fileroot, numroot),1,1,1024);
        n=n+1;
        sig_all(x,y,:)=sig;
    end
end