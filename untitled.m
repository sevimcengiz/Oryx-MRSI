% Save Outputs
          
            
            outgm=[outmat,filesep,app.Pinfo.sparname,'_fGM.mat'];
            save(outgm, 'fgm');
            
            
            outwm=[outmat,filesep,app.Pinfo.sparname,'_fWM.mat'];
            save(outwm, 'fwm');
            
           
            outCSF=[outmat,filesep,app.Pinfo.sparname,'_fCSF.mat'];
            save(outCSF, 'fcsf');
            
            litvox_pixloc=app.Pinfo.metab;
            outloc=[outmat,filesep,app.Pinfo.sparname,'_litvox_pixloc.mat'];
            save(outloc,'litvox_pixloc','-v7.3');
            
            outCONC=[outmat,filesep,app.Pinfo.sparname,'_CONC.mat'];
            save(outCONC,'AllConc');
            
            outNumStd=[outmat,filesep,app.Pinfo.sparname,'_NumStd.mat'];
            save(outNumStd,'AllNumStd');
            
            outFWHM=[outmat,filesep,app.Pinfo.sparname,'_FWHM.mat'];
            save(outFWHM,'AllFWHM');
            
            outSNR=[outmat,filesep,app.Pinfo.sparname,'_SNR.mat'];
            save(outSNR,'AllSNR');
            