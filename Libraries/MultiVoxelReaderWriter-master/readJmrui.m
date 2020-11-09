function [sig,Fe Fref,nbPts_read]=readJmrui(filename,nbRow,nbCol,nbPts)

% Author:  Hélène Ratiney & Mark J. Albers,
% Date:  1/19/2007, update 24/01/2012
% % Description:
%   This script reads in the .mrui file created by jMRUI.
% usage: [sig,Fe Fref,nbPts_read]=readJmrui(filename,nbRow,nbCol,nbPts);
% INPUT:  
%   <filename> is the name of the mrui file with its extension.
%   nbRow: number of Rows, optional for 1D MRS, or series of 1D MRS
%   nbCol: number of Columns, optional for 1DMRS
%   <nbPts> is the number of complex points contained in the jMRUI file.
%   (optional...)
% OUTPUT:
%   <sig> is the complex FID for the data set.

fid=fopen(filename,'r','ieee-be');

% Report an error if the file was not opened successfully.
if(fid == -1)
    error('Unable to to open %s.',filename);
end %if
test=fread(fid,'double');
nbPts_read=test(2)
order=1;
if(nargin<2 )
    disp 'read series of FID'
    nbRow=test(14);
    nbCol=1;
    nbPts=nbPts_read;
    order=0;
end


step=test(3);
Fe=1000/test(3);
Fref=test(6);
if(nbPts~=nbPts_read)
    disp 'Warning: the number of point in the input is different than the one in the jMrui file'
    disp 'in Jmrui header, nbPts='
    nbPts_read
end


sig1=test(65:65+2*nbPts*nbCol*nbRow-1);
%for MRSI data, read file in "correct order" (UCSF format) (first signal being in the upper left corner)
if(order)
for k=1:nbRow
 sig2((k-1)*nbCol*2*nbPts+1:2:k*nbCol*2*nbPts)=sig1(nbCol*nbRow*2*nbPts-k*nbCol*2*nbPts+1:2:nbCol*nbRow*2*nbPts-(k-1)*nbCol*2*nbPts);
 sig2((k-1)*nbCol*2*nbPts+2:2:k*nbCol*2*nbPts)=-sig1(nbCol*nbRow*2*nbPts-k*nbCol*2*nbPts+2:2:nbCol*nbRow*2*nbPts-(k-1)*nbCol*2*nbPts);
end
% Reorder the FID into a complex FID.
sig = (sig2(1:2:2*nbPts) + 1i*sig2(2:2:2*nbPts)).';
else
    sig2=reshape(sig1,2*nbPts,nbRow).';
    sig=sig2(:,1:2:2*nbPts)-1i*sig2(:,2:2:2*nbPts);
end


fclose(fid);