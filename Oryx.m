classdef Oryx < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        Panel1                          matlab.ui.container.Panel
        MRSIacquiredafterButtonGroup    matlab.ui.container.ButtonGroup
        T1wMRIButton                    matlab.ui.control.RadioButton
        T2wMRIButton                    matlab.ui.control.RadioButton
        RFexBWEditFieldLabel            matlab.ui.control.Label
        RFechoBWEditFieldLabel          matlab.ui.control.Label
        RFecho2BWEditFieldLabel         matlab.ui.control.Label
        RFBandwidthofthesystemLabel     matlab.ui.control.Label
        fCSFLabel                       matlab.ui.control.Label
        CutoffvaluesforexclusioncriteriaLabel  matlab.ui.control.Label
        CRLBLabel                       matlab.ui.control.Label
        SNRLabel                        matlab.ui.control.Label
        FWHMLabel                       matlab.ui.control.Label
        Range01EditField                matlab.ui.control.NumericEditField
        NotesTextArea                   matlab.ui.control.TextArea
        RFexBWEditField                 matlab.ui.control.NumericEditField
        RFechoBWEditField               matlab.ui.control.NumericEditField
        RFecho2BWEditField              matlab.ui.control.NumericEditField
        fcsfEditField                   matlab.ui.control.NumericEditField
        CRLBEditField                   matlab.ui.control.NumericEditField
        SNREditField                    matlab.ui.control.NumericEditField
        FWHMEditField                   matlab.ui.control.NumericEditField
        DoneButton                      matlab.ui.control.Button
        ChemicalshiftcorrectionButtonGroup  matlab.ui.container.ButtonGroup
        OnButton                        matlab.ui.control.RadioButton
        OffButton                       matlab.ui.control.RadioButton
        TextArea_2                      matlab.ui.control.TextArea
        Oryxlogo                        matlab.ui.control.Image
        SelectaSPARfileButton           matlab.ui.control.Button
        Label                           matlab.ui.control.Label
        TextArea_3                      matlab.ui.control.TextArea
        ChemicalShiftDirAPButtonGroup   matlab.ui.container.ButtonGroup
        AButton                         matlab.ui.control.RadioButton
        PButton                         matlab.ui.control.RadioButton
        ReferenceMetabolite             matlab.ui.container.ButtonGroup
        H2OButton                       matlab.ui.control.RadioButton
        NAAButton                       matlab.ui.control.RadioButton
        CrButton                        matlab.ui.control.RadioButton
        ChoButton                       matlab.ui.control.RadioButton
        LacLipButton                    matlab.ui.control.RadioButton
        RFOVDirButtonGroup              matlab.ui.container.ButtonGroup
        RLButton                        matlab.ui.control.RadioButton
        APButton                        matlab.ui.control.RadioButton
        ChemicalShiftDirLRButtonGroup   matlab.ui.container.ButtonGroup
        LButton                         matlab.ui.control.RadioButton
        RButton                         matlab.ui.control.RadioButton
        ChemicalShiftDirFHButtonGroup   matlab.ui.container.ButtonGroup
        HButton                         matlab.ui.control.RadioButton
        FButton                         matlab.ui.control.RadioButton
        Panel2                          matlab.ui.container.Panel
        oryxlogo                        matlab.ui.control.Image
        LoadDataButton                  matlab.ui.control.Button
        CoregistrationButton            matlab.ui.control.Button
        SegmentationButton              matlab.ui.control.Button
        FWHMSNRButton                   matlab.ui.control.Button
        SpectralqualityButton           matlab.ui.control.Button
        MetabolitemapsButton            matlab.ui.control.Button
        RegistrationButton              matlab.ui.control.Button
        ROIAnalyzeButton                matlab.ui.control.Button
        github                          matlab.ui.control.Image
        ExitButton                      matlab.ui.control.Button
        VisualizationoptionButtonGroup  matlab.ui.container.ButtonGroup
        RawdatavisualizationButton      matlab.ui.control.RadioButton
        CoordfilevisualizationButton    matlab.ui.control.RadioButton
        Panel                           matlab.ui.container.Panel
        WhichMetaboliteButtonGroup      matlab.ui.container.ButtonGroup
        CrPCrButton                     matlab.ui.control.RadioButton
        GluGlnButton                    matlab.ui.control.RadioButton
        GPCPChButton                    matlab.ui.control.RadioButton
        InsButton                       matlab.ui.control.RadioButton
        LacButton                       matlab.ui.control.RadioButton
        Lip13aButton                    matlab.ui.control.RadioButton
        Lip13bButton                    matlab.ui.control.RadioButton
        Lip13aLip13bButton              matlab.ui.control.RadioButton
        NAANAAGButton                   matlab.ui.control.RadioButton
        TabGroup                        matlab.ui.container.TabGroup
        MeanTab                         matlab.ui.container.Tab
        meantable                       matlab.ui.control.Table
        MedianTab                       matlab.ui.container.Tab
        mediantable                     matlab.ui.control.Table
        STDTab                          matlab.ui.container.Tab
        stdtable                        matlab.ui.control.Table
        which_map                       matlab.ui.container.ButtonGroup
        concentrationmap                matlab.ui.control.RadioButton
        concentrationmaptoInsRatio      matlab.ui.control.RadioButton
        concentrationmaptoCrPCrratio    matlab.ui.control.RadioButton
        CSFcorrectedconcentrationmap    matlab.ui.control.RadioButton
        CSFcorrectedconcentrationmaptoInsratio  matlab.ui.control.RadioButton
        CSFcorrectedconcetrationmaptoCrPCrratio  matlab.ui.control.RadioButton
        Slider                          matlab.ui.control.Slider
        SliceNumberLabel                matlab.ui.control.Label
        pubmed                          matlab.ui.control.Image
        Panel_2                         matlab.ui.container.Panel
        XminEditFieldLabel              matlab.ui.control.Label
        XminEditField                   matlab.ui.control.NumericEditField
        XmaxEditFieldLabel              matlab.ui.control.Label
        XmaxEditField                   matlab.ui.control.NumericEditField
        YminEditFieldLabel              matlab.ui.control.Label
        YminEditField                   matlab.ui.control.NumericEditField
        YmaxEditFieldLabel              matlab.ui.control.Label
        YmaxEditField                   matlab.ui.control.NumericEditField
        AdjustPlotButton                matlab.ui.control.Button
        ROIatlasDropDown                matlab.ui.control.DropDown
        RegionNetworkExclusionEditFieldLabel  matlab.ui.control.Label
        RegionNetworkExclusionEditField  matlab.ui.control.NumericEditField
        ROIAtlasLabel                   matlab.ui.control.Label
    end

    
    properties (Access = public)
        SFile='';
        SPath='';
        Pinfo='';
        Fused_cr='';
        Fused_lac='';
        Fused_all='';
        chem_shift_ex='';
        chem_shift_echo='';
        chem_shift_echo2='';
        Metabolites='';
        AllNumStd='';
        AllConc='';
        AllFWHM='';
        AllSNR='';
        Metname='';
        outmat='';
        includedvoxels='';
        coreg_path='';
        fcsf='';
        fgm='';
        fwm='';
        currentslider='';
        currentmodule='';
        meanTab='';
        medianTab='';
        stdTab='';
        coreg_status='';
        seg_status='';
        allvoxels='';
        metmap_status='';
        regist_status='';
        spardone='';
        mloaddata='';
        mcoregistration='';
        msegmentation='';
        mfhwmsnr='';
        mincludedvoxels='';
        mmetabolitemaps='';
        mregistration='';
        mroianalyze='';
        roi_status='';
        atlaspath='';
        refnii='';
        vis_map='';
        tabledata;
        metabs;
        corrMatrix;
        sp;
        bg;
        fit;
        coord_filename;
        ReferenceMetabolite2='';
        RFOV_dir='RL';
        chem_shift_dir_AP='A';
        chem_shift_dir_LR='L';
        chem_shift_dir_FH='F';
    end
    
    properties (Access = private)
        % Description
        Property52 % Description
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            warning('off','all')
            set(app.DoneButton,'Enable','off');
            
        end

        % Size changed function: Panel1
        function Panel1SizeChanged(app, event)
            position = app.Panel1.Position;
            
        end

        % Button pushed function: SelectaSPARfileButton
        function SelectaSPARfileButtonPushed(app, event)
            [app.SFile,app.SPath]=uigetfile({'*.SPAR;*.spar';'*.*'},'Select an SPAR file');figure(app.UIFigure);
            
            if app.SFile~=0
                app.spardone=1;
                set(app.DoneButton,'Enable','on');
                
            end
        end

        % Button pushed function: DoneButton
        function DoneButtonPushed(app, event)
            if app.spardone=='0'
                
                selection = uiconfirm(app.UIFigure,'Select an Spar file','Confirm Close','Options',{'Ok'},...
                    'Icon','warning');
                return
            end
            app.Panel2.Visible = 'on';
            app.Panel1.Visible = 'off';
            app.TabGroup.Visible='off';
            app.VisualizationoptionButtonGroup.Visible='off';
            app.ROIatlasDropDown.Visible='off';
            app.ROIAtlasLabel.Visible='off';
            app.RegionNetworkExclusionEditField.Visible='off';
            app.RegionNetworkExclusionEditFieldLabel.Visible='off';
            app.SliceNumberLabel.Visible='off';
            app.Slider.Visible='off';
            app.WhichMetaboliteButtonGroup.Visible='off';
            app.Panel_2.Visible='off';
            app.coreg_status=0;
            app.seg_status=0;
            app.metmap_status=0;
            app.regist_status=0;
            app.roi_status=0;
            set(app.CoregistrationButton,'Enable','off');
            set(app.SegmentationButton,'Enable','off');
            set(app.FWHMSNRButton,'Enable','off');
            set(app.SpectralqualityButton,'Enable','off');
            set(app.MetabolitemapsButton,'Enable','off');
            set(app.RegistrationButton,'Enable','off');
            set(app.ROIAnalyzeButton,'Enable','off');
            app_Path=app.SPath;
            app_File=app.SFile;
            if app.spardone==1
                
                [app.Pinfo]= loadfile(app_File,app_Path);
            end
        end

        % Selection changed function: MRSIacquiredafterButtonGroup
        function MRSIacquiredafterButtonGroupSelectionChanged(app, event)
            app.MRSIacquiredafterButtonGroup.SelectedObject;
            
            switch        app.ChemicalshiftcorrectionButtonGroup.SelectedObject.Text
                case  'Off'
                    set(app.ChemicalShiftDirAPButtonGroup,'Enable','off');
                    set(app.ChemicalShiftDirLRButtonGroup,'Enable','off');
                    set(app.ChemicalShiftDirFHButtonGroup,'Enable','off');
                    set(app.RFOVDirButtonGroup,'Enable','off');
                    set(app.RFexBWEditField,'Enable','off');
                    set(app.RFechoBWEditField,'Enable','off');
                    set(app.RFecho2BWEditField,'Enable','off');
                    set(app.RFBandwidthofthesystemLabel,'Enable','off');
                    set(app.RFecho2BWEditFieldLabel,'Enable','off');
                    set(app.RFechoBWEditFieldLabel,'Enable','off');
                    set(app.RFexBWEditFieldLabel,'Enable','off');
                otherwise
                    set(app.ChemicalShiftDirAPButtonGroup,'Enable','on');
                    set(app.ChemicalShiftDirLRButtonGroup,'Enable','on');
                    set(app.ChemicalShiftDirFHButtonGroup,'Enable','on');
                    set(app.RFOVDirButtonGroup,'Enable','on');
                    set(app.RFexBWEditField,'Enable','on');
                    set(app.RFechoBWEditField,'Enable','on');
                    set(app.RFecho2BWEditField,'Enable','on');
                    set(app.RFBandwidthofthesystemLabel,'Enable','on');
                    set(app.RFecho2BWEditFieldLabel,'Enable','on');
                    set(app.RFechoBWEditFieldLabel,'Enable','on');
                    set(app.RFexBWEditFieldLabel,'Enable','on');
            end
            
        end

        % Selection changed function: 
        % ChemicalshiftcorrectionButtonGroup
        function ChemicalshiftcorrectionButtonGroupSelectionChanged(app, event)
            app.ChemicalshiftcorrectionButtonGroup.SelectedObject;
            switch        app.ChemicalshiftcorrectionButtonGroup.SelectedObject.Text
                case  'Off'
                    set(app.ChemicalShiftDirAPButtonGroup,'Enable','off');
                    set(app.ChemicalShiftDirLRButtonGroup,'Enable','off');
                    set(app.ChemicalShiftDirFHButtonGroup,'Enable','off');
                    set(app.RFOVDirButtonGroup,'Enable','off');
                    set(app.RFexBWEditField,'Enable','off');
                    set(app.RFechoBWEditField,'Enable','off');
                    set(app.RFecho2BWEditField,'Enable','off');
                    set(app.RFBandwidthofthesystemLabel,'Enable','off');
                    set(app.RFecho2BWEditFieldLabel,'Enable','off');
                    set(app.RFechoBWEditFieldLabel,'Enable','off');
                    set(app.RFexBWEditFieldLabel,'Enable','off');
                    set(app.ReferenceMetabolite,'Enable','off');
                    
                    
                otherwise
                    set(app.ChemicalShiftDirAPButtonGroup,'Enable','on');
                    set(app.ChemicalShiftDirLRButtonGroup,'Enable','on');
                    set(app.ChemicalShiftDirFHButtonGroup,'Enable','on');
                    set(app.RFOVDirButtonGroup,'Enable','on');
                    set(app.RFexBWEditField,'Enable','on');
                    set(app.RFechoBWEditField,'Enable','on');
                    set(app.RFecho2BWEditField,'Enable','on');
                    set(app.RFBandwidthofthesystemLabel,'Enable','on');
                    set(app.RFecho2BWEditFieldLabel,'Enable','on');
                    set(app.RFechoBWEditFieldLabel,'Enable','on');
                    set(app.RFexBWEditFieldLabel,'Enable','on');
                    set(app.ReferenceMetabolite,'Enable','on');
                    
                    
            end
            
            
            
            
        end

        % Value changed function: Range01EditField
        function Range01EditFieldValueChanged(app, event)
            app.Range01EditField.Value;
            
        end

        % Value changed function: RFexBWEditField
        function RFexBWEditFieldValueChanged(app, event)
            app.RFexBWEditField.Value;
            
        end

        % Value changed function: RFechoBWEditField
        function RFechoBWEditFieldValueChanged(app, event)
            app.RFechoBWEditField.Value;
            
        end

        % Value changed function: RFecho2BWEditField
        function RFecho2BWEditFieldValueChanged(app, event)
            app.RFecho2BWEditField.Value;
            
        end

        % Value changed function: fcsfEditField
        function fcsfEditFieldValueChanged(app, event)
            app.fcsfEditField.Value;
            
        end

        % Value changed function: CRLBEditField, NotesTextArea
        function CRLBEditFieldValueChanged(app, event)
            app.CRLBEditField.Value;
            
        end

        % Value changed function: FWHMEditField
        function FWHMEditFieldValueChanged(app, event)
            app.FWHMEditField.Value;
            
        end

        % Value changed function: SNREditField
        function SNREditFieldValueChanged(app, event)
            app.SNREditField.Value;
            
        end

        % Button pushed function: LoadDataButton
        function LoadDataButtonPushed(app, event)
            app.TabGroup.Visible='off';
            app.which_map.Visible='off';
            app.ROIatlasDropDown.Visible='off';
            app.ROIAtlasLabel.Visible='off';
            app.RegionNetworkExclusionEditField.Visible='off';
            app.RegionNetworkExclusionEditFieldLabel.Visible='off';
            app.VisualizationoptionButtonGroup.Visible='on';
            app.WhichMetaboliteButtonGroup.Visible='off';
            
            obj=findobj(app.Panel,'type','Axes');
            delete(obj);
            
            wait=uiprogressdlg(app.UIFigure,'Message','Plotting.. Please wait','Title','Plotting');
            
            selectedButton = app.VisualizationoptionButtonGroup.SelectedObject;
            obj=findobj(app.Panel,'type','Axes');
            delete(obj);
            switch selectedButton.Text
                
                case  'Raw data visualization'
                    
                    [raw_data]=RawDataVisual(app.Pinfo.sparfilepath);
                    [nslice,nrow,ncol,t]= size(raw_data);
                    
                    app.Panel.AutoResizeChildren='off';
                    app.Panel_2.Visible='on';
                    n=1;
                    pos=get(app.Panel,'Position');
                    xinc=1/nrow ;
                    yinc=1/ncol;
                    
                    for k=1:nrow
                        ystart=(k-1)*yinc;
                        for j=1:ncol
                            xstart=(j-1)*xinc;
                            ax= subplot('Position',[-5 -5 0 0],'Parent',app.Panel);
                            
                            dataplot=squeeze(real(flip(raw_data(app.Slider.Value,k,j,:))));
                            %                             plot(ax,dataplot(532:800));
                            %                             ymin=(min(min(min(real(flip(raw_data(app.Slider.Value,:,:,333:350)))))));
                            %                             ymax=(max(max(max(real(flip(raw_data(app.Slider.Value,:,:,333:350)))))));
                            
                            
                            plot(ax,dataplot);
                            xlim(ax,[532 800]);
                            ymin=min(min(min(min(real((raw_data(:,:,:,532:800)))))));
                            ymax=max(max(max(max(real((raw_data(:,:,:,532:800)))))));
                            ylim(ax,[ymin ymax]);
                            
                            xticks(ax,[ ]);
                            yticks(ax,[ ]);
                            
                            %box(ax,'off');
                            set(ax,'Position',[xstart,1-yinc-ystart,xinc*0.95,yinc*0.7]);
                            n=n+1;
                            wait.Value=0.9*(n/(ncol*nrow));
                        end
                    end
                    obj=findobj(app.Panel,'Type','Axes');
                    
                    set(obj,'ButtonDownFcn',@axck);
                    
                otherwise %% Coord file visualization
                    [app.allvoxels]=GUI_MV_coordreader(app.Pinfo);
                    [nslice,nrow,ncol]= size(app.allvoxels);
                    app.Panel.AutoResizeChildren='off';
                    app.Panel_2.Visible='off';
                    n=1;
                    pos=get(app.Panel,'Position');
                    xinc=1/nrow ;
                    yinc=1/ncol;
                    
                    for k=1:nrow
                        ystart=(k-1)*yinc;
                        for j=1:ncol
                            xstart=(j-1)*xinc;
                            ax= subplot('Position',[-5 -5 0 0],'Parent',app.Panel);
                            %                             flip(app.allvoxels(app.Slider.Value,k,j).x_ppm),flip(app.allvoxels(app.Slider.Value,k,j).spectra)
                            plot(ax,app.allvoxels(app.Slider.Value,k,j).spectra);% flipdim'de kullanilabilir
                            %                             axis(ax,'on');
                            xticks(ax,[ ]);
                            yticks(ax,[ ]);
                            box(ax,'on');
                            set(ax,'Position',[xstart,1-yinc-ystart,xinc*0.95,yinc*0.7]);
                            n=n+1;
                            wait.Value=0.9*(n/(ncol*nrow));
                            set(ax,'Tag', num2str([k,j]))
                            
                        end
                    end
                    obj=findobj(app.Panel,'Type','Axes');
                    
                    set(obj,'ButtonDownFcn',@ImageClickCallback);
                    
            end
            obj=findobj(app.Panel,'Type','Axes');
            set(obj,'Color',app.Panel.BackgroundColor);
            set(obj,'XColor',app.Panel.BackgroundColor);
            set(obj,'YColor',app.Panel.BackgroundColor);
            
            
            function ImageClickCallback(AxesH, EventData)
                row=strsplit(AxesH.Tag,' ');
                column=row{2};
                row=row{1};
                f=figure;
                ax=subplot(1,1,1,'Parent',f);
                ax=get(f,'Children');
                [app.tabledata,app.metabs,app.corrMatrix,app.sp,app.bg,app.fit,app.coord_filename]=load_lcmodel(app.Pinfo.coordpath,app.Pinfo.sparname,...
                    app.Slider.Value,row,column);
                plotSpectra(app,1,app.sp{1}.ppm,3,ax,[0 0 0],16);
                
                
                
                ... what to do with x and y?
            end
            
            
            function axck(varargin)
                f=figure;
                copyobj(varargin{1},f);
                ax=get(f,'Children');
                set(ax,'Position',[0 0 1 1]);
                %                 varargin{1};
                %                 varargin{2}
            end
            delete(wait);
            %             toc;
            app.currentmodule=1;
            app.mloaddata=1;
            if app.mloaddata>0
                
                set(app.CoregistrationButton,'Enable','on');
                
            end
            app.SliceNumberLabel.Visible='on';
            app.Slider.Visible='on';
            app.Panel.Visible='on';
            %             app.Panel_2.Visible='on';
        end

        % Selection changed function: VisualizationoptionButtonGroup
        function VisualizationoptionButtonGroupSelectionChanged(app, event)
            selectedButton = app.VisualizationoptionButtonGroup.SelectedObject;
            obj=findobj(app.Panel,'type','Axes');
            delete(obj);
            switch selectedButton.Text
                
                case  'Raw data visualization'
                    app.Panel_2.Visible='on';
                otherwise
                    
                    app.Panel_2.Visible='off';
            end
            app.LoadDataButtonPushed(app);
            
        end

        % Button pushed function: ExitButton
        function ExitButtonPushed(app, event)
            delete(app)
        end

        % Button pushed function: CoregistrationButton
        function CoregistrationButtonPushed(app, event)
            app.TabGroup.Visible='off';
            app.Panel_2.Visible='off';
            app.which_map.Visible='off';
            app.ROIatlasDropDown.Visible='off';
            app.ROIAtlasLabel.Visible='off';
            app.VisualizationoptionButtonGroup.Visible='off';
            app.RegionNetworkExclusionEditField.Visible='off';
            app.RegionNetworkExclusionEditFieldLabel.Visible='off';
            app.WhichMetaboliteButtonGroup.Visible='off';
            app.Slider.Visible='off';
            app.SliceNumberLabel.Visible='off';
            app.WhichMetaboliteButtonGroup.Visible='off';
            obj=findobj(app.Panel,'type','Axes');
            delete(obj);
            wait=uiprogressdlg(app.UIFigure,"Message",'Processing.. It will take some time be patient. ','Title','Coregistration');
            app.VisualizationoptionButtonGroup.Visible='off';
            
            app.Metname={'Cr+PCr' 'Glu+Gln' 'GPC+PCh' 'Ins' 'Lac' 'Lip13a' 'Lip13b' 'Lip13a+Lip13b' 'NAA+NAAG'};
            shiftedppm=[3.03 2.25 3.2 3.52 1.3 1.3 1.3 1.3 2.02 ];
            
            for n=1:numel(app.Metname)
                app.Metabolites(n).no=n;
                app.Metabolites(n).name=app.Metname{1,n};
                app.Metabolites(n).ppm=shiftedppm(1,n);
            end
            
            spectrapath=app.Pinfo.spectrapath;
            app.coreg_path=[spectrapath,filesep,'nifti',filesep,'coreg_binary_mask']; % Output files of coregistration binary masks.
            if ~exist(app.coreg_path,'dir')
                mkdir(app.coreg_path);
            end
            if app.coreg_status<1
                
                switch app.MRSIacquiredafterButtonGroup.SelectedObject.Text
                    case 'T1w-MRI'
                        app.Pinfo.MRI= [app.Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,app.Pinfo.name,'_Bet.nii.gz'];
                    otherwise
                        app.Pinfo.MRI= [app.Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T2',filesep,'nifti',filesep,app.Pinfo.name,'_Bet.nii.gz'];
                end
                
                for k=1:numel(app.Metabolites)
                    
                    wait.Value=(k/numel(app.Metabolites))-0.1;
                    
                    MRIFOVMask_file=[app.coreg_path,filesep,app.Pinfo.sparname,'_',app.Metabolites(k).name,'_FOV_mask.nii'];
                    MRIpressMask_file=[app.coreg_path,filesep,app.Pinfo.sparname,'_',app.Metabolites(k).name,'_PressBox_mask.nii'];
                    
                    switch app.ChemicalshiftcorrectionButtonGroup.SelectedObject.Text
                        case 'On'
                            Chem_Shift_Dir_mat=find_chem_shift_directions(app.RFOV_dir, app.chem_shift_dir_AP, app.chem_shift_dir_LR, app.chem_shift_dir_FH);
                            [GR_ex, GR_echo,GR_echo2]=gradient_strength_calc(app.Pinfo.apVOI,app.Pinfo.lrVOI,app.Pinfo.ccVOI,Chem_Shift_Dir_mat,app.RFexBWEditField.Value,app.RFechoBWEditField.Value,app.RFecho2BWEditField.Value);
                            [app.chem_shift_ex(k).no,app.chem_shift_echo(k).no,app.chem_shift_echo2(k).no]=Chem_Shift_calculation(app.Metabolites(k).ppm,GR_ex,GR_echo,GR_echo2,app.ReferenceMetabolite2);
                            [app.Pinfo] = Mask_FOV_run_Pinfo(app.Pinfo,k,MRIFOVMask_file,app.chem_shift_ex(k).no,app.chem_shift_echo(k).no,app.chem_shift_echo2(k).no,app.RFOV_dir);
                            [app.Pinfo] = Mask_Press_run_Pinfo(app.Pinfo,k,MRIpressMask_file,app.chem_shift_ex(k).no,app.chem_shift_echo(k).no,app.chem_shift_echo2(k).no,app.RFOV_dir);
                        otherwise
                            app.chem_shift_ex(k).no=0;
                            app.chem_shift_echo(k).no=0;
                            app.chem_shift_echo2(k).no=0;
                            [app.Pinfo] = Mask_FOV_run_Pinfo(app.Pinfo,k,MRIFOVMask_file,app.chem_shift_ex(k).no,app.chem_shift_echo(k).no,app.chem_shift_echo2(k).no,app.RFOV_dir);
                            [app.Pinfo] = Mask_Press_run_Pinfo(app.Pinfo,k,MRIpressMask_file,app.chem_shift_ex(k).no,app.chem_shift_echo(k).no,app.chem_shift_echo2(k).no,app.RFOV_dir);
                    end
                end
                
                wait.Value=0.95;
                delete(wait);
                app.coreg_status=1;
            end
            %             app.Pinfo
            A= app.Pinfo.FOVimg(app.Metabolites(1).no).fig; %Cr
            B= app.Pinfo.FOVimg(app.Metabolites(5).no).fig; %Lac
            C=app.Pinfo.refimg.fig;
            
            app.Fused_cr=imfuse(A,C);
            app.Fused_cr = rgb2gray(app.Fused_cr);
            app.Fused_cr = double(app.Fused_cr);
            
            app.Fused_lac=imfuse(B,C);
            app.Fused_lac = rgb2gray(app.Fused_lac);
            app.Fused_lac = double(app.Fused_lac);
            
            app.Fused_all=imfuse(A,app.Fused_lac,'falsecolor');
            app.Fused_all = rgb2gray(app.Fused_all);
            app.Fused_all = double(app.Fused_all);
            % Figure Coregistration
            
            
            app.Panel.AutoResizeChildren='off';
            ax=subplot(3,1,1,'Parent',app.Panel);
            imagesc(ax,app.Fused_cr);
            colormap(ax,"gray");
            xticks(ax,[]);
            yticks(ax,[]);
            ax.Title.String=([app.Metabolites(1).name,' FOV box']);
            pos=get(ax,'Position');
            set (ax,'Position',[pos(1)+pos(3)/4 pos(2) pos(3)/2 pos(4)]);
            ax=subplot(3,1,2,'Parent',app.Panel);
            imagesc(ax,app.Fused_lac);
            colormap(ax,"gray");
            xticks(ax,[]);
            yticks(ax,[]);
            ax.Title.String=([app.Metabolites(5).name,' FOV box']);
            pos=get(ax,'Position');
            set (ax,'Position',[pos(1)+pos(3)/4 pos(2) pos(3)/2 pos(4)]);
            ax=subplot(3,1,3,'Parent',app.Panel);
            imagesc(ax,app.Fused_all);
            colormap(ax,"gray");
            xticks(ax,[]);
            yticks(ax,[]);
            ax.Title.String=([app.Metabolites(1).name,' FOV box & ',app.Metabolites(5).name,' FOV box']);
            pos=get(ax,'Position');
            set (ax,'Position',[pos(1)+pos(3)/4 pos(2) pos(3)/2 pos(4)]);
            
            app.mcoregistration=1;
            if  app.mcoregistration>0
                set(app.SegmentationButton,'Enable','on');
                app.Panel.AutoResizeChildren='on';
            end
        end

        % Button pushed function: SegmentationButton
        function SegmentationButtonPushed(app, event)
            tic
            app.TabGroup.Visible='off';
            app.Panel_2.Visible='off';
            app.ROIatlasDropDown.Visible='off';
            app.ROIAtlasLabel.Visible='off';
            app.RegionNetworkExclusionEditField.Visible='off';
            app.RegionNetworkExclusionEditFieldLabel.Visible='off';
            
            app.which_map.Visible='off';
            
            obj=findobj(app.Panel,'type','Axes');
            delete(obj);
            
            %%%% Coreg of Little Voxels and calculation of fractions including CSF, WM and GM of these little voxels.
            litoutpath=[app.Pinfo.spectrapath,filesep,'nifti',filesep,'binary_mask_littlevoxels'];
            if ~exist(litoutpath,'dir')
                mkdir(litoutpath);
            end
            if app.seg_status<1
                [app.Pinfo, AlFWHM, AlSNR, app.AllNumStd, app.AllConc]=GUI_seg(app.UIFigure,app.Metabolites,app.Pinfo, app.chem_shift_ex, app.chem_shift_echo, app.chem_shift_echo2,app.ChemicalshiftcorrectionButtonGroup.SelectedObject.Text,app.MRSIacquiredafterButtonGroup.SelectedObject.Text,litoutpath,app.RFOV_dir);
                app.AllFWHM=AlFWHM;
                app.AllSNR=AlSNR;
                app.fgm= app.Pinfo.frac_GM;
                app.fwm= app.Pinfo.frac_WM;
                app.fcsf=app.Pinfo.frac_CSF;
                app.seg_status=1;
            end
            
            app.outmat=[app.Pinfo.mainpath,'exam_1',filesep,'spectra',filesep,'MAT'];
            if ~exist(app.outmat,'dir')
                mkdir(app.outmat);
            end
            
            %             app.fcsf=app.Pinfo.frac_CSF;
            
            % Fraction Figures in Segmentation Part
            app.Slider.Visible='on';
            app.WhichMetaboliteButtonGroup.Visible='on';
            app.SliceNumberLabel.Visible='on';
            app.WhichMetaboliteButtonGroup.Visible='on';
            button=app.WhichMetaboliteButtonGroup.SelectedObject;
            button=button.Text;
            button=strsplit(button,'Button');
            [~,WhichMetabNo]=ismember(button{1},{app.Metabolites(:).name});
            app.Panel.AutoResizeChildren='off';
            ax=subplot(1,3,1,'Parent',app.Panel);
            fig_fcsf=squeeze(app.fcsf(WhichMetabNo,app.Slider.Value,:,:));
            imagesc(ax,fig_fcsf);
            ax.Title.String=([' fCSF ']);
            axis(ax,'off');
            colormap(ax,"hot");
            colorbar(ax);
            pos=get(ax,'Position');
            set (ax,'Position',[pos(1) 0.5-(pos(3)/2) pos(3) pos(3)+(pos(3)/2)]);
            ax=subplot(1,3,2,'Parent',app.Panel);
            fig_wm=squeeze(app.fwm(WhichMetabNo,app.Slider.Value,:,:));
            imagesc(ax,fig_wm);
            ax.Title.String=(['fWM']);
            axis(ax,'off');
            colormap(ax,"hot");
            colorbar(ax);
            pos=get(ax,'Position');
            set (ax,'Position',[pos(1) 0.5-(pos(3)/2) pos(3) pos(3)+(pos(3)/2)]);
            ax=subplot(1,3,3,'Parent',app.Panel);
            fig_gm=squeeze(app.fgm(WhichMetabNo,app.Slider.Value,:,:));
            imagesc(ax,fig_gm);
            ax.Title.String=(['fGM']);
            axis(ax,'off');
            colormap(ax,"hot");
            colorbar(ax);
            pos=get(ax,'Position');
            set (ax,'Position',[pos(1) 0.5-(pos(3)/2) pos(3) pos(3)+(pos(3)/2)]);
            app.currentmodule=2;
            app.msegmentation=1;
            if  app.msegmentation>0
                set(app.FWHMSNRButton,'Enable','on');
            end
            app.Panel.AutoResizeChildren='on';
            toc
        end

        % Value changed function: Slider
        function SliderValueChanged(app, event)
            value = app.Slider.Value;
            app.Slider.Value=round(value);
            if  app.currentmodule==1
                app.LoadDataButtonPushed(app);
            end
            
            if app.currentmodule==2
                app.SegmentationButtonPushed(app);
            end
            
            if app.currentmodule==3
                app.FWHMSNRButtonPushed(app);
            end
            if  app.currentmodule==4;
                app.SpectralqualityButtonPushed(app);
            end
        end

        % Button pushed function: FWHMSNRButton
        function FWHMSNRButtonPushed(app, event)
            app.TabGroup.Visible='off';
            app.Panel_2.Visible='off';
            app.ROIatlasDropDown.Visible='off';
            app.ROIAtlasLabel.Visible='off';
            app.RegionNetworkExclusionEditField.Visible='off';
            app.RegionNetworkExclusionEditFieldLabel.Visible='off';
            app.Panel.AutoResizeChildren='off';
            app.WhichMetaboliteButtonGroup.Visible='off';
            app.which_map.Visible='off';
            app.SliceNumberLabel.Visible='on';
            
            obj=findobj(app.Panel,'type','Axes');
            delete(obj);
            
            ax=subplot(1,2,1,'Parent',app.Panel);
            
            fig_SNR=squeeze(app.AllSNR(app.Slider.Value,:,:));
            imagesc(ax,fig_SNR);
            %               pos=get(ax,'Position');
            %          pos=[0.25-pos(3)/4, 0.5-(pos(4)/4), pos(3)/2, pos(4)/2]
            %   set (ax,'Position',pos);
            colormap(ax,"hot");
            colorbar(ax);
            axis(ax,'off');
            ax.Title.String=([' SNR']);
            
            ax=subplot(1,2,2,'Parent',app.Panel);
            fig_FWHM=squeeze(app.AllFWHM(app.Slider.Value,:,:)); %app.Slider.Value(1)
            imagesc(ax,fig_FWHM);
            %   pos=get(ax,'Position');
            %          pos2=[0.75-pos(3)/4, 0.5-(pos(4)/4), pos(3)/2, pos(4)/2]
            %   set (ax,'Position',pos2);
            colormap(ax,"hot");
            axis(ax,'off');
            colorbar(ax);
            ax.Title.String=([' FWHM ']);
            app.Panel.AutoResizeChildren='on';
            app.currentmodule=3;
            app.mfhwmsnr=1;
            if  app.mfhwmsnr>0
                set(app.SpectralqualityButton,'Enable','on');
            end
        end

        % Button pushed function: SpectralqualityButton
        function SpectralqualityButtonPushed(app, event)
            app.TabGroup.Visible='off';
            app.Panel_2.Visible='off';
            app.ROIatlasDropDown.Visible='off';
            app.ROIAtlasLabel.Visible='off';
            app.RegionNetworkExclusionEditField.Visible='off';
            app.RegionNetworkExclusionEditFieldLabel.Visible='off';
            app.WhichMetaboliteButtonGroup.Visible='on';
            app.which_map.Visible='off';
            
            obj=findobj(app.Panel,'type','Axes');
            delete(obj);
            
            wait=uiprogressdlg(app.UIFigure,'Title','Processing','Message','Processing..');
            wait.Value=0.2;
            Exc_struct.value= [app.fcsfEditField.Value,app.SNREditField.Value,app.FWHMEditField.Value,app.CRLBEditField.Value ]; %str2num(Exc_info{1,1});
            Exc_struct.name=[{'fcsf'}, {'SNR'}, {'FWHM'}, {'CRLB'}];
            [app.includedvoxels]=ExclusionCriteria(app.Pinfo,app.AllFWHM,app.AllSNR,app.AllNumStd,app.Metname,app.Metabolites,app.outmat,Exc_struct);
            wait.Value=0.7;
            app.WhichMetaboliteButtonGroup.Visible='on';
            %             WhichMetabNo=9;
            button=app.WhichMetaboliteButtonGroup.SelectedObject;
            button=button.Text;
            button=strsplit(button,'Button');
            [~,WhichMetabNo]=ismember(button{1},{app.Metabolites(:).name});
            app.Panel.AutoResizeChildren='off';
            ax=subplot(1,1,1,'Parent',app.Panel);
            fig_included=squeeze(app.includedvoxels(WhichMetabNo,app.Slider.Value,:,:));
            %fliiip
            wait.Value=0.9;
            imagesc(ax,fig_included);
            pos=get(ax,'Position');
            set (ax,'Position',[0.5-(pos(3)/4) 0.5-(pos(4)/4) pos(3)/2 (pos(4)/2)]);
            colormap(ax,"hot");
            colorbar(ax);
            axis(ax,'off');
            ax.Title.String=([' Included voxels']);
            app.Panel.AutoResizeChildren='on';
            app.currentmodule=4;
            app.mincludedvoxels=1;
            if  app.mincludedvoxels>0
                set(app.MetabolitemapsButton,'Enable','on');
            end
        end

        % Button pushed function: MetabolitemapsButton
        function MetabolitemapsButtonPushed(app, event)
            app.TabGroup.Visible='off';
            app.Panel_2.Visible='off';
            app.Slider.Visible='off';
            app.ROIatlasDropDown.Visible='off';
            app.ROIAtlasLabel.Visible='off';
            app.RegionNetworkExclusionEditField.Visible='off';
            app.RegionNetworkExclusionEditFieldLabel.Visible='off';
            app.SliceNumberLabel.Visible='off';
            app.WhichMetaboliteButtonGroup.Visible='off';
            obj=findobj(app.Panel,'type','Axes');
            delete(obj);
            
            wait=uiprogressdlg(app.UIFigure,'Title','Processing','Message','Processing..');
            wait.Value=0.2;
            
            
            if app.metmap_status<1
                Conc_Map_Generation(app.Pinfo,app.AllConc,app.coreg_path,app.Metabolites,app.includedvoxels);
                corrected_conc_map_generation(app.Pinfo,app.AllConc,app.coreg_path,app.Metabolites,app.includedvoxels);
                Conc_to_Ratio_Maps(app.Pinfo);
                corrected_conc_maps_to_ratio_maps(app.Pinfo);
                wait.Value=0.4;
            end
            button=app.WhichMetaboliteButtonGroup.SelectedObject;
            button=button.Text;
            button=strsplit(button,'Button');
            [~,WhichMetabNo]=ismember(button{1},{app.Metabolites(:).name});
            
            button2=app.which_map.SelectedObject;
            button2=button2.Text;
            
            if WhichMetabNo==1
                set(app.concentrationmaptoCrPCrratio,'Enable','off');
                set(app.CSFcorrectedconcetrationmaptoCrPCrratio,'Enable','off');
            else
                set(app.concentrationmaptoCrPCrratio,'Enable','on');
                set(app.CSFcorrectedconcetrationmaptoCrPCrratio,'Enable','on');
            end
            
            if WhichMetabNo==4
                set(app.concentrationmaptoInsRatio,'Enable','off');
                set(app.CSFcorrectedconcentrationmaptoInsratio,'Enable','off');
            else
                set(app.concentrationmaptoInsRatio,'Enable','on');
                set(app.CSFcorrectedconcentrationmaptoInsratio,'Enable','on');
            end
            
            
            switch button2
                
                case 'concentration map'
                    app.vis_map=sprintf('%s_conc.nii',button{1});
                    app.refnii=[app.Pinfo.spectrapath,filesep,'nifti',filesep,'conc_maps',filesep,app.Pinfo.sparname,'_',app.vis_map];
                    
                case 'concentration map to Ins ratio'
                    if   WhichMetabNo==4
                        app.concentrationmap.Value=1;
                        app.MetabolitemapsButtonPushed(app);
                    else
                        app.vis_map=sprintf('%s_conc_to_Ins_ratio.nii',button{1});
                        app.refnii=[app.Pinfo.spectrapath,filesep,'nifti',filesep,'conc_maps_to_Ins_ratio',filesep,app.Pinfo.sparname,'_',app.vis_map];
                    end
                    
                case 'concentration map to tCr ratio'
                    if   WhichMetabNo==1
                        app.concentrationmap.Value=1;
                        app.MetabolitemapsButtonPushed(app);
                        
                    else
                        app.vis_map=sprintf('%s_conc_to_tCr_ratio.nii',button{1});
                        app.refnii=[app.Pinfo.spectrapath,filesep,'nifti',filesep,'conc_maps_to_tCr_ratio',filesep,app.Pinfo.sparname,'_',app.vis_map];
                    end
                    
                case 'CSF corrected concentration map'
                    app.vis_map=sprintf('%s_conc_corrected.nii',button{1});
                    app.refnii=[app.Pinfo.spectrapath,filesep,'nifti',filesep,'corrected_conc_maps',filesep,app.Pinfo.sparname,'_',app.vis_map];
                    
                case 'CSF corrected concentration map to Ins ratio'
                    if   WhichMetabNo==4
                        app.concentrationmap.Value=1;
                        app.MetabolitemapsButtonPushed(app);
                    else
                        app.vis_map=sprintf('%s_conc_to_Ins_ratio_corrected.nii',button{1});
                        app.refnii=[app.Pinfo.spectrapath,filesep,'nifti',filesep,'corrected_conc_maps_to_Ins_ratio',filesep,app.Pinfo.sparname,'_',app.vis_map];
                    end
                case 'CSF corrected concetration map to tCr ratio'
                    if   WhichMetabNo==1
                        app.concentrationmap.Value=1;
                        app.MetabolitemapsButtonPushed(app);
                    else
                        app.vis_map=sprintf('%s_conc_to_tCr_ratio_corrected.nii',button{1});
                        app.refnii=[app.Pinfo.spectrapath,filesep,'nifti',filesep,'corrected_conc_maps_to_tCr_ratio',filesep,app.Pinfo.sparname,'_',app.vis_map];
                    end
            end
            
            app.WhichMetaboliteButtonGroup.Visible='on';
            app.which_map.Visible='on';
            %Figure
            [three_plane_img]=fig_volumes(app.Pinfo,app.refnii);
            Fused_img=imfuse(three_plane_img,app.Pinfo.refimg.fig);
            Fused_img = rgb2gray(Fused_img);
            Fused_img = double(Fused_img);
            
            wait.Value=0.8;
            delete(wait);
            app.Panel.AutoResizeChildren='off';
            ax=subplot(2,1,1,'Parent',app.Panel);
            imagesc(ax,three_plane_img);
            pos=get(ax,'Position');
            pos2=[0.20+pos(1), pos(2), pos(3)/1.25, pos(4)/1.25];
            set (ax,'Position',pos2);
            
            axis(ax,'off');
            ax.Title.String=([button button2]);
            ax=subplot(2,1,2,'Parent',app.Panel);
            imagesc(ax,Fused_img);
            pos=get(ax,'Position');
            pos2=[0.20+pos(1), pos(2), pos(3)/1.25, pos(4)/1.25];
            set (ax,'Position',pos2);
            axis(ax,'off');
            ax.Title.String=(['its overlay onto reference anotomical image ']);
            app.currentmodule=5;
            app.metmap_status=1;
            app.mmetabolitemaps=1;
            if  app.mmetabolitemaps>0
                set(app.RegistrationButton,'Enable','on');
            end
        end

        % Button pushed function: RegistrationButton
        function RegistrationButtonPushed(app, event)
            app.Panel_2.Visible='off';
            app.TabGroup.Visible='off';
            app.ROIatlasDropDown.Visible='off';
            app.ROIAtlasLabel.Visible='off';
            app.RegionNetworkExclusionEditField.Visible='off';
            app.RegionNetworkExclusionEditFieldLabel.Visible='off';
            
            
            app.WhichMetaboliteButtonGroup.Visible='on';
            app.which_map.Visible='on';
            
            obj=findobj(app.Panel,'type','Axes');
            delete(obj);
            
            wait=uiprogressdlg(app.UIFigure,'Title','Processing','Message','Processing..');
            wait.Value=0.2;
            
            if app.regist_status<1
                app_MRSIacquiredafterButtonGroup_SelectedObject_Text=app.MRSIacquiredafterButtonGroup.SelectedObject.Text;
                wait.Value=0.4;
                
                MNI_brain_Registration(app.Pinfo,app_MRSIacquiredafterButtonGroup_SelectedObject_Text);
                wait.Value=0.6;
            end
            
            button=app.WhichMetaboliteButtonGroup.SelectedObject;
            button=button.Text;
            button=strsplit(button,'Button');
            [~,WhichMetabNo]=ismember(button{1},{app.Metabolites(:).name});
            
            button2=app.which_map.SelectedObject;
            button2=button2.Text;
            
            if WhichMetabNo==1
                set(app.concentrationmaptoCrPCrratio,'Enable','off');
                set(app.CSFcorrectedconcetrationmaptoCrPCrratio,'Enable','off');
            else
                set(app.concentrationmaptoCrPCrratio,'Enable','on');
                set(app.CSFcorrectedconcetrationmaptoCrPCrratio,'Enable','on');
            end
            
            if WhichMetabNo==4
                set(app.concentrationmaptoInsRatio,'Enable','off');
                set(app.CSFcorrectedconcentrationmaptoInsratio,'Enable','off');
            else
                set(app.concentrationmaptoInsRatio,'Enable','on');
                set(app.CSFcorrectedconcentrationmaptoInsratio,'Enable','on');
            end
            
            
            switch button2
                
                case 'concentration map'
                    app.vis_map=sprintf('%s_conc_reg_MNI.nii.gz',button{1});
                    
                case 'concentration map to Ins ratio'
                    if   WhichMetabNo==4
                        app.concentrationmap.Value=1;
                        app.RegistrationButtonPushed(app);
                    else
                        app.vis_map=sprintf('%s_conc_to_Ins_ratio_reg_MNI.nii.gz',button{1});
                    end
                    
                case 'concentration map to tCr ratio'
                    if   WhichMetabNo==1
                        app.concentrationmap.Value=1;
                        app.RegistrationButtonPushed(app);
                        
                    else
                        app.vis_map=sprintf('%s_conc_to_tCr_ratio_reg_MNI.nii.gz',button{1});
                    end
                    
                case 'CSF corrected concentration map'
                    app.vis_map=sprintf('%s_conc_corrected_reg_MNI.nii.gz',button{1});
                    
                case 'CSF corrected concentration map to Ins ratio'
                    if   WhichMetabNo==4
                        app.concentrationmap.Value=1;
                        app.RegistrationButtonPushed(app);
                    else
                        app.vis_map=sprintf('%s_conc_to_Ins_ratio_corrected_reg_MNI.nii.gz',button{1});
                    end
                case 'CSF corrected concetration map to tCr ratio'
                    if   WhichMetabNo==1
                        app.concentrationmap.Value=1;
                        app.RegistrationButtonPushed(app);
                    else
                        app.vis_map=sprintf('%s_conc_to_tCr_ratio_corrected_reg_MNI.nii.gz',button{1});
                        
                    end
            end
            
            refnii=[app.Pinfo.spectrapath,filesep,'nifti',filesep,'MNI_regist',filesep,app.Pinfo.sparname,'_',app.vis_map];
            
            %Figure
            [three_plane_img]=fig_volumes(app.Pinfo,refnii);
            registmni=[app.Pinfo.spectrapath,filesep,'nifti',filesep,'MNI_regist',filesep,'reg_to_MNI.nii.gz'];
            [three_plane_img2]=fig_volumes(app.Pinfo,registmni);
            Fused_img=imfuse(three_plane_img,three_plane_img2);
            Fused_img = rgb2gray(Fused_img);
            Fused_img = double(Fused_img);
            
            wait.Value=0.8;
            delete(wait);
            app.Panel.AutoResizeChildren='off';
            ax=subplot(2,1,1,'Parent',app.Panel);
            imagesc(ax,three_plane_img);
            pos=get(ax,'Position');
            pos2=[0.20+pos(1), pos(2), pos(3)/1.25, pos(4)/1.25];
            set (ax,'Position',pos2);
            
            axis(ax,'off');
            ax.Title.String=([button button2 ' registration onto MNI152 brain atlas']);
            ax=subplot(2,1,2,'Parent',app.Panel);
            imagesc(ax,Fused_img);
            pos=get(ax,'Position');
            pos2=[0.20+pos(1), pos(2), pos(3)/1.25, pos(4)/1.25];
            set (ax,'Position',pos2);
            axis(ax,'off');
            ax.Title.String=(['its overlay onto MNI152 brain atlas']);
            
            app.mregistration=1;
            if  app.mregistration>0
                set(app.ROIAnalyzeButton,'Enable','on');
            end
            app.currentmodule=6;
            app.regist_status=1;
            
        end

        % Button pushed function: ROIAnalyzeButton
        function ROIAnalyzeButtonPushed(app, event)
            app.Panel_2.Visible='off';
            app.which_map.Visible='off';
            app.WhichMetaboliteButtonGroup.Visible='off';
            app.TabGroup.Visible='on';
            app.ROIatlasDropDown.Visible='on';
            app.ROIAtlasLabel.Visible='on';
            app.RegionNetworkExclusionEditField.Visible='on';
            app.RegionNetworkExclusionEditFieldLabel.Visible='on';
            
            obj=findobj(app.Panel,'type','Axes');
            delete(obj);
            wait=uiprogressdlg(app.UIFigure,'Title','Processing','Message','Processing..');
            wait.Value=0.2;
            if app.roi_status<1
                CreatingAnalysisData(app.Pinfo,app.Metabolites,app.Range01EditField.Value);
                GM_WM_CSF_pressbox(app.Pinfo,app.Metabolites,app.MRSIacquiredafterButtonGroup.SelectedObject.Text);
                
                wait.Value=0.5;
                
                switch app.ROIatlasDropDown.Value
                    
                    case 'Schaefer2018_100Parcels_7Networks_2mm'
                        app.atlaspath='Schaefer2018_100Parcels_7Networks_order_FSLMNI152_2mm.nii.gz';
                        
                    case 'Schaefer2018_400Parcels_7Networks_2mm'
                        app.atlaspath='Schaefer2018_100Parcels_7Networks_order_FSLMNI152_2mm.nii.gz';
                    case 'MNI_thr0_2mm'
                        app.atlaspath='MNI-maxprob-thr0-2mm.nii.gz';
                    case 'MNI_thr25_2mm'
                        app.atlaspath='MNI-maxprob-thr25-2mm.nii.gz';
                    case 'MNI_thr50_2mm'
                        app.atlaspath='MNI-maxprob-thr50-2mm.nii.gz';
                end
                
                
                [app.meanTab,app.medianTab,app.stdTab]=ScriptAnalyze(app.Pinfo,app.atlaspath,app.RegionNetworkExclusionEditField.Value);
            end
            app.TabGroup.Visible='on';
            app.meantable.Data=cell2table(app.meanTab);
            app.mediantable.Data=cell2table(app.medianTab);
            app.stdtable.Data=cell2table(app.stdTab);
            
            app.roi_status=0;
            
            wait.Value=1;
            delete(wait);
            
        end

        % Size changed function: Panel2
        function Panel2SizeChanged(app, event)
            position = app.Panel2.Position;
            
        end

        % Selection changed function: WhichMetaboliteButtonGroup
        function WhichMetaboliteButtonGroupSelectionChanged(app, event)
            selectedButton = app.WhichMetaboliteButtonGroup.SelectedObject;
            
            button=app.WhichMetaboliteButtonGroup.SelectedObject;
            button=button.Text;
            button=strsplit(button,'Button');
            [~,WhichMetabNo]=ismember(button{1},{app.Metabolites(:).name});
            
            if app.currentmodule==2;
                app.SegmentationButtonPushed(app);
            end
            
            if  app.currentmodule==4;
                app.SpectralqualityButtonPushed(app);
            end
            
            if app.currentmodule==5
                %                 set(app.concentrationmaptoCrPCrratio,'Enable','on');
                %                 set(app.concentrationmaptoInsRatio,'Enable','on');
                if WhichMetabNo==1
                    set(app.concentrationmaptoCrPCrratio,'Enable','off');
                    set(app.CSFcorrectedconcetrationmaptoCrPCrratio,'Enable','off');
                else
                    set(app.concentrationmaptoCrPCrratio,'Enable','on');
                    set(app.CSFcorrectedconcetrationmaptoCrPCrratio,'Enable','on');
                end
                if WhichMetabNo==4
                    set(app.concentrationmaptoInsRatio,'Enable','off');
                    set(app.CSFcorrectedconcentrationmaptoInsratio,'Enable','off');
                else
                    set(app.concentrationmaptoInsRatio,'Enable','on');
                    set(app.CSFcorrectedconcentrationmaptoInsratio,'Enable','on');
                end
                app.MetabolitemapsButtonPushed(app);
            end
            if app.currentmodule==6
                %                 set(app.concentrationmaptoCrPCrratio,'Enable','on');
                %                 set(app.concentrationmaptoInsRatio,'Enable','on');
                if WhichMetabNo==1
                    set(app.concentrationmaptoCrPCrratio,'Enable','off');
                    set(app.CSFcorrectedconcetrationmaptoCrPCrratio,'Enable','off');
                else
                    set(app.concentrationmaptoCrPCrratio,'Enable','on');
                    set(app.CSFcorrectedconcetrationmaptoCrPCrratio,'Enable','on');
                end
                if WhichMetabNo==4
                    set(app.concentrationmaptoInsRatio,'Enable','off');
                    set(app.CSFcorrectedconcentrationmaptoInsratio,'Enable','off');
                else
                    set(app.concentrationmaptoInsRatio,'Enable','on');
                    set(app.CSFcorrectedconcentrationmaptoInsratio,'Enable','on');
                end
                app.RegistrationButtonPushed(app);
            end
        end

        % Value changed function: TextArea_2
        function TextArea_2ValueChanged(app, event)
            value = app.TextArea_2.Value;
            
        end

        % Button pushed function: AdjustPlotButton
        function AdjustPlotButtonPushed(app, event)
            findobj_plot=findobj(app.Panel,'type','Axes');
            findobj_plot(1);
            findobj_plot(2);
            set(findobj_plot,'xlim',[app.XminEditField.Value app.XmaxEditField.Value],'ylim',[app.YminEditField.Value app.YmaxEditField.Value]);
        end

        % Selection changed function: which_map
        function which_mapSelectionChanged(app, event)
            selectedButton = app.which_map.SelectedObject;
            if app.currentmodule==5
                app.MetabolitemapsButtonPushed(app);
            end
            if app.currentmodule==6
                app.RegistrationButtonPushed(app);
            end
        end

        % Value changed function: ROIatlasDropDown
        function ROIatlasDropDownValueChanged(app, event)
            app.ROIAnalyzeButtonPushed(app);
        end

        % Value changed function: RegionNetworkExclusionEditField
        function RegionNetworkExclusionEditFieldValueChanged(app, event)
            %             value = app.RegionNetworkExclusionEditField.Value;
            app.ROIAnalyzeButtonPushed(app);
        end

        % Image clicked function: oryxlogo
        function oryxlogoImageClicked(app, event)
            web('https://github.com/sevimcengiz/Oryx-MRSI','-browser')
        end

        % Image clicked function: Oryxlogo
        function OryxlogoImageClicked(app, event)
            web('https://github.com/sevimcengiz/Oryx-MRSI','-browser')
        end

        % Image clicked function: github
        function githubImageClicked(app, event)
            web('https://github.com/sevimcengiz/Oryx-MRSI','-browser')
        end

        % Selection changed function: RFOVDirButtonGroup
        function RFOVDirButtonGroupSelectionChanged(app, event)
            selectedButton = app.RFOVDirButtonGroup.SelectedObject;
            app.RFOV_dir=app.RFOVDirButtonGroup.SelectedObject.Text;
        end

        % Selection changed function: ChemicalShiftDirAPButtonGroup
        function ChemicalShiftDirAPButtonGroupSelectionChanged(app, event)
            selectedButton = app.ChemicalShiftDirAPButtonGroup.SelectedObject;
            app.chem_shift_dir_AP=app.ChemicalShiftDirAPButtonGroup.SelectedObject.Text;
        end

        % Selection changed function: ChemicalShiftDirLRButtonGroup
        function ChemicalShiftDirLRButtonGroupSelectionChanged(app, event)
            selectedButton = app.ChemicalShiftDirLRButtonGroup.SelectedObject;
            app.chem_shift_dir_LR=app.ChemicalShiftDirLRButtonGroup.SelectedObject.Text;
        end

        % Selection changed function: ChemicalShiftDirFHButtonGroup
        function ChemicalShiftDirFHButtonGroupSelectionChanged(app, event)
            selectedButton = app.ChemicalShiftDirFHButtonGroup.SelectedObject;
            app.chem_shift_dir_FH=app.ChemicalShiftDirFHButtonGroup.SelectedObject.Text;
        end

        % Selection changed function: ReferenceMetabolite
        function ReferenceMetaboliteSelectionChanged(app, event)
            selectedButton = app.ReferenceMetabolite.SelectedObject;
            app.ReferenceMetabolite2=app.ReferenceMetabolite.SelectedObject.Text;
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1400 800];
            app.UIFigure.Name = 'MATLAB App';

            % Create Panel1
            app.Panel1 = uipanel(app.UIFigure);
            app.Panel1.BorderType = 'none';
            app.Panel1.TitlePosition = 'centertop';
            app.Panel1.Title = 'ORYX MRSI';
            app.Panel1.SizeChangedFcn = createCallbackFcn(app, @Panel1SizeChanged, true);
            app.Panel1.FontWeight = 'bold';
            app.Panel1.FontSize = 20;
            app.Panel1.Position = [1 1 1400 800];

            % Create MRSIacquiredafterButtonGroup
            app.MRSIacquiredafterButtonGroup = uibuttongroup(app.Panel1);
            app.MRSIacquiredafterButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @MRSIacquiredafterButtonGroupSelectionChanged, true);
            app.MRSIacquiredafterButtonGroup.TitlePosition = 'centertop';
            app.MRSIacquiredafterButtonGroup.Title = 'MRSI acquired after';
            app.MRSIacquiredafterButtonGroup.FontSize = 20;
            app.MRSIacquiredafterButtonGroup.Position = [303 565 241 106];

            % Create T1wMRIButton
            app.T1wMRIButton = uiradiobutton(app.MRSIacquiredafterButtonGroup);
            app.T1wMRIButton.Text = 'T1w-MRI';
            app.T1wMRIButton.FontSize = 20;
            app.T1wMRIButton.FontColor = [0.149 0.149 0.149];
            app.T1wMRIButton.Position = [65 49 112 24];

            % Create T2wMRIButton
            app.T2wMRIButton = uiradiobutton(app.MRSIacquiredafterButtonGroup);
            app.T2wMRIButton.Text = 'T2w-MRI';
            app.T2wMRIButton.FontSize = 20;
            app.T2wMRIButton.FontColor = [0.149 0.149 0.149];
            app.T2wMRIButton.Position = [65 16 104 24];
            app.T2wMRIButton.Value = true;

            % Create RFexBWEditFieldLabel
            app.RFexBWEditFieldLabel = uilabel(app.Panel1);
            app.RFexBWEditFieldLabel.HorizontalAlignment = 'right';
            app.RFexBWEditFieldLabel.FontSize = 20;
            app.RFexBWEditFieldLabel.FontColor = [0.149 0.149 0.149];
            app.RFexBWEditFieldLabel.Position = [650 275 109 25];
            app.RFexBWEditFieldLabel.Text = 'RF ex - BW';

            % Create RFechoBWEditFieldLabel
            app.RFechoBWEditFieldLabel = uilabel(app.Panel1);
            app.RFechoBWEditFieldLabel.HorizontalAlignment = 'right';
            app.RFechoBWEditFieldLabel.FontSize = 20;
            app.RFechoBWEditFieldLabel.FontColor = [0.149 0.149 0.149];
            app.RFechoBWEditFieldLabel.Position = [650 235 131 25];
            app.RFechoBWEditFieldLabel.Text = 'RF echo - BW';

            % Create RFecho2BWEditFieldLabel
            app.RFecho2BWEditFieldLabel = uilabel(app.Panel1);
            app.RFecho2BWEditFieldLabel.HorizontalAlignment = 'right';
            app.RFecho2BWEditFieldLabel.FontSize = 20;
            app.RFecho2BWEditFieldLabel.FontColor = [0.149 0.149 0.149];
            app.RFecho2BWEditFieldLabel.Position = [650 195 149 25];
            app.RFecho2BWEditFieldLabel.Text = 'RF echo 2 - BW';

            % Create RFBandwidthofthesystemLabel
            app.RFBandwidthofthesystemLabel = uilabel(app.Panel1);
            app.RFBandwidthofthesystemLabel.FontSize = 20;
            app.RFBandwidthofthesystemLabel.Position = [650 320 262 25];
            app.RFBandwidthofthesystemLabel.Text = 'RF Bandwidth of the system';

            % Create fCSFLabel
            app.fCSFLabel = uilabel(app.Panel1);
            app.fCSFLabel.HorizontalAlignment = 'right';
            app.fCSFLabel.FontSize = 20;
            app.fCSFLabel.FontColor = [0.149 0.149 0.149];
            app.fCSFLabel.Position = [650 490 129 26];
            app.fCSFLabel.Text = 'fCSF            >';

            % Create CutoffvaluesforexclusioncriteriaLabel
            app.CutoffvaluesforexclusioncriteriaLabel = uilabel(app.Panel1);
            app.CutoffvaluesforexclusioncriteriaLabel.FontSize = 20;
            app.CutoffvaluesforexclusioncriteriaLabel.Position = [650 525 321 25];
            app.CutoffvaluesforexclusioncriteriaLabel.Text = 'Cut-off values for exclusion criteria';

            % Create CRLBLabel
            app.CRLBLabel = uilabel(app.Panel1);
            app.CRLBLabel.HorizontalAlignment = 'right';
            app.CRLBLabel.FontSize = 20;
            app.CRLBLabel.FontColor = [0.149 0.149 0.149];
            app.CRLBLabel.Position = [650 450 131 25];
            app.CRLBLabel.Text = 'CRLB           >';

            % Create SNRLabel
            app.SNRLabel = uilabel(app.Panel1);
            app.SNRLabel.HorizontalAlignment = 'right';
            app.SNRLabel.FontSize = 20;
            app.SNRLabel.FontColor = [0.149 0.149 0.149];
            app.SNRLabel.Position = [650 370 131 25];
            app.SNRLabel.Text = 'SNR             <';

            % Create FWHMLabel
            app.FWHMLabel = uilabel(app.Panel1);
            app.FWHMLabel.HorizontalAlignment = 'right';
            app.FWHMLabel.FontSize = 20;
            app.FWHMLabel.FontColor = [0.149 0.149 0.149];
            app.FWHMLabel.Position = [650 410 130 25];
            app.FWHMLabel.Text = 'FWHM         >';

            % Create Range01EditField
            app.Range01EditField = uieditfield(app.Panel1, 'numeric');
            app.Range01EditField.Limits = [0 1];
            app.Range01EditField.ValueChangedFcn = createCallbackFcn(app, @Range01EditFieldValueChanged, true);
            app.Range01EditField.HorizontalAlignment = 'center';
            app.Range01EditField.FontSize = 20;
            app.Range01EditField.FontColor = [0.651 0.651 0.651];
            app.Range01EditField.Position = [645 565 318 26];
            app.Range01EditField.Value = 0.9;

            % Create NotesTextArea
            app.NotesTextArea = uitextarea(app.Panel1);
            app.NotesTextArea.ValueChangedFcn = createCallbackFcn(app, @CRLBEditFieldValueChanged, true);
            app.NotesTextArea.FontSize = 20;
            app.NotesTextArea.Position = [88 45 1218 120];
            app.NotesTextArea.Value = {''; '- Data imaging system Left, Posterior, Superior (LPS)'; '- The current version of the code only calculates the directions for transverse slice orientation and 3D scan mode.'; '- Cr+PCr, Glu+Gln, GPc+PCh, Ins, Lip 13a, Lip13b, Lip 13a+Lip13b, NAA+NAAG metabolites will be evaluated.'};

            % Create RFexBWEditField
            app.RFexBWEditField = uieditfield(app.Panel1, 'numeric');
            app.RFexBWEditField.ValueChangedFcn = createCallbackFcn(app, @RFexBWEditFieldValueChanged, true);
            app.RFexBWEditField.HorizontalAlignment = 'center';
            app.RFexBWEditField.FontSize = 20;
            app.RFexBWEditField.FontColor = [0.651 0.651 0.651];
            app.RFexBWEditField.Position = [850 275 100 26];
            app.RFexBWEditField.Value = 4253;

            % Create RFechoBWEditField
            app.RFechoBWEditField = uieditfield(app.Panel1, 'numeric');
            app.RFechoBWEditField.ValueChangedFcn = createCallbackFcn(app, @RFechoBWEditFieldValueChanged, true);
            app.RFechoBWEditField.HorizontalAlignment = 'center';
            app.RFechoBWEditField.FontSize = 20;
            app.RFechoBWEditField.FontColor = [0.651 0.651 0.651];
            app.RFechoBWEditField.Position = [850 235 100 26];
            app.RFechoBWEditField.Value = 1269;

            % Create RFecho2BWEditField
            app.RFecho2BWEditField = uieditfield(app.Panel1, 'numeric');
            app.RFecho2BWEditField.ValueChangedFcn = createCallbackFcn(app, @RFecho2BWEditFieldValueChanged, true);
            app.RFecho2BWEditField.HorizontalAlignment = 'center';
            app.RFecho2BWEditField.FontSize = 20;
            app.RFecho2BWEditField.FontColor = [0.651 0.651 0.651];
            app.RFecho2BWEditField.Position = [850 195 100 26];
            app.RFecho2BWEditField.Value = 1269;

            % Create fcsfEditField
            app.fcsfEditField = uieditfield(app.Panel1, 'numeric');
            app.fcsfEditField.Limits = [0 1];
            app.fcsfEditField.ValueChangedFcn = createCallbackFcn(app, @fcsfEditFieldValueChanged, true);
            app.fcsfEditField.HorizontalAlignment = 'center';
            app.fcsfEditField.FontSize = 20;
            app.fcsfEditField.FontColor = [0.651 0.651 0.651];
            app.fcsfEditField.Position = [850 490 98 26];
            app.fcsfEditField.Value = 0.3;

            % Create CRLBEditField
            app.CRLBEditField = uieditfield(app.Panel1, 'numeric');
            app.CRLBEditField.Limits = [0 100];
            app.CRLBEditField.ValueChangedFcn = createCallbackFcn(app, @CRLBEditFieldValueChanged, true);
            app.CRLBEditField.HorizontalAlignment = 'center';
            app.CRLBEditField.FontSize = 20;
            app.CRLBEditField.FontColor = [0.651 0.651 0.651];
            app.CRLBEditField.Position = [850 450 98 26];
            app.CRLBEditField.Value = 30;

            % Create SNREditField
            app.SNREditField = uieditfield(app.Panel1, 'numeric');
            app.SNREditField.Limits = [0 10];
            app.SNREditField.ValueChangedFcn = createCallbackFcn(app, @SNREditFieldValueChanged, true);
            app.SNREditField.HorizontalAlignment = 'center';
            app.SNREditField.FontSize = 20;
            app.SNREditField.FontColor = [0.651 0.651 0.651];
            app.SNREditField.Position = [850 370 98 26];
            app.SNREditField.Value = 8;

            % Create FWHMEditField
            app.FWHMEditField = uieditfield(app.Panel1, 'numeric');
            app.FWHMEditField.Limits = [0 2];
            app.FWHMEditField.ValueChangedFcn = createCallbackFcn(app, @FWHMEditFieldValueChanged, true);
            app.FWHMEditField.HorizontalAlignment = 'center';
            app.FWHMEditField.FontSize = 20;
            app.FWHMEditField.FontColor = [0.651 0.651 0.651];
            app.FWHMEditField.Position = [850 410 98 26];
            app.FWHMEditField.Value = 0.1;

            % Create DoneButton
            app.DoneButton = uibutton(app.Panel1, 'push');
            app.DoneButton.ButtonPushedFcn = createCallbackFcn(app, @DoneButtonPushed, true);
            app.DoneButton.FontSize = 20;
            app.DoneButton.Position = [649 5 98 32];
            app.DoneButton.Text = 'Done';

            % Create ChemicalshiftcorrectionButtonGroup
            app.ChemicalshiftcorrectionButtonGroup = uibuttongroup(app.Panel1);
            app.ChemicalshiftcorrectionButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ChemicalshiftcorrectionButtonGroupSelectionChanged, true);
            app.ChemicalshiftcorrectionButtonGroup.TitlePosition = 'centertop';
            app.ChemicalshiftcorrectionButtonGroup.Title = 'Chemical shift correction';
            app.ChemicalshiftcorrectionButtonGroup.FontSize = 20;
            app.ChemicalshiftcorrectionButtonGroup.Position = [1050 570 251 100];

            % Create OnButton
            app.OnButton = uiradiobutton(app.ChemicalshiftcorrectionButtonGroup);
            app.OnButton.Text = 'On';
            app.OnButton.FontSize = 20;
            app.OnButton.Position = [100 45 58 23];
            app.OnButton.Value = true;

            % Create OffButton
            app.OffButton = uiradiobutton(app.ChemicalshiftcorrectionButtonGroup);
            app.OffButton.Text = 'Off';
            app.OffButton.FontSize = 20;
            app.OffButton.Position = [100 14 65 23];

            % Create TextArea_2
            app.TextArea_2 = uitextarea(app.Panel1);
            app.TextArea_2.ValueChangedFcn = createCallbackFcn(app, @TextArea_2ValueChanged, true);
            app.TextArea_2.HorizontalAlignment = 'center';
            app.TextArea_2.FontSize = 20;
            app.TextArea_2.BackgroundColor = [0.9412 0.9412 0.9412];
            app.TextArea_2.Position = [645 590 318 80];
            app.TextArea_2.Value = {'Cut-off value for the probabilistic binary map after MNI152 registration'};

            % Create Oryxlogo
            app.Oryxlogo = uiimage(app.Panel1);
            app.Oryxlogo.ImageClickedFcn = createCallbackFcn(app, @OryxlogoImageClicked, true);
            app.Oryxlogo.Position = [86 575 150 150];
            app.Oryxlogo.ImageSource = 'logo.png';

            % Create SelectaSPARfileButton
            app.SelectaSPARfileButton = uibutton(app.Panel1, 'push');
            app.SelectaSPARfileButton.ButtonPushedFcn = createCallbackFcn(app, @SelectaSPARfileButtonPushed, true);
            app.SelectaSPARfileButton.FontSize = 20;
            app.SelectaSPARfileButton.Position = [303 694 998 33];
            app.SelectaSPARfileButton.Text = 'Select an SPAR file';

            % Create Label
            app.Label = uilabel(app.Panel1);
            app.Label.HorizontalAlignment = 'right';
            app.Label.Position = [380 296 55 23];
            app.Label.Text = '';

            % Create TextArea_3
            app.TextArea_3 = uitextarea(app.Panel1);
            app.TextArea_3.FontSize = 18;
            app.TextArea_3.Position = [88 370 540 178];
            app.TextArea_3.Value = {'Metabolite concentration maps'; 'Metabolite concentration to Cr+PCr ratio maps'; 'Metabolite concentration to Ins ratio maps'; 'CSF Corrected metabolite concentration maps'; 'CSF Corrected metabolite concentration to Cr+PCr ratio maps'; 'CSF Corrected metabolite concentration to Ins ratio maps'; 'Registration of all maps onto MNI152 brain atlas'};

            % Create ChemicalShiftDirAPButtonGroup
            app.ChemicalShiftDirAPButtonGroup = uibuttongroup(app.Panel1);
            app.ChemicalShiftDirAPButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ChemicalShiftDirAPButtonGroupSelectionChanged, true);
            app.ChemicalShiftDirAPButtonGroup.TitlePosition = 'centertop';
            app.ChemicalShiftDirAPButtonGroup.Title = 'Chemical Shift Dir (AP)';
            app.ChemicalShiftDirAPButtonGroup.FontSize = 20;
            app.ChemicalShiftDirAPButtonGroup.Position = [1050 374 251 100];

            % Create AButton
            app.AButton = uiradiobutton(app.ChemicalShiftDirAPButtonGroup);
            app.AButton.Text = 'A';
            app.AButton.FontSize = 20;
            app.AButton.Position = [100 44 58 23];
            app.AButton.Value = true;

            % Create PButton
            app.PButton = uiradiobutton(app.ChemicalShiftDirAPButtonGroup);
            app.PButton.Text = 'P';
            app.PButton.FontSize = 20;
            app.PButton.Position = [100 14 65 23];

            % Create ReferenceMetabolite
            app.ReferenceMetabolite = uibuttongroup(app.Panel1);
            app.ReferenceMetabolite.SelectionChangedFcn = createCallbackFcn(app, @ReferenceMetaboliteSelectionChanged, true);
            app.ReferenceMetabolite.TitlePosition = 'centertop';
            app.ReferenceMetabolite.Title = 'Reference Metabolite';
            app.ReferenceMetabolite.FontSize = 20;
            app.ReferenceMetabolite.Position = [88 180 540 180];

            % Create H2OButton
            app.H2OButton = uiradiobutton(app.ReferenceMetabolite);
            app.H2OButton.Text = 'H2O';
            app.H2OButton.FontSize = 20;
            app.H2OButton.Position = [240 127 63 24];

            % Create NAAButton
            app.NAAButton = uiradiobutton(app.ReferenceMetabolite);
            app.NAAButton.Text = 'NAA';
            app.NAAButton.FontSize = 20;
            app.NAAButton.Position = [240 99 65 24];
            app.NAAButton.Value = true;

            % Create CrButton
            app.CrButton = uiradiobutton(app.ReferenceMetabolite);
            app.CrButton.Text = 'Cr';
            app.CrButton.FontSize = 20;
            app.CrButton.Position = [240 70 65 23];

            % Create ChoButton
            app.ChoButton = uiradiobutton(app.ReferenceMetabolite);
            app.ChoButton.Text = 'Cho';
            app.ChoButton.FontSize = 20;
            app.ChoButton.Position = [240 40 59 23];

            % Create LacLipButton
            app.LacLipButton = uiradiobutton(app.ReferenceMetabolite);
            app.LacLipButton.Text = 'Lac/Lip';
            app.LacLipButton.FontSize = 20;
            app.LacLipButton.Position = [240 10 88 23];

            % Create RFOVDirButtonGroup
            app.RFOVDirButtonGroup = uibuttongroup(app.Panel1);
            app.RFOVDirButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @RFOVDirButtonGroupSelectionChanged, true);
            app.RFOVDirButtonGroup.TitlePosition = 'centertop';
            app.RFOVDirButtonGroup.Title = 'RFOV Dir';
            app.RFOVDirButtonGroup.FontSize = 20;
            app.RFOVDirButtonGroup.Position = [1050 473 251 100];

            % Create RLButton
            app.RLButton = uiradiobutton(app.RFOVDirButtonGroup);
            app.RLButton.Text = 'RL';
            app.RLButton.FontSize = 20;
            app.RLButton.Position = [100 44 47 23];
            app.RLButton.Value = true;

            % Create APButton
            app.APButton = uiradiobutton(app.RFOVDirButtonGroup);
            app.APButton.Text = 'AP';
            app.APButton.FontSize = 20;
            app.APButton.Position = [100 13 65 24];

            % Create ChemicalShiftDirLRButtonGroup
            app.ChemicalShiftDirLRButtonGroup = uibuttongroup(app.Panel1);
            app.ChemicalShiftDirLRButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ChemicalShiftDirLRButtonGroupSelectionChanged, true);
            app.ChemicalShiftDirLRButtonGroup.TitlePosition = 'centertop';
            app.ChemicalShiftDirLRButtonGroup.Title = 'Chemical Shift Dir (LR)';
            app.ChemicalShiftDirLRButtonGroup.FontSize = 20;
            app.ChemicalShiftDirLRButtonGroup.Position = [1050 276 251 100];

            % Create LButton
            app.LButton = uiradiobutton(app.ChemicalShiftDirLRButtonGroup);
            app.LButton.Text = 'L';
            app.LButton.FontSize = 20;
            app.LButton.Position = [100 44 58 23];
            app.LButton.Value = true;

            % Create RButton
            app.RButton = uiradiobutton(app.ChemicalShiftDirLRButtonGroup);
            app.RButton.Text = 'R';
            app.RButton.FontSize = 20;
            app.RButton.Position = [100 22 36 23];

            % Create ChemicalShiftDirFHButtonGroup
            app.ChemicalShiftDirFHButtonGroup = uibuttongroup(app.Panel1);
            app.ChemicalShiftDirFHButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ChemicalShiftDirFHButtonGroupSelectionChanged, true);
            app.ChemicalShiftDirFHButtonGroup.TitlePosition = 'centertop';
            app.ChemicalShiftDirFHButtonGroup.Title = 'Chemical Shift Dir (FH)';
            app.ChemicalShiftDirFHButtonGroup.FontSize = 20;
            app.ChemicalShiftDirFHButtonGroup.Position = [1050 178 251 100];

            % Create HButton
            app.HButton = uiradiobutton(app.ChemicalShiftDirFHButtonGroup);
            app.HButton.Text = 'H';
            app.HButton.FontSize = 20;
            app.HButton.Position = [100 14 65 23];

            % Create FButton
            app.FButton = uiradiobutton(app.ChemicalShiftDirFHButtonGroup);
            app.FButton.Text = 'F';
            app.FButton.FontSize = 20;
            app.FButton.Position = [100 44 58 23];
            app.FButton.Value = true;

            % Create Panel2
            app.Panel2 = uipanel(app.UIFigure);
            app.Panel2.BorderType = 'none';
            app.Panel2.TitlePosition = 'centertop';
            app.Panel2.Title = 'ORYX MRSI';
            app.Panel2.Visible = 'off';
            app.Panel2.SizeChangedFcn = createCallbackFcn(app, @Panel2SizeChanged, true);
            app.Panel2.FontWeight = 'bold';
            app.Panel2.FontSize = 20;
            app.Panel2.Position = [1 1 1373 800];

            % Create oryxlogo
            app.oryxlogo = uiimage(app.Panel2);
            app.oryxlogo.ImageClickedFcn = createCallbackFcn(app, @oryxlogoImageClicked, true);
            app.oryxlogo.Position = [15 622 150 150];
            app.oryxlogo.ImageSource = 'logo.png';

            % Create LoadDataButton
            app.LoadDataButton = uibutton(app.Panel2, 'push');
            app.LoadDataButton.ButtonPushedFcn = createCallbackFcn(app, @LoadDataButtonPushed, true);
            app.LoadDataButton.FontSize = 20;
            app.LoadDataButton.Position = [8 588 165 33];
            app.LoadDataButton.Text = 'Load Data';

            % Create CoregistrationButton
            app.CoregistrationButton = uibutton(app.Panel2, 'push');
            app.CoregistrationButton.ButtonPushedFcn = createCallbackFcn(app, @CoregistrationButtonPushed, true);
            app.CoregistrationButton.FontSize = 20;
            app.CoregistrationButton.Position = [8 533 165 33];
            app.CoregistrationButton.Text = 'Coregistration';

            % Create SegmentationButton
            app.SegmentationButton = uibutton(app.Panel2, 'push');
            app.SegmentationButton.ButtonPushedFcn = createCallbackFcn(app, @SegmentationButtonPushed, true);
            app.SegmentationButton.FontSize = 20;
            app.SegmentationButton.Position = [8 478 165 33];
            app.SegmentationButton.Text = 'Segmentation';

            % Create FWHMSNRButton
            app.FWHMSNRButton = uibutton(app.Panel2, 'push');
            app.FWHMSNRButton.ButtonPushedFcn = createCallbackFcn(app, @FWHMSNRButtonPushed, true);
            app.FWHMSNRButton.FontSize = 20;
            app.FWHMSNRButton.Position = [8 423 165 33];
            app.FWHMSNRButton.Text = 'FWHM & SNR';

            % Create SpectralqualityButton
            app.SpectralqualityButton = uibutton(app.Panel2, 'push');
            app.SpectralqualityButton.ButtonPushedFcn = createCallbackFcn(app, @SpectralqualityButtonPushed, true);
            app.SpectralqualityButton.FontSize = 20;
            app.SpectralqualityButton.Position = [8 369 165 32];
            app.SpectralqualityButton.Text = 'Spectral quality';

            % Create MetabolitemapsButton
            app.MetabolitemapsButton = uibutton(app.Panel2, 'push');
            app.MetabolitemapsButton.ButtonPushedFcn = createCallbackFcn(app, @MetabolitemapsButtonPushed, true);
            app.MetabolitemapsButton.FontSize = 20;
            app.MetabolitemapsButton.Position = [8 313 165 33];
            app.MetabolitemapsButton.Text = 'Metabolite maps';

            % Create RegistrationButton
            app.RegistrationButton = uibutton(app.Panel2, 'push');
            app.RegistrationButton.ButtonPushedFcn = createCallbackFcn(app, @RegistrationButtonPushed, true);
            app.RegistrationButton.FontSize = 20;
            app.RegistrationButton.Position = [8 258 165 33];
            app.RegistrationButton.Text = 'Registration';

            % Create ROIAnalyzeButton
            app.ROIAnalyzeButton = uibutton(app.Panel2, 'push');
            app.ROIAnalyzeButton.ButtonPushedFcn = createCallbackFcn(app, @ROIAnalyzeButtonPushed, true);
            app.ROIAnalyzeButton.FontSize = 20;
            app.ROIAnalyzeButton.Position = [8 203 165 33];
            app.ROIAnalyzeButton.Text = 'ROI Analyze';

            % Create github
            app.github = uiimage(app.Panel2);
            app.github.ImageClickedFcn = createCallbackFcn(app, @githubImageClicked, true);
            app.github.Position = [46 3 87 62];
            app.github.ImageSource = 'GitHub-Mark-64px.png';

            % Create ExitButton
            app.ExitButton = uibutton(app.Panel2, 'push');
            app.ExitButton.ButtonPushedFcn = createCallbackFcn(app, @ExitButtonPushed, true);
            app.ExitButton.FontSize = 20;
            app.ExitButton.Position = [8 148 165 33];
            app.ExitButton.Text = 'Exit';

            % Create VisualizationoptionButtonGroup
            app.VisualizationoptionButtonGroup = uibuttongroup(app.Panel2);
            app.VisualizationoptionButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @VisualizationoptionButtonGroupSelectionChanged, true);
            app.VisualizationoptionButtonGroup.TitlePosition = 'centertop';
            app.VisualizationoptionButtonGroup.Title = 'Visualization option';
            app.VisualizationoptionButtonGroup.Visible = 'off';
            app.VisualizationoptionButtonGroup.HandleVisibility = 'off';
            app.VisualizationoptionButtonGroup.FontSize = 20;
            app.VisualizationoptionButtonGroup.Position = [1105 663 248 99];

            % Create RawdatavisualizationButton
            app.RawdatavisualizationButton = uiradiobutton(app.VisualizationoptionButtonGroup);
            app.RawdatavisualizationButton.Text = 'Raw data visualization';
            app.RawdatavisualizationButton.FontSize = 20;
            app.RawdatavisualizationButton.Position = [11 43 221 23];
            app.RawdatavisualizationButton.Value = true;

            % Create CoordfilevisualizationButton
            app.CoordfilevisualizationButton = uiradiobutton(app.VisualizationoptionButtonGroup);
            app.CoordfilevisualizationButton.Text = 'Coord file visualization';
            app.CoordfilevisualizationButton.FontSize = 20;
            app.CoordfilevisualizationButton.Position = [11 15 225 23];

            % Create Panel
            app.Panel = uipanel(app.Panel2);
            app.Panel.Position = [215 75 1149 562];

            % Create WhichMetaboliteButtonGroup
            app.WhichMetaboliteButtonGroup = uibuttongroup(app.Panel);
            app.WhichMetaboliteButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @WhichMetaboliteButtonGroupSelectionChanged, true);
            app.WhichMetaboliteButtonGroup.TitlePosition = 'centertop';
            app.WhichMetaboliteButtonGroup.Title = 'Which Metabolite?';
            app.WhichMetaboliteButtonGroup.Position = [1 348 118 213];

            % Create CrPCrButton
            app.CrPCrButton = uiradiobutton(app.WhichMetaboliteButtonGroup);
            app.CrPCrButton.Text = 'Cr+PCr';
            app.CrPCrButton.Position = [11 167 62 22];

            % Create GluGlnButton
            app.GluGlnButton = uiradiobutton(app.WhichMetaboliteButtonGroup);
            app.GluGlnButton.Text = 'Glu+Gln';
            app.GluGlnButton.Position = [11 147 66 22];

            % Create GPCPChButton
            app.GPCPChButton = uiradiobutton(app.WhichMetaboliteButtonGroup);
            app.GPCPChButton.Text = 'GPC+PCh';
            app.GPCPChButton.Position = [11 127 78 22];

            % Create InsButton
            app.InsButton = uiradiobutton(app.WhichMetaboliteButtonGroup);
            app.InsButton.Text = 'Ins';
            app.InsButton.Position = [11 107 38 22];

            % Create LacButton
            app.LacButton = uiradiobutton(app.WhichMetaboliteButtonGroup);
            app.LacButton.Text = 'Lac';
            app.LacButton.Position = [11 87 42 22];

            % Create Lip13aButton
            app.Lip13aButton = uiradiobutton(app.WhichMetaboliteButtonGroup);
            app.Lip13aButton.Text = 'Lip13a';
            app.Lip13aButton.Position = [11 67 58 22];

            % Create Lip13bButton
            app.Lip13bButton = uiradiobutton(app.WhichMetaboliteButtonGroup);
            app.Lip13bButton.Text = 'Lip13b';
            app.Lip13bButton.Position = [11 47 59 22];

            % Create Lip13aLip13bButton
            app.Lip13aLip13bButton = uiradiobutton(app.WhichMetaboliteButtonGroup);
            app.Lip13aLip13bButton.Text = 'Lip13a+Lip13b';
            app.Lip13aLip13bButton.Position = [11 27 102 22];

            % Create NAANAAGButton
            app.NAANAAGButton = uiradiobutton(app.WhichMetaboliteButtonGroup);
            app.NAANAAGButton.Text = 'NAA+NAAG';
            app.NAANAAGButton.Position = [11 7 87 22];
            app.NAANAAGButton.Value = true;

            % Create TabGroup
            app.TabGroup = uitabgroup(app.Panel);
            app.TabGroup.Visible = 'off';
            app.TabGroup.Position = [0 -12 1148 542];

            % Create MeanTab
            app.MeanTab = uitab(app.TabGroup);
            app.MeanTab.Title = 'Mean';

            % Create meantable
            app.meantable = uitable(app.MeanTab);
            app.meantable.ColumnName = {''};
            app.meantable.RowName = {};
            app.meantable.Position = [1 12 1146 508];

            % Create MedianTab
            app.MedianTab = uitab(app.TabGroup);
            app.MedianTab.Title = 'Median';

            % Create mediantable
            app.mediantable = uitable(app.MedianTab);
            app.mediantable.ColumnName = {''};
            app.mediantable.RowName = {};
            app.mediantable.Position = [1 12 1136 499];

            % Create STDTab
            app.STDTab = uitab(app.TabGroup);
            app.STDTab.Title = 'STD';

            % Create stdtable
            app.stdtable = uitable(app.STDTab);
            app.stdtable.ColumnName = {''};
            app.stdtable.RowName = {};
            app.stdtable.Position = [1 11 1136 491];

            % Create which_map
            app.which_map = uibuttongroup(app.Panel);
            app.which_map.SelectionChangedFcn = createCallbackFcn(app, @which_mapSelectionChanged, true);
            app.which_map.TitlePosition = 'centertop';
            app.which_map.Title = 'Which Map Visualization?';
            app.which_map.Visible = 'off';
            app.which_map.Position = [8 7 315 167];

            % Create concentrationmap
            app.concentrationmap = uiradiobutton(app.which_map);
            app.concentrationmap.Text = 'concentration map';
            app.concentrationmap.Position = [11 120 130 22];
            app.concentrationmap.Value = true;

            % Create concentrationmaptoInsRatio
            app.concentrationmaptoInsRatio = uiradiobutton(app.which_map);
            app.concentrationmaptoInsRatio.Text = 'concentration map to Ins ratio';
            app.concentrationmaptoInsRatio.Position = [11 99 198 22];

            % Create concentrationmaptoCrPCrratio
            app.concentrationmaptoCrPCrratio = uiradiobutton(app.which_map);
            app.concentrationmaptoCrPCrratio.Text = 'concentration map to tCr ratio';
            app.concentrationmaptoCrPCrratio.Position = [11 77 225 22];

            % Create CSFcorrectedconcentrationmap
            app.CSFcorrectedconcentrationmap = uiradiobutton(app.which_map);
            app.CSFcorrectedconcentrationmap.Text = 'CSF corrected concentration map';
            app.CSFcorrectedconcentrationmap.Position = [11 56 219 22];

            % Create CSFcorrectedconcentrationmaptoInsratio
            app.CSFcorrectedconcentrationmaptoInsratio = uiradiobutton(app.which_map);
            app.CSFcorrectedconcentrationmaptoInsratio.Text = 'CSF corrected concentration map to Ins ratio';
            app.CSFcorrectedconcentrationmaptoInsratio.Position = [11 34 287 22];

            % Create CSFcorrectedconcetrationmaptoCrPCrratio
            app.CSFcorrectedconcetrationmaptoCrPCrratio = uiradiobutton(app.which_map);
            app.CSFcorrectedconcetrationmaptoCrPCrratio.Text = 'CSF corrected concetration map to tCr ratio';
            app.CSFcorrectedconcetrationmaptoCrPCrratio.Position = [11 12 280 22];

            % Create Slider
            app.Slider = uislider(app.Panel2);
            app.Slider.Limits = [1 3];
            app.Slider.MajorTicks = [1 2 3];
            app.Slider.MajorTickLabels = {'1', '2', '3'};
            app.Slider.ValueChangedFcn = createCallbackFcn(app, @SliderValueChanged, true);
            app.Slider.MinorTicks = [1 2 3];
            app.Slider.Visible = 'off';
            app.Slider.FontSize = 14;
            app.Slider.Position = [683 36 199 3];
            app.Slider.Value = 1;

            % Create SliceNumberLabel
            app.SliceNumberLabel = uilabel(app.Panel2);
            app.SliceNumberLabel.FontSize = 14;
            app.SliceNumberLabel.Visible = 'off';
            app.SliceNumberLabel.Position = [730 50 127 26];
            app.SliceNumberLabel.Text = 'Slice Number';

            % Create pubmed
            app.pubmed = uiimage(app.Panel2);
            app.pubmed.Position = [47 76 87 62];
            app.pubmed.ImageSource = 'PubMed.png';

            % Create Panel_2
            app.Panel_2 = uipanel(app.Panel2);
            app.Panel_2.BorderType = 'none';
            app.Panel_2.Position = [211 666 557 86];

            % Create XminEditFieldLabel
            app.XminEditFieldLabel = uilabel(app.Panel_2);
            app.XminEditFieldLabel.HorizontalAlignment = 'right';
            app.XminEditFieldLabel.Position = [33 47 35 22];
            app.XminEditFieldLabel.Text = 'Xmin';

            % Create XminEditField
            app.XminEditField = uieditfield(app.Panel_2, 'numeric');
            app.XminEditField.Limits = [1 1024];
            app.XminEditField.Position = [83 47 100 22];
            app.XminEditField.Value = 532;

            % Create XmaxEditFieldLabel
            app.XmaxEditFieldLabel = uilabel(app.Panel_2);
            app.XmaxEditFieldLabel.HorizontalAlignment = 'right';
            app.XmaxEditFieldLabel.Position = [2 8 68 22];
            app.XmaxEditFieldLabel.Text = 'Xmax';

            % Create XmaxEditField
            app.XmaxEditField = uieditfield(app.Panel_2, 'numeric');
            app.XmaxEditField.Limits = [1 1024];
            app.XmaxEditField.Position = [85 8 100 22];
            app.XmaxEditField.Value = 800;

            % Create YminEditFieldLabel
            app.YminEditFieldLabel = uilabel(app.Panel_2);
            app.YminEditFieldLabel.HorizontalAlignment = 'right';
            app.YminEditFieldLabel.Position = [196 45 68 22];
            app.YminEditFieldLabel.Text = 'Ymin';

            % Create YminEditField
            app.YminEditField = uieditfield(app.Panel_2, 'numeric');
            app.YminEditField.Position = [279 45 100 22];
            app.YminEditField.Value = -5000;

            % Create YmaxEditFieldLabel
            app.YmaxEditFieldLabel = uilabel(app.Panel_2);
            app.YmaxEditFieldLabel.HorizontalAlignment = 'right';
            app.YmaxEditFieldLabel.Position = [195 8 68 22];
            app.YmaxEditFieldLabel.Text = 'Ymax';

            % Create YmaxEditField
            app.YmaxEditField = uieditfield(app.Panel_2, 'numeric');
            app.YmaxEditField.Position = [278 8 100 22];
            app.YmaxEditField.Value = 10000;

            % Create AdjustPlotButton
            app.AdjustPlotButton = uibutton(app.Panel_2, 'push');
            app.AdjustPlotButton.ButtonPushedFcn = createCallbackFcn(app, @AdjustPlotButtonPushed, true);
            app.AdjustPlotButton.Position = [440 24 98 24];
            app.AdjustPlotButton.Text = 'Adjust Plot';

            % Create ROIatlasDropDown
            app.ROIatlasDropDown = uidropdown(app.Panel2);
            app.ROIatlasDropDown.Items = {'Schaefer2018_100Parcels_7Networks_2mm', 'Schaefer2018_400Parcels_7Networks_2mm', 'MNI_thr0_2mm', 'MNI_thr25_2mm', 'MNI_thr50_2mm'};
            app.ROIatlasDropDown.ValueChangedFcn = createCallbackFcn(app, @ROIatlasDropDownValueChanged, true);
            app.ROIatlasDropDown.Position = [900 726 405 22];
            app.ROIatlasDropDown.Value = 'Schaefer2018_100Parcels_7Networks_2mm';

            % Create RegionNetworkExclusionEditFieldLabel
            app.RegionNetworkExclusionEditFieldLabel = uilabel(app.Panel2);
            app.RegionNetworkExclusionEditFieldLabel.HorizontalAlignment = 'right';
            app.RegionNetworkExclusionEditFieldLabel.Visible = 'off';
            app.RegionNetworkExclusionEditFieldLabel.Position = [835 686 169 22];
            app.RegionNetworkExclusionEditFieldLabel.Text = 'Region/Network Exclusion (%)';

            % Create RegionNetworkExclusionEditField
            app.RegionNetworkExclusionEditField = uieditfield(app.Panel2, 'numeric');
            app.RegionNetworkExclusionEditField.Limits = [0 100];
            app.RegionNetworkExclusionEditField.ValueChangedFcn = createCallbackFcn(app, @RegionNetworkExclusionEditFieldValueChanged, true);
            app.RegionNetworkExclusionEditField.Visible = 'off';
            app.RegionNetworkExclusionEditField.Position = [1021 686 188 22];
            app.RegionNetworkExclusionEditField.Value = 30;

            % Create ROIAtlasLabel
            app.ROIAtlasLabel = uilabel(app.Panel2);
            app.ROIAtlasLabel.Position = [835 726 56 22];
            app.ROIAtlasLabel.Text = 'ROI Atlas';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Oryx

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end