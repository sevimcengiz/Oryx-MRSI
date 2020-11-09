function [DW,TF,nbPts,nbSignals,nrow,ncol,nslice]=readSPAR(rootname)


% usage [DW,TF,nbPts,nbSignals,nrow,ncol]=readSPAR(rootname)
% INPUT rootname = contains the root name of the .sdat /spar
% OUTPUT 
%       DW= dwelltime in ms
%       TF= carrier freuquency
%       nbSignals= number of signals in case either of time series or of
%       csi
%       nrow: number of rows
%       ncol: number of columns
%       nslice: number of slice
% 
% Author H.Ratiney (CREATIS-LRMN) 
% Created 01/07/08
% last update 01/07/08




        text=textread(strcat(rootname,'.spar'),'%s');

        DW=0;TF=0;nbPts=0;nrSignals=0;nrow=0;ncol=0; 
        for j=1:length(text)
            
            % read the spectral BW
            if(strcmp(text{j},'sample_frequency'))
              SW=str2num(text{j+2});
              DW = 1000 / SW;
            end
            % read the carrier frequency
            if(strcmp(text{j},'synthesizer_frequency'))
              TF=str2num(text{j+2});
              
            end
            % read the number of points nbPts
            if(strcmp(text{j},'samples'))
              nbPts=str2num(text{j+2});
              
            end
            % read the nucleus
            if(strcmp(text{j},'nucleus'))
                nucleus=text{j+2};
            end 
            if(strcmp(text{j},'nr_time_series_spectra'))
                time_serie=1;
                nbSignals=str2num(text{j+2});
            else
                time_serie=0;
            end
            if(strcmp(text{j},'spec_num_row'))
               
                nbSignals=str2num(text{j+2})

                if(nbSignals>1)
                    csi=1
                else
                csi=0;
                end
            end
            
       end

    
      %the Magnetic Field B0 for 1H nucleus
      if(strcmp(nucleus,'1H'))
              B0 = TF * 4.6975 / (200 * 1E6)
      end
           %     input('ok')     
      if(csi==1)
          
          for j=1:length(text)
             if(strcmp(text{j},'dim3_pnts'))
              ncol=str2num(text{j+2});
             end
             
             if(strcmp(text{j},'dim2_pnts'))
              nrow=str2num(text{j+2});
             end
             
             if(strcmp(text{j},'dim4_pnts'))
              nslice=str2num(text{j+2});
             end
          end
          
          else
              ncol=1;
              nrow=1;
              nslice=1;
      end
