classdef Oryx < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        Panel1                          matlab.ui.container.Panel
        ChoTextArea                     matlab.ui.control.TextArea
        ChoTextAreaLabel                matlab.ui.control.Label
        NotesTextArea                   matlab.ui.control.TextArea
        NAATextArea                     matlab.ui.control.TextArea
        NAATextAreaLabel                matlab.ui.control.Label
        LipTextArea                     matlab.ui.control.TextArea
        LipTextAreaLabel                matlab.ui.control.Label
        LacTextArea                     matlab.ui.control.TextArea
        LacTextAreaLabel                matlab.ui.control.Label
        InsTextArea                     matlab.ui.control.TextArea
        InsTextAreaLabel                matlab.ui.control.Label
        GluGlnTextArea                  matlab.ui.control.TextArea
        GluGlnTextAreaLabel             matlab.ui.control.Label
        CrTextArea                      matlab.ui.control.TextArea
        CrTextAreaLabel                 matlab.ui.control.Label
        ChemicalShiftDirFHButtonGroup   matlab.ui.container.ButtonGroup
        FButton                         matlab.ui.control.RadioButton
        HButton                         matlab.ui.control.RadioButton
        ChemicalShiftDirLRButtonGroup   matlab.ui.container.ButtonGroup
        RButton                         matlab.ui.control.RadioButton
        LButton                         matlab.ui.control.RadioButton
        RFOVDirButtonGroup              matlab.ui.container.ButtonGroup
        APButton                        matlab.ui.control.RadioButton
        RLButton                        matlab.ui.control.RadioButton
        ReferenceMetabolite             matlab.ui.container.ButtonGroup
        refmetppm                       matlab.ui.control.NumericEditField
        ppmEditFieldLabel               matlab.ui.control.Label
        refmetname                      matlab.ui.control.EditField
        NameEditField_2Label            matlab.ui.control.Label
        Userdefrefmet                   matlab.ui.control.RadioButton
        LacLipButton                    matlab.ui.control.RadioButton
        ChoButton                       matlab.ui.control.RadioButton
        CrButton                        matlab.ui.control.RadioButton
        NAAButton                       matlab.ui.control.RadioButton
        H2OButton                       matlab.ui.control.RadioButton
        ChemicalShiftDirAPButtonGroup   matlab.ui.container.ButtonGroup
        PButton                         matlab.ui.control.RadioButton
        AButton                         matlab.ui.control.RadioButton
        TextArea_3                      matlab.ui.control.TextArea
        Label                           matlab.ui.control.Label
        SelectaSPARfileButton           matlab.ui.control.Button
        Oryxlogo                        matlab.ui.control.Image
        TextArea_2                      matlab.ui.control.TextArea
        ChemicalshiftcorrectionButtonGroup  matlab.ui.container.ButtonGroup
        OffButton                       matlab.ui.control.RadioButton
        OnButton                        matlab.ui.control.RadioButton
        DoneButton                      matlab.ui.control.Button
        FWHMEditField                   matlab.ui.control.NumericEditField
        SNREditField                    matlab.ui.control.NumericEditField
        CRLBEditField                   matlab.ui.control.NumericEditField
        fcsfEditField                   matlab.ui.control.NumericEditField
        RFecho2BWEditField              matlab.ui.control.NumericEditField
        RFechoBWEditField               matlab.ui.control.NumericEditField
        RFexBWEditField                 matlab.ui.control.NumericEditField
        Range01EditField                matlab.ui.control.NumericEditField
        FWHMLabel                       matlab.ui.control.Label
        SNRLabel                        matlab.ui.control.Label
        CRLBLabel                       matlab.ui.control.Label
        CutoffvaluesforexclusioncriteriaLabel  matlab.ui.control.Label
        fCSFLabel                       matlab.ui.control.Label
        RFBandwidthofthesystemLabel     matlab.ui.control.Label
        RFecho2BWEditFieldLabel         matlab.ui.control.Label
        RFechoBWEditFieldLabel          matlab.ui.control.Label
        RFexBWEditFieldLabel            matlab.ui.control.Label
        MRSIacquiredafterButtonGroup    matlab.ui.container.ButtonGroup
        T2wMRIButton                    matlab.ui.control.RadioButton
        T1wMRIButton                    matlab.ui.control.RadioButton
        MetaboliteMapListppmButtonGroup  matlab.ui.container.ButtonGroup
        PredefinedmapsAboveButton       matlab.ui.control.RadioButton
        choppm                          matlab.ui.control.NumericEditField
        naappm                          matlab.ui.control.NumericEditField
        lipppm                          matlab.ui.control.NumericEditField
        lacppm                          matlab.ui.control.NumericEditField
        insppm                          matlab.ui.control.NumericEditField
        gluglnppm                       matlab.ui.control.NumericEditField
        crppm                           matlab.ui.control.NumericEditField
        userdefmapppm                   matlab.ui.control.NumericEditField
        userdefmapname                  matlab.ui.control.EditField
        NameEditFieldLabel              matlab.ui.control.Label
        UserdefinedmapButton            matlab.ui.control.RadioButton
        Panel2                          matlab.ui.container.Panel
        Panel                           matlab.ui.container.Panel
        axialap                         matlab.ui.control.Slider
        ILabel                          matlab.ui.control.Label
        coronalsi                       matlab.ui.control.Slider
        SLabel                          matlab.ui.control.Label
        LLabel                          matlab.ui.control.Label
        axialrl                         matlab.ui.control.Slider
        RLabel                          matlab.ui.control.Label
        PLabel                          matlab.ui.control.Label
        ALabel                          matlab.ui.control.Label
        AdjustrangeButton_3             matlab.ui.control.Button
        MaxEditField_3                  matlab.ui.control.NumericEditField
        MaxEditField_3Label             matlab.ui.control.Label
        MinEditField_3                  matlab.ui.control.NumericEditField
        MinEditField_3Label             matlab.ui.control.Label
        AdjustrangeButton_2             matlab.ui.control.Button
        MaxEditField_2                  matlab.ui.control.NumericEditField
        MaxEditField_2Label             matlab.ui.control.Label
        MinEditField_2                  matlab.ui.control.NumericEditField
        MinEditField_2Label             matlab.ui.control.Label
        MaxEditField                    matlab.ui.control.NumericEditField
        MaxEditFieldLabel               matlab.ui.control.Label
        MinEditField                    matlab.ui.control.NumericEditField
        MinEditFieldLabel               matlab.ui.control.Label
        AdjustrangeButton               matlab.ui.control.Button
        RegionNameDropDown              matlab.ui.control.DropDown
        RegionNameDropDownLabel         matlab.ui.control.Label
        EditSpectralquality             matlab.ui.control.Button
        which_map                       matlab.ui.container.ButtonGroup
        CSFcorrectedconcetrationmaptoCrPCrratio  matlab.ui.control.RadioButton
        CSFcorrectedconcentrationmaptoInsratio  matlab.ui.control.RadioButton
        CSFcorrectedconcentrationmap    matlab.ui.control.RadioButton
        concentrationmaptoCrPCrratio    matlab.ui.control.RadioButton
        concentrationmaptoInsRatio      matlab.ui.control.RadioButton
        concentrationmap                matlab.ui.control.RadioButton
        WhichMetaboliteButtonGroup      matlab.ui.container.ButtonGroup
        UserdefinedmetaboliteButton     matlab.ui.control.RadioButton
        NAANAAGButton                   matlab.ui.control.RadioButton
        Lip13aLip13bButton              matlab.ui.control.RadioButton
        Lip13bButton                    matlab.ui.control.RadioButton
        Lip13aButton                    matlab.ui.control.RadioButton
        LacButton                       matlab.ui.control.RadioButton
        InsButton                       matlab.ui.control.RadioButton
        GPCPChButton                    matlab.ui.control.RadioButton
        GluGlnButton                    matlab.ui.control.RadioButton
        CrPCrButton                     matlab.ui.control.RadioButton
        TabGroup                        matlab.ui.container.TabGroup
        MeanTab                         matlab.ui.container.Tab
        meantable                       matlab.ui.control.Table
        MedianTab                       matlab.ui.container.Tab
        mediantable                     matlab.ui.control.Table
        STDTab                          matlab.ui.container.Tab
        stdtable                        matlab.ui.control.Table
        DistributionsButton             matlab.ui.control.Button
        BackButton                      matlab.ui.control.Button
        Image                           matlab.ui.control.Image
        DataButtonGroup                 matlab.ui.container.ButtonGroup
        AbsButton                       matlab.ui.control.RadioButton
        ImagButton                      matlab.ui.control.RadioButton
        RealButton                      matlab.ui.control.RadioButton
        ROIAtlasLabel                   matlab.ui.control.Label
        RegionNetworkExclusionEditField  matlab.ui.control.NumericEditField
        RegionNetworkExclusionEditFieldLabel  matlab.ui.control.Label
        ROIatlasDropDown                matlab.ui.control.DropDown
        Panel_2                         matlab.ui.container.Panel
        AdjustPlotButton                matlab.ui.control.Button
        YmaxEditField                   matlab.ui.control.NumericEditField
        YmaxEditFieldLabel              matlab.ui.control.Label
        YminEditField                   matlab.ui.control.NumericEditField
        YminEditFieldLabel              matlab.ui.control.Label
        XmaxEditField                   matlab.ui.control.NumericEditField
        XmaxEditFieldLabel              matlab.ui.control.Label
        XminEditField                   matlab.ui.control.NumericEditField
        XminEditFieldLabel              matlab.ui.control.Label
        pubmed                          matlab.ui.control.Image
        SliceNumberLabel                matlab.ui.control.Label
        Slider                          matlab.ui.control.Slider
        VisualizationoptionButtonGroup  matlab.ui.container.ButtonGroup
        CoordfilevisualizationButton    matlab.ui.control.RadioButton
        RawdatavisualizationButton      matlab.ui.control.RadioButton
        ExitButton                      matlab.ui.control.Button
        github                          matlab.ui.control.Image
        ROIAnalyzeButton                matlab.ui.control.Button
        RegistrationButton              matlab.ui.control.Button
        MetabolitemapsButton            matlab.ui.control.Button
        SpectralqualityButton           matlab.ui.control.Button
        CRLBFWHMSNRButton               matlab.ui.control.Button
        SegmentationButton              matlab.ui.control.Button
        CoregistrationButton            matlab.ui.control.Button
        LoadDataButton                  matlab.ui.control.Button
        oryxlogo                        matlab.ui.control.Image
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
        mcrlb='';
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
        RFOV_dir='RL'; %Jan 19, 2024
        chem_shift_dir_AP='A'; %Jan 19, 2024
        chem_shift_dir_LR='L'; %Jan 19, 2024
        chem_shift_dir_FH='F'; %Jan 19, 2024
        refppm='';
        backtrig='0';
        ext='';
        userrefmetppm='1';
        edit='0';
        rowno='0';
        colno='0';
        WhichMetabNoD='';
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
            set(app.refmetppm,'Enable','off');
            set(app.refmetname,'Enable','off');
            set(app.userdefmapname,'Enable','off');
            set(app.userdefmapppm,'Enable','off');
            app.MinEditField.Visible='off';
            app.MaxEditField.Visible='off';
            app.AdjustrangeButton.Visible='off';
            app.AdjustrangeButton_2.Visible='off';
            app.AdjustrangeButton_3.Visible='off';
            app.MinEditFieldLabel.Visible='off';
            app.MaxEditFieldLabel.Visible='off';
            app.axialrl.Visible='off';
            app.axialap.Visible='off';
            app.coronalsi.Visible='off';
            app.ILabel.Visible='off';
            app.SLabel.Visible='off';
            app.ALabel.Visible='off';
            app.PLabel.Visible='off';
            app.RLabel.Visible='off';
            app.LLabel.Visible='off';
            app.EditSpectralquality.Visible='off';
            app.RegionNameDropDown.Visible='off';
            app.RegionNameDropDownLabel.Visible='off';
            app.MinEditField_2.Visible='off';
            app.MaxEditField_2.Visible='off';
            %  app.MinEditFieldLabel_2.Visible='off';
            %            app.MaxEditFieldLabel_2.Visible='off';
            %   app.MinEditField_3.Visible='off';
            %    app.MaxEditField_3.Visible='off';
            % app.MinEditFieldLabel_3.Visible='off';
            %app.MaxEditFieldLabel_3.Visible='off';
            %  app.AdjustrangeButton_2.Visible='off';
            % app.AdjustrangeButton3.Visible='off';

        end

        % Size changed function: Panel1
        function Panel1SizeChanged(app, event)
            position = app.Panel1.Position;
        end

        % Button pushed function: SelectaSPARfileButton
        function SelectaSPARfileButtonPushed(app, event)
            [app.SFile,app.SPath]=uigetfile({'*.SPAR;*.spar;*.nii;*.nii.gz';'*.*'},'Select an SPAR / a NIfTI-MRS file');figure(app.UIFigure);
            if app.SFile~=0
                app.spardone=1;
                set(app.DoneButton,'Enable','on');
            end
        end

        % Button pushed function: DoneButton
        function DoneButtonPushed(app, event)
            if app.spardone=='0'

                selection = uiconfirm(app.UIFigure,'Select an Spar / a NIfTI-MRS file','Confirm Close','Options',{'Ok'},...
                    'Icon','warning');
                return
            end
            app.Panel2.Visible = 'on';
            app.EditSpectralquality.Visible='off';
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
            set(app.CRLBFWHMSNRButton,'Enable','off');
            set(app.SpectralqualityButton,'Enable','off');
            set(app.MetabolitemapsButton,'Enable','off');
            set(app.RegistrationButton,'Enable','off');
            set(app.ROIAnalyzeButton,'Enable','off');
            set(app.DistributionsButton,'Enable','off');
            app.userrefmetppm=app.refmetppm.Value;
            app.RegionNameDropDown.Visible='off';
            app.RegionNameDropDownLabel.Visible='off';
            app.MinEditField_2.Visible='off';
            app.MaxEditField_2.Visible='off';
            app.MinEditField_2Label.Visible='off';
            app.MaxEditField_2Label.Visible='off';
            app.MinEditField_3.Visible='off';
            app.MaxEditField_3.Visible='off';
            app.MinEditField_3Label.Visible='off';
            app.MaxEditField_3Label.Visible='off';
            app.AdjustrangeButton_2.Visible='off';
            app.AdjustrangeButton_3.Visible='off';
            app_Path=app.SPath;
            app_File=app.SFile;
            app.DataButtonGroup.Visible='off';
            if app.backtrig == '0'

                if app.spardone==1
                    [fpath,fname,ext] = fileparts([app.SPath,app.SFile]);

                    if strcmp(ext,'.nii')
                        app.Pinfo.ext='0';
                    else
                        app.Pinfo.ext='1';
                        [app.Pinfo]= loadfile(app_File,app_Path);
                    end
                    %[app.Pinfo]= loadfile(app_File,app_Path);
                end
            else
                answer = questdlg('Would you like to change the setted parameters?', ...
                    ' ', ...
                    'No','Yes','Yes');
                % Handle response
                switch answer
                    case 'No'
                        % disp([answer 'The analysis will continue'])
                        app.LoadDataButtonPushed(app);

                    case 'Yes'
                        % disp([answer 'The parameters are setted up and the previous files will delete!'])
                        app.LoadDataButtonPushed(app);
                end

                %Give an allert and delete the previous outputs
                if app.spardone==1

                    [fpath,fname,ext] = fileparts([app.SPath,app.SFile]);
                    if strcmp(ext,'.nii')

                        app.Pinfo.ext='0';
                    else
                        [app.Pinfo]= loadfile(app_File,app_Path);
                        app.Pinfo.ext='1';

                    end
                end
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

        % Selection changed function: ChemicalshiftcorrectionButtonGroup
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
            app.EditSpectralquality.Visible='off';
            app.ILabel.Visible='off';
            app.SLabel.Visible='off';
            app.ALabel.Visible='off';
            app.PLabel.Visible='off';
            app.RLabel.Visible='off';
            app.LLabel.Visible='off';
            app.axialrl.Visible='off';
            app.axialap.Visible='off';
            app.coronalsi.Visible='off';
            app.Panel_2.Visible='off';

            app.TabGroup.Visible='off';
            app.which_map.Visible='off';
            app.ROIatlasDropDown.Visible='off';
            app.ROIAtlasLabel.Visible='off';
            app.RegionNetworkExclusionEditField.Visible='off';
            app.RegionNetworkExclusionEditFieldLabel.Visible='off';
            app.VisualizationoptionButtonGroup.Visible='on';
            app.WhichMetaboliteButtonGroup.Visible='off';
            app.DataButtonGroup.Visible='off';
            app.axialap.Visible='off';
            app.axialrl.Visible='off';
            app.coronalsi.Visible='off';
            app.RegionNameDropDown.Visible='off';
            app.RegionNameDropDownLabel.Visible='off';

            obj=findobj(app.Panel,'type','Axes');
            delete(obj);
            wait=uiprogressdlg(app.UIFigure,'Message','Plotting.. Please wait','Title','Plotting');
            selectedButton = app.VisualizationoptionButtonGroup.SelectedObject;
            obj=findobj(app.Panel,'type','Axes');
            delete(obj);
            varext=app.Pinfo.ext;
            if  varext=='0' %% Nifti Plot
                switch selectedButton.Text %% selected file is a nifti
                    case  'Raw data visualization'
                        app.DataButtonGroup.Visible='on';
                        app.Panel.AutoResizeChildren='off';
                        app.Panel_2.Visible='on';
                        app.Slider.Visible='off';
                        app.SliceNumberLabel.Visible='off';
                        obj=findobj(app.Panel,'type','Axes'); %panel clear
                        delete(obj); %panel clear
                        nifti_file = [app.SPath,app.SFile];
                        nii = nii_tool('load', nifti_file);
                        size(nii.img)
                        if ans(1,1)>1 % multivoxel nifti image
                            fid = squeeze(nii.img);
                            sw = 1/nii.hdr.pixdim(5);
                            % Decode the JSON header extension string
                            header_extension = jsondecode(nii.ext.edata_decoded);
                            % Extract F0 and number of samples
                            f0 = header_extension.SpectrometerFrequency;
                            npts = nii.hdr.dim(5);
                            % Create frequency axis
                            f = [(-sw/2)+(sw/(2*npts)):sw/(npts):(sw/2)-(sw/(2*npts))];
                            % Convert to ppm
                            ppm = -f/f0;
                            ppm = ppm + 4.68;
                            wait.Value=0.2;
                            nrow=nii.hdr.dim(1,2);
                            ncol=nii.hdr.dim(1,3);
                            npoints=nii.hdr.dim(1,5); %

                            n=1;
                            pos=get(app.Panel,'Position');
                            xinc=1/nrow ;
                            yinc=1/ncol;
                            for k=1:nrow
                                ystart=(k-1)*yinc;
                                for j=1:ncol
                                    xstart=(j-1)*xinc;
                                    ax= subplot('Position',[-5 -5 0 0],'Parent',app.Panel);
                                    switch app.DataButtonGroup.SelectedObject.Text
                                        case  'Real'
                                            spec = fftshift(fft(squeeze(fid(k,j,:))));
                                            dataplot=real(spec);%squeeze(real(flip(raw_data(app.Slider.Value,k,j,:))));
                                            plot(ax,dataplot);
                                            xlim(ax,[532 800]);
                                            ymin=min(real(spec));%min(min(min(min(real((raw_data(:,:,:,532:800)))))));
                                            ymax=max(real(spec));%max(max(max(max(real((raw_data(:,:,:,532:800)))))));
                                            % ylim(ax,[ymin ymax]);
                                        case 'Imag'
                                            spec = fftshift(fft(squeeze(fid(k,j,:))));
                                            dataplot=imag(spec);
                                            plot(ax,dataplot);
                                            xlim(ax,[532 800]);
                                            ymin=min(imag(spec));%min(min(min(min(imag((raw_data(:,:,:,532:800)))))));
                                            ymax=max(imag(spec));%max(max(max(max(imag((raw_data(:,:,:,532:800)))))));
                                            % ylim(ax,[ymin ymax]);

                                        otherwise
                                            spec = fftshift(fft(squeeze(fid(k,j,:))));
                                            Bsqrt=sqrt(((real(spec)).^2)+((imag(spec)).^2));
                                            absdata=(Bsqrt);
                                            dataplot=absdata;
                                            %squeeze(real(flip(raw_data(app.Slider.Value,k,j,:))));
                                            plot(ax,dataplot);
                                            xlim(ax,[532 800]);
                                            ymin=min(real(spec));%min(min(min(min(real((raw_data(:,:,:,532:800)))))));
                                            ymax=max(real(spec));%max(max(max(max(real((raw_data(:,:,:,532:800)))))));
                                            % ylim(ax,[ymin ymax]);
                                    end
                                    xticks(ax,[ ]);
                                    yticks(ax,[ ]);
                                    set(ax,'Position',[xstart,1-yinc-ystart,xinc*0.95,yinc*0.7]);
                                    n=n+1;
                                    wait.Value=0.9*(n/(ncol*nrow));
                                end
                            end
                            app.Slider.Visible='off';
                            app.SliceNumberLabel.Visible='off';
                            obj=findobj(app.Panel,'Type','Axes');
                            set(obj,'ButtonDownFcn',@axck);

                        else % the data is single voxel nifti
                            app.SliceNumberLabel.Visible='off';
                            app.Slider.Visible='off';

                            fid = squeeze(nii.img);
                            sw = 1/nii.hdr.pixdim(5)
                            % Decode the JSON header extension string
                            header_extension = jsondecode(nii.ext.edata_decoded)

                            % Extract F0 and number of samples
                            f0 = header_extension.SpectrometerFrequency;
                            npts = nii.hdr.dim(5);

                            % Create frequency axis
                            f = [(-sw/2)+(sw/(2*npts)):sw/(npts):(sw/2)-(sw/(2*npts))];
                            % Convert to ppm
                            ppm = -f/f0;
                            ppm = ppm + 4.68;
                            n=1;
                            pos=get(app.Panel,'Position');
                            xinc=1/1;
                            yinc=1/1;

                            ystart=(1-1)*yinc;

                            xstart=(1-1)*xinc;
                            ax= subplot('Position',[-5 -5 0 0],'Parent',app.Panel);
                            switch app.DataButtonGroup.SelectedObject.Text
                                case  'Real'
                                    spec = fftshift(fft(squeeze(fid(:,1))));
                                    dataplot=real(spec);
                                    plot(ax,dataplot);
                                    xlim(ax,[1  length(fid)]);
                                    ymin=min(real(spec));
                                    ymax=max(real(spec));
                                   % set(gca, 'xdir', 'reverse', 'xlim', [0 5]);
                                  %  xlabel('Chemical shift (ppm)');

                                case 'Imag'
                                    spec = fftshift(fft(squeeze(fid(:,1))));
                                    dataplot=imag(spec);
                                    plot(ax,dataplot);
                                    xlim(ax,[1 length(fid)]);
                                    ymin=min(imag(spec));
                                    ymax=max(imag(spec));

                                otherwise
                                    spec = fftshift(fft(squeeze(fid(:,1))));
                                    Bsqrt=sqrt(((real(spec)).^2)+((imag(spec)).^2));
                                    absdata=(Bsqrt);
                                    dataplot=absdata;
                                    plot(ax,dataplot);
                                    xlim(ax,[1 4097]);
                                    ymin=min(real(spec));
                                    ymax=max(real(spec));
                            end
                            xticks(ax,[ ]);
                            yticks(ax,[ ]);
                            set(ax,'Position',[xstart,1-yinc-ystart,xinc*0.95,yinc*0.7]);
                            n=n+1;
                            wait.Value=0.9;
                        end
                    otherwise
                        f = msgbox('There is no coord/table files of the Nifti');
                        selectedButton = 'Coord file visualization';
                        %  app.LoadDataButtonPushed(app);
                end

            else %% the selected file is an spar file
                switch selectedButton.Text %% selected file is an spar file
                    case  'Raw data visualization'
                        app.SliceNumberLabel.Visible='on';
                        app.Slider.Visible='on';
                        app.DataButtonGroup.Visible='on';
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
                                switch app.DataButtonGroup.SelectedObject.Text

                                    case  'Real'

                                        dataplot=squeeze(real(flip(raw_data(app.Slider.Value,k,j,:))));
                                        plot(ax,dataplot);
                                        xlim(ax,[532 800]);
                                        ymin=min(min(min(min(real((raw_data(:,:,:,532:800)))))));
                                        ymax=max(max(max(max(real((raw_data(:,:,:,532:800)))))));
                                        ylim(ax,[ymin ymax]);
                                    case 'Imag'

                                        dataplot=squeeze(imag(flip(raw_data(app.Slider.Value,k,j,:))));
                                        plot(ax,dataplot);
                                        xlim(ax,[532 800]);
                                        ymin=min(min(min(min(imag((raw_data(:,:,:,532:800)))))));
                                        ymax=max(max(max(max(imag((raw_data(:,:,:,532:800)))))));
                                        ylim(ax,[ymin ymax]);

                                    otherwise % Abs

                                        rval=squeeze(real(flip(raw_data(app.Slider.Value,k,j,:))));
                                        ival=squeeze(imag(flip(raw_data(app.Slider.Value,k,j,:))));
                                        Bsqrt=sqrt((rval.^2)+(ival.^2));
                                        absdata=(Bsqrt);
                                        dataplot=absdata;
                                        plot(ax,dataplot);
                                        xlim(ax,[532 800]);
                                        ymin=min(min(min(min(imag((raw_data(:,:,:,532:800)))))));
                                        ymax=max(max(max(max(imag((raw_data(:,:,:,532:800)))))));
                                        ylim(ax,[ymin ymax]);
                                end
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
                        app.SliceNumberLabel.Visible='on';
                        app.Slider.Visible='on';
                        app.DataButtonGroup.Visible='off';
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
                                plot(ax,app.allvoxels(app.Slider.Value,k,j).spectra);
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

                end %% spar file
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

            app.MinEditField.Visible='off';
            app.MinEditFieldLabel.Visible='off';
            app.MaxEditField.Visible='off';
            app.MaxEditFieldLabel.Visible='off';
            app.AdjustrangeButton.Visible='off';
            app.AdjustrangeButton_2.Visible='off';
            app.AdjustrangeButton_3.Visible='off';
            app.MinEditField_2.Visible='off';
            app.MaxEditField_2.Visible='off';
            app.MinEditField_2Label.Visible='off';
            app.MaxEditField_2Label.Visible='off';
            app.MinEditField_3.Visible='off';
            app.MaxEditField_3.Visible='off';
            app.MinEditField_3Label.Visible='off';
            app.MaxEditField_3Label.Visible='off';


            app.currentmodule=1;
            app.mloaddata=1;
            if app.mloaddata>0

                set(app.CoregistrationButton,'Enable','on');

            end

            %app.SliceNumberLabel.Visible='on';
            % app.Slider.Visible='on';
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
                    app.DataButtonGroup.Visible='on';

                otherwise
                    app.DataButtonGroup.Visible='off';
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
            app.EditSpectralquality.Visible='off';
            app.ILabel.Visible='off';
            app.SLabel.Visible='off';
            app.ALabel.Visible='off';
            app.PLabel.Visible='off';
            app.RLabel.Visible='off';
            app.LLabel.Visible='off';
            app.axialrl.Visible='off';
            app.axialap.Visible='off';
            app.coronalsi.Visible='off';
            app.MinEditField.Visible='off';
            app.MinEditFieldLabel.Visible='off';
            app.MaxEditField.Visible='off';
            app.MaxEditFieldLabel.Visible='off';
            app.AdjustrangeButton.Visible='off';
            app.AdjustrangeButton_2.Visible='off';
            app.AdjustrangeButton_3.Visible='off';
            app.MinEditField_2.Visible='off';
            app.MaxEditField_2.Visible='off';
            app.MinEditField_2Label.Visible='off';
            app.MaxEditField_2Label.Visible='off';
            app.MinEditField_3.Visible='off';
            app.MaxEditField_3.Visible='off';
            app.MinEditField_3Label.Visible='off';
            app.MaxEditField_3Label.Visible='off';

            app.TabGroup.Visible='off';
            app.DataButtonGroup.Visible='off';
            app.Panel_2.Visible='off';
            app.which_map.Visible='off';
            app.ROIatlasDropDown.Visible='off';
            app.axialap.Visible='off';
            app.axialrl.Visible='off';
            app.coronalsi.Visible='off';
            app.ROIAtlasLabel.Visible='off';
            app.VisualizationoptionButtonGroup.Visible='off';
            app.RegionNetworkExclusionEditField.Visible='off';
            app.RegionNetworkExclusionEditFieldLabel.Visible='off';
            app.WhichMetaboliteButtonGroup.Visible='off';
            app.Slider.Visible='off';
            app.SliceNumberLabel.Visible='off';
            app.WhichMetaboliteButtonGroup.Visible='off';
            app.RegionNameDropDown.Visible='off';
            app.RegionNameDropDownLabel.Visible='off';

            obj=findobj(app.Panel,'type','Axes');
            delete(obj);
            wait=uiprogressdlg(app.UIFigure,"Message",'Processing.. It will take some time be patient. ','Title','Coregistration');
            app.VisualizationoptionButtonGroup.Visible='off';

            switch app.MetaboliteMapListppmButtonGroup.SelectedObject.Text
                case 'User defined map'
                    app.Metname={'Cr+PCr' 'Glu+Gln' 'GPC+PCh' 'Ins' 'Lac' 'Lip13a' 'Lip13b' 'Lip13a+Lip13b' 'NAA+NAAG' app.userdefmapname.Value};
                    shiftedppm=[3.03 2.25 3.2 3.52 1.3 1.3 1.3 1.3 2.02 app.userdefmapppm.Value];
                    set(app.UserdefinedmetaboliteButton,'Enable','on');

                otherwise %'Pre-defined maps (Above)'
                    app.Metname={'Cr+PCr' 'Glu+Gln' 'GPC+PCh' 'Ins' 'Lac' 'Lip13a' 'Lip13b' 'Lip13a+Lip13b' 'NAA+NAAG'};
                    shiftedppm=[3.03 2.25 3.2 3.52 1.3 1.3 1.3 1.3 2.02 ];
                    set(app.UserdefinedmetaboliteButton,'Enable','off');

            end

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

    %newly added for corre.

        MRIFOVMask_file=[app.coreg_path,filesep,app.Pinfo.sparname,'_FOV_mask.nii'];
        [app.Pinfo] = Mask_FOV_run_Pinfo(app.Pinfo,MRIFOVMask_file,app.RFOV_dir);
      
        
%%


                for k=1:numel(app.Metabolites)

                    wait.Value=(k/numel(app.Metabolites))-0.1;

                    %MRIFOVMask_file=[app.coreg_path,filesep,app.Pinfo.sparname,'_',app.Metabolites(k).name,'_FOV_mask.nii'];
                    MRIpressMask_file=[app.coreg_path,filesep,app.Pinfo.sparname,'_',app.Metabolites(k).name,'_PressBox_mask.nii'];

                    switch app.ChemicalshiftcorrectionButtonGroup.SelectedObject.Text
                        case 'On'
                            Chem_Shift_Dir_mat=find_chem_shift_directions(app.RFOV_dir, app.chem_shift_dir_AP, app.chem_shift_dir_LR, app.chem_shift_dir_FH);
                            [GR_ex, GR_echo,GR_echo2]=gradient_strength_calc(app.Pinfo.apVOI,app.Pinfo.lrVOI,app.Pinfo.ccVOI,Chem_Shift_Dir_mat,app.RFexBWEditField.Value,app.RFechoBWEditField.Value,app.RFecho2BWEditField.Value);
                            [app.chem_shift_ex(k).no,app.chem_shift_echo(k).no,app.chem_shift_echo2(k).no]=Chem_Shift_calculation(app.Metabolites(k).ppm,GR_ex,GR_echo,GR_echo2,app.ReferenceMetabolite.SelectedObject.Text,app.userrefmetppm);
                            [app.Pinfo] = Mask_Press_run_Pinfo(app.Pinfo,k,MRIpressMask_file,app.chem_shift_ex(k).no,app.chem_shift_echo(k).no,app.chem_shift_echo2(k).no,app.RFOV_dir);
                        otherwise
                            app.chem_shift_ex(k).no=0;
                            app.chem_shift_echo(k).no=0;
                            app.chem_shift_echo2(k).no=0;
                            %[app.Pinfo] = Mask_FOV_run_Pinfo(app.Pinfo,k,MRIFOVMask_file,app.chem_shift_ex(k).no,app.chem_shift_echo(k).no,app.chem_shift_echo2(k).no,app.RFOV_dir);
                            [app.Pinfo] = Mask_Press_run_Pinfo(app.Pinfo,k,MRIpressMask_file,app.chem_shift_ex(k).no,app.chem_shift_echo(k).no,app.chem_shift_echo2(k).no,app.RFOV_dir);
                    end
                end

                wait.Value=0.95;
                delete(wait);
                app.coreg_status=1;
            end

            A= app.Pinfo.VOIimg(app.Metabolites(1).no).fig; %Cr, 
            B= app.Pinfo.VOIimg(app.Metabolites(5).no).fig; %Lac,  
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

            ax.Title.String=([app.Metabolites(1).name,' VOI box']);
            pos=get(ax,'Position');
            set (ax,'Position',[pos(1)+pos(3)/4 pos(2) pos(3)/2 pos(4)]);
            %axis image;
            ax=subplot(3,1,2,'Parent',app.Panel);
            imagesc(ax,app.Fused_lac);
            colormap(ax,"gray");
            xticks(ax,[]);
            yticks(ax,[]);
            ax.Title.String=([app.Metabolites(5).name,' VOI box']);
            pos=get(ax,'Position');
            set (ax,'Position',[pos(1)+pos(3)/4 pos(2) pos(3)/2 pos(4)]);
            %axis image;
            ax=subplot(3,1,3,'Parent',app.Panel);
            imagesc(ax,app.Fused_all);
            colormap(ax,"gray");
            xticks(ax,[]);
            yticks(ax,[]);
            ax.Title.String=([app.Metabolites(1).name,' VOI box & ',app.Metabolites(5).name,' VOI box']);
            pos=get(ax,'Position');
            set (ax,'Position',[pos(1)+pos(3)/4 pos(2) pos(3)/2 pos(4)]);
            %axis image;
            app.currentmodule=2;
            app.mcoregistration=1;
            if  app.mcoregistration>0
                set(app.SegmentationButton,'Enable','on');
                app.Panel.AutoResizeChildren='on';
            end
        end

        % Button pushed function: SegmentationButton
        function SegmentationButtonPushed(app, event)
            app.EditSpectralquality.Visible='off';
            app.MinEditField.Visible='off';
            app.MaxEditField.Visible='off';
            app.MinEditFieldLabel.Visible='off';
            app.MaxEditFieldLabel.Visible='off';
            % app.AdjustrangeButton.Visible='on';
            app.AdjustrangeButton_2.Visible='off';
            app.AdjustrangeButton_3.Visible='off';

            app.MinEditField_2.Visible='off';
            app.MaxEditField_2.Visible='off';
            app.MinEditField_2Label.Visible='off';
            app.MaxEditField_2Label.Visible='off';
            app.MinEditField_3.Visible='off';
            app.MaxEditField_3.Visible='off';
            app.MinEditField_3Label.Visible='off';
            app.MaxEditField_3Label.Visible='off';
            tic
            app.TabGroup.Visible='off';
            % app.Panel_2.Visible='off';
            app.ROIatlasDropDown.Visible='off';
            app.ROIAtlasLabel.Visible='off';
            app.RegionNetworkExclusionEditField.Visible='off';
            app.RegionNetworkExclusionEditFieldLabel.Visible='off';
            app.which_map.Visible='off';
            app.RegionNameDropDown.Visible='off';
            app.RegionNameDropDownLabel.Visible='off';

            obj=findobj(app.Panel,'type','Axes');
            delete(obj);



            app.MinEditField.Value=app.MinEditField.Value;
            app.MaxEditField.Value=app.MaxEditField.Value;
            app.Slider.Visible='off';
            app.SliceNumberLabel.Visible='off';
            app.WhichMetaboliteButtonGroup.Visible='on';
            app.SliceNumberLabel.Visible='on';
            app.WhichMetaboliteButtonGroup.Visible='off'; %newly added

            %%%% Coreg of Little Voxels and calculation of fractions including CSF, WM and GM of these little voxels.
            litoutpath=[app.Pinfo.spectrapath,filesep,'nifti',filesep,'binary_mask_littlevoxels'];
            if ~exist(litoutpath,'dir')
                mkdir(litoutpath);
            end
            %% %%
            if app.seg_status<1
                app.MinEditField.Value=0;
                app.MaxEditField.Value=1;
                [app.Pinfo, AlFWHM, AlSNR, app.AllNumStd, app.AllConc]=GUI_seg(app.UIFigure,app.Metabolites,app.Pinfo, app.chem_shift_ex, app.chem_shift_echo, app.chem_shift_echo2,app.ChemicalshiftcorrectionButtonGroup.SelectedObject.Text,app.MRSIacquiredafterButtonGroup.SelectedObject.Text,litoutpath,app.RFOV_dir,app.MetaboliteMapListppmButtonGroup.SelectedObject.Text,app.userdefmapname.Value,app.userdefmapppm.Value);
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


            button=app.WhichMetaboliteButtonGroup.SelectedObject;
            button=button.Text;
            switch button
                case 'Other'
                    WhichMetabNo=10;
                otherwise
                    button=strsplit(button,'Button');
                    [~,WhichMetabNo]=ismember(button{1},{app.Metabolites(:).name});
            end

            Map_fcsf_Generation(app.Pinfo,app.fcsf,app.coreg_path,app.Metabolites);
            Map_fgm_Generation(app.Pinfo,app.fgm,app.coreg_path,app.Metabolites);
            Map_fwm_Generation(app.Pinfo,app.fwm,app.coreg_path,app.Metabolites);
            %%%% Figure adjust
            fwmout_mask=[app.Pinfo.spectrapath,filesep,'nifti',filesep,'fwm_maps'];
            fwmMask=niftiread([fwmout_mask,filesep,app.Pinfo.sparname,'_NAA+NAAG_fwm.nii']);
            fgmout_mask=[app.Pinfo.spectrapath,filesep,'nifti',filesep,'fgm_maps'];
            fgmMask=niftiread([fgmout_mask,filesep,app.Pinfo.sparname,'_NAA+NAAG_fgm.nii']);
            fcsfout_mask=[app.Pinfo.spectrapath,filesep,'nifti',filesep,'fcsf_maps'];
            fcsfMask=niftiread([fcsfout_mask,filesep,app.Pinfo.sparname,'_NAA+NAAG_fcsf.nii']);

            %
             % 
             % fwmMask=niftiread('/Users/sevim/Downloads/Oryx-SC_jan19/Oryx-MRSI-main/Dataset/K_01/exam_1/spectra/nifti/fwm_maps/K_01_press_1_raw_act_NAA+NAAG_fwm.nii');
             %             fgmMask=niftiread('/Users/sevim/Downloads/Oryx-SC_jan19/Oryx-MRSI-main/Dataset/K_01/exam_1/spectra/nifti/fgm_maps/K_01_press_1_raw_act_NAA+NAAG_fgm.nii');
             %              fcsfMask=niftiread('/Users/sevim/Downloads/Oryx-SC_jan19/Oryx-MRSI-main/Dataset/K_01/exam_1/spectra/nifti/fcsf_maps/K_01_press_1_raw_act_NAA+NAAG_fcsf.nii');




            app.Panel.AutoResizeChildren='off';
            app.axialap.Visible='on';
            app.axialrl.Visible='on';
            app.coronalsi.Visible='on';
            app.MaxEditFieldLabel.Visible='on';
            app.MinEditFieldLabel.Visible='on';
            %
            [sx,sy,sz]=size(fwmMask);
            %
            app.axialrl.Limits=[1,sx];
            %             % app.axialrl.MajorTicks = linspace(1,1,1);
            app.axialap.Limits=[1,sy];
            %             %app.axialap.MajorTicks = linspace(1,sy,sy);
            app.coronalsi.Limits=[1,sz];
            %             %app.coronalsi.MajorTicks = linspace(1,sz,sz);
            app.axialrl.Visible='on';
            app.axialap.Visible='on';
            % app.axialap.Position = [134 390 3 150];
            app.coronalsi.Visible='on';
            app.ILabel.Visible='on';
            app.SLabel.Visible='on';
            app.ALabel.Visible='on';
            app.PLabel.Visible='on';
            app.RLabel.Visible='on';
            app.LLabel.Visible='on';
            app.MinEditField.Visible='on';
            app.MaxEditField.Visible='on';
            app.AdjustrangeButton.Visible='on';

            slice=[round(app.axialrl.Value),round(app.axialap.Value),round(app.coronalsi.Value)];
            [three_plane_fwm]= view3D(slice,fwmMask);
            [three_plane_fgm]= view3D(slice,fgmMask);
            [three_plane_fcsf]= view3D(slice,fcsfMask);

            ax=subplot(3,1,1,'Parent',app.Panel);
            imagesc(ax,three_plane_fcsf);
            ax.Title.String=({[' fCSF '] ['Left: Axial, Middle: Sagittal, Right: Coronal']});
            axis(ax,'off');
            % axis image;
            colormap(ax,"hot");
            colorbar(ax);
            caxis(ax,[app.MinEditField.Value,app.MaxEditField.Value]);


            ax=subplot(3,1,2,'Parent',app.Panel);
            imagesc(ax,three_plane_fwm);
            ax.Title.String=({['fWM'] ['Left: Axial, Middle: Sagittal, Right: Coronal']});
            axis(ax,'off');
            %axis image;
            colormap(ax,"hot");
            colorbar(ax);
            caxis(ax,[app.MinEditField.Value,app.MaxEditField.Value]);

            ax=subplot(3,1,3,'Parent',app.Panel);
            imagesc(ax,three_plane_fgm);
            caxis(ax,[app.MinEditField.Value,app.MaxEditField.Value]);
            ax.Title.String=({['fGM'] ['Left: Axial, Middle: Sagittal, Right: Coronal']});
            axis(ax,'off');
            % axis image;
            colormap(ax,"hot");
            colorbar(ax);

            app.currentmodule=3;
            app.msegmentation=1;

            if  app.msegmentation>0
                set(app.CRLBFWHMSNRButton,'Enable','on');
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

            if app.currentmodule==3
                app.SegmentationButtonPushed(app);
            end

            if app.currentmodule==4
                app.CRLBFWHMSNRButtonPushed(app);
            end
            if  app.currentmodule==5
                app.SpectralqualityButtonPushed(app);
            end
        end

        % Button pushed function: CRLBFWHMSNRButton
        function CRLBFWHMSNRButtonPushed(app, event)
            app.EditSpectralquality.Visible='off';
            app.TabGroup.Visible='off';
            app.MinEditField.Visible='off';
            app.MaxEditField.Visible='off';
            app.AdjustrangeButton.Visible='off';
            %app.Panel_2.Visible='off';
            app.ROIatlasDropDown.Visible='off';
            app.ROIAtlasLabel.Visible='off';
            app.RegionNetworkExclusionEditField.Visible='off';
            app.RegionNetworkExclusionEditFieldLabel.Visible='off';
            app.Panel.AutoResizeChildren='off';
            app.WhichMetaboliteButtonGroup.Visible='off';
            app.which_map.Visible='off';
            app.axialap.Visible='on';
            app.axialrl.Visible='on';
            app.coronalsi.Visible='on';
            app.SliceNumberLabel.Visible='off';
            app.Slider.Visible='off';
            app.RegionNameDropDown.Visible='off';
            app.RegionNameDropDownLabel.Visible='off';
            obj=findobj(app.Panel,'type','Axes');
            delete(obj);
            app.WhichMetaboliteButtonGroup.Visible='on';
            button=app.WhichMetaboliteButtonGroup.SelectedObject;
            button=button.Text;
            button=strsplit(button,'Button');
            [~,WhichMetabNo]=ismember(button{1},{app.Metabolites(:).name});

          %  if            app.currentmodule<2
                Conc_SNR_Generation(app.Pinfo,app.AllSNR,app.coreg_path,app.Metabolites); %% revision SNR view
                Conc_FWHM_Generation(app.Pinfo,app.AllFWHM,app.coreg_path,app.Metabolites); %% revision FWHM view
                Conc_CRLB_Generation(app.Pinfo,app.AllNumStd,app.coreg_path,app.Metabolites,app.ReferenceMetabolite.SelectedObject.Text);
           % end

            snrout_mask=[app.Pinfo.spectrapath,filesep,'nifti',filesep,'SNR_maps'];
            snrMask=niftiread([snrout_mask,filesep,app.Pinfo.sparname,'_','SNR.nii']);
            fwhmout_mask=[app.Pinfo.spectrapath,filesep,'nifti',filesep,'FWHM_maps'];
            fwhmMask=niftiread([fwhmout_mask,filesep,app.Pinfo.sparname,'_','FWHM.nii']);
            crlbout_mask=[app.Pinfo.spectrapath,filesep,'nifti',filesep,'CRLB_maps'];
            crlbMask=niftiread([crlbout_mask,filesep,app.Pinfo.sparname,'_',button{1,1},'_crlb.nii']);

            slice=[round(app.axialrl.Value),round(app.axialap.Value),round(app.coronalsi.Value)];

            [three_plane_snr]= view3D(slice,snrMask);
            [three_plane_fwhm]= view3D(slice,fwhmMask);
            [three_plane_CRLB]= view3D(slice,crlbMask);

            ax=subplot(3,1,1,'Parent',app.Panel);
            imagesc(ax,three_plane_CRLB);
            colormap(ax,"hot");
            axis(ax,'off');
            % axis image;
            caxis(ax,[0,30]);
            if app.currentmodule==4
                caxis(ax,[app.MinEditField.Value,app.MaxEditField.Value]);
            end
            colorbar(ax);
            ax.Title.String=([{[' CRLB '] ['Left: Axial, Middle: Sagittal, Right: Coronal']}]);
            ax=subplot(3,1,2,'Parent',app.Panel);
            imagesc(ax,three_plane_fwhm);
            colormap(ax,"hot");
            axis(ax,'off');
            % axis image;
            caxis(ax,[0,0.2]);
            if app.currentmodule==4
                caxis(ax,[app.MinEditField_2.Value,app.MaxEditField_2.Value]);
            end
            colorbar(ax);
            ax.Title.String=([{[' FWHM '] ['Left: Axial, Middle: Sagittal, Right: Coronal']}]);
            ax=subplot(3,1,3,'Parent',app.Panel);
            imagesc(ax,three_plane_snr);
            axis(ax,'off');
            % axis image;
            colormap(ax,"hot");
            colorbar(ax);
            caxis(ax,[0,90]);
            if app.currentmodule==4
                caxis(ax,[app.MinEditField_3.Value,app.MaxEditField_3.Value]);
            end
            ax.Title.String=([{[' SNR '] ['Left: Axial, Middle: Sagittal, Right: Coronal']}]);
            app.Panel.AutoResizeChildren='on';
            app.currentmodule=4;
            app.mfhwmsnr=1;
            app.MinEditField.Visible='on';
            app.MaxEditField.Visible='on';
            app.MinEditField_2.Visible='on';
            app.MaxEditField_2.Visible='on';
            app.MinEditField_3.Visible='on';
            app.MaxEditField_3.Visible='on';
            app.MinEditFieldLabel.Visible='on';
            app.MaxEditFieldLabel.Visible='on';
            app.MinEditField_2Label.Visible='on';
            app.MaxEditField_2Label.Visible='on';
            app.MinEditField_3Label.Visible='on';
            app.MaxEditField_3Label.Visible='on';
            app.AdjustrangeButton.Visible='on';
            app.AdjustrangeButton_2.Visible='on';
            app.AdjustrangeButton_3.Visible='on';
            if  app.mfhwmsnr>0
                set(app.SpectralqualityButton,'Enable','on');
            end
        end

        % Button pushed function: SpectralqualityButton
        function SpectralqualityButtonPushed(app, event)
            app.EditSpectralquality.Visible='on';
            app.axialap.Visible='off';
            app.axialrl.Visible='off';
            app.coronalsi.Visible='off';
            app.MinEditField.Visible='off';
            app.MaxEditField.Visible='off';
            app.MinEditFieldLabel.Visible='off';
            app.MaxEditFieldLabel.Visible='off';
            app.AdjustrangeButton.Visible='off';
            app.AdjustrangeButton_2.Visible='off';
            app.AdjustrangeButton_3.Visible='off';
            app.MinEditField_2.Visible='off';
            app.MaxEditField_2.Visible='off';
            app.MinEditField_2Label.Visible='off';
            app.MaxEditField_2Label.Visible='off';
            app.MinEditField_3.Visible='off';
            app.MaxEditField_3.Visible='off';
            app.MinEditField_3Label.Visible='off';
            app.MaxEditField_3Label.Visible='off';

            app.TabGroup.Visible='off';
            app.Panel_2.Visible='off';
            app.ROIatlasDropDown.Visible='off';
            app.ROIAtlasLabel.Visible='off';
            app.RegionNetworkExclusionEditField.Visible='off';
            app.RegionNetworkExclusionEditFieldLabel.Visible='off';
            app.WhichMetaboliteButtonGroup.Visible='on';
            app.which_map.Visible='off';
            app.ALabel.Visible='off';
            app.PLabel.Visible='off';
            app.RLabel.Visible='off';
            app.LLabel.Visible='off';
            app.SLabel.Visible='off';
            app.ILabel.Visible='off';
            app.SliceNumberLabel.Visible='on';
            app.Slider.Visible='on';
            app.RegionNameDropDown.Visible='off';
            app.RegionNameDropDownLabel.Visible='off';

            obj=findobj(app.Panel,'type','Axes');
            delete(obj);
            Exc_struct.value= [app.fcsfEditField.Value,app.SNREditField.Value,app.FWHMEditField.Value,app.CRLBEditField.Value ]; %str2num(Exc_info{1,1});
            Exc_struct.name=[{'fcsf'}, {'SNR'}, {'FWHM'}, {'CRLB'}];
            if app.currentmodule<5
                [app.includedvoxels]=ExclusionCriteria(app.Pinfo,app.AllFWHM,app.AllSNR,app.AllNumStd,app.Metname,app.Metabolites,app.outmat,Exc_struct);
                %    app.includedvoxels=ones(9,3,14,14);
            end

            app.WhichMetaboliteButtonGroup.Visible='on';
            button=app.WhichMetaboliteButtonGroup.SelectedObject;
            button=button.Text;
            button=strsplit(button,'Button');
            [~,WhichMetabNo]=ismember(button{1},{app.Metabolites(:).name});
            app.Panel.AutoResizeChildren='off';
            ax=subplot(1,1,1,'Parent',app.Panel);
            app.WhichMetabNoD=WhichMetabNo;

            fig_included=squeeze(app.includedvoxels(WhichMetabNo,app.Slider.Value,:,:));


            if app.edit==1
                if app.includedvoxels(WhichMetabNo,app.Slider.Value,app.rowno,app.colno)==1
                    app.includedvoxels(WhichMetabNo,app.Slider.Value,app.rowno,app.colno)=0;
                else
                    app.includedvoxels(WhichMetabNo,app.Slider.Value,app.rowno,app.colno)=1;
                end
                fig_included=squeeze(app.includedvoxels(WhichMetabNo,app.Slider.Value,:,:));
            end

            imagesc(ax,fig_included);
            colormap(ax,"gray");
            xticks(ax,[]);
            yticks(ax,[]);
            pos=get(ax,'Position');
            set (ax,'Position',[pos(1)+pos(3)/4 pos(2) pos(3)/2 pos(4)]);

            h = datacursormode(app.UIFigure);
            set(h,'UpdateFcn', @updater );
            datacursormode(app.UIFigure,'on');

            function explanation=updater(obj,event_obj)
                pos=event_obj.Position;
                rownumre=pos(2);
                app.rowno=rownumre;
                colnumre=pos(1);
                app.colno=colnumre;
                fcsfval=app.fcsf(WhichMetabNo,app.Slider.Value,rownumre,colnumre);
                snrval=app.AllSNR(app.Slider.Value,rownumre,colnumre);
                fwhmval=app.AllFWHM(app.Slider.Value,rownumre,colnumre);
                crlbval=app.AllNumStd(app.WhichMetabNoD,app.Slider.Value,rownumre,colnumre);
                concval=app.AllConc(app.WhichMetabNoD,app.Slider.Value,rownumre,colnumre);
                explanation={['fCSF=' num2str(fcsfval,4) newline 'SNR=' num2str(snrval,4) newline 'FWHM=' num2str(fwhmval,4) newline 'Conc=' num2str(concval,4) newline 'CRLB=' num2str(crlbval,4)]};
            end

            ax.Title.String=(['Included voxels']);
            app.Panel.AutoResizeChildren='on';
            app.currentmodule=5;
            app.mincludedvoxels=1;
            if  app.mincludedvoxels>0
                set(app.MetabolitemapsButton,'Enable','on');
            end
        end

        % Button pushed function: MetabolitemapsButton
        function MetabolitemapsButtonPushed(app, event)
            app.EditSpectralquality.Visible='off';
            app.TabGroup.Visible='off';
            app.MinEditField.Visible='off';
            app.MaxEditField.Visible='off';
            app.MinEditFieldLabel.Visible='off';
            app.MaxEditFieldLabel.Visible='off';
            app.AdjustrangeButton.Visible='off';
            app.AdjustrangeButton_2.Visible='off';
            app.AdjustrangeButton_3.Visible='off';
            app.Panel_2.Visible='off';
            app.Slider.Visible='off';
            app.SliceNumberLabel.Visible='off';
            app.ROIatlasDropDown.Visible='off';
            app.ROIAtlasLabel.Visible='off';
            app.RegionNetworkExclusionEditField.Visible='off';
            app.RegionNetworkExclusionEditFieldLabel.Visible='off';
            app.WhichMetaboliteButtonGroup.Visible='off';
            app.RegionNameDropDown.Visible='off';
            app.RegionNameDropDownLabel.Visible='off';

            obj=findobj(app.Panel,'type','Axes');
            delete(obj);
            wait=uiprogressdlg(app.UIFigure,'Title','Processing','Message','Processing..');
            wait.Value=0.2;
            if app.metmap_status<1
                Conc_Map_Generation(app.Pinfo,app.AllConc,app.coreg_path,app.Metabolites,app.includedvoxels);
                corrected_conc_map_generation(app.Pinfo,app.AllConc,app.coreg_path,app.Metabolites,app.includedvoxels);
                Conc_to_Ratio_Maps(app.Pinfo);
                corrected_conc_maps_to_ratio_maps(app.Pinfo,app);
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
            app.currentmodule=6;
            app.metmap_status=1;
            app.mmetabolitemaps=1;
            if  app.mmetabolitemaps>0
                set(app.RegistrationButton,'Enable','on');
            end
        end

        % Button pushed function: RegistrationButton
        function RegistrationButtonPushed(app, event)
            app.EditSpectralquality.Visible='off';
            app.Panel_2.Visible='off';
            app.MinEditField.Visible='off';
            app.MaxEditField.Visible='off';
            app.AdjustrangeButton.Visible='off';
            app.AdjustrangeButton_2.Visible='off';
            app.AdjustrangeButton_3.Visible='off';
            app.TabGroup.Visible='off';
            app.ROIatlasDropDown.Visible='off';
            app.ROIAtlasLabel.Visible='off';
            app.RegionNetworkExclusionEditField.Visible='off';
            app.RegionNetworkExclusionEditFieldLabel.Visible='off';
            app.WhichMetaboliteButtonGroup.Visible='on';
            app.RegionNameDropDown.Visible='off';
            app.RegionNameDropDownLabel.Visible='off';

            app.which_map.Visible='on';
            app.SliceNumberLabel.Visible='off';
            app.Slider.Visible='off';
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
            app.currentmodule=7;
            app.regist_status=1;

        end

        % Button pushed function: ROIAnalyzeButton
        function ROIAnalyzeButtonPushed(app, event)
            app.EditSpectralquality.Visible='off';
            app.RegionNameDropDown.Visible='off';
            app.Panel_2.Visible='off';
            app.MinEditField.Visible='off';
            app.MaxEditField.Visible='off';
            app.MinEditFieldLabel.Visible='off';
            app.MaxEditFieldLabel.Visible='off';
            app.AdjustrangeButton.Visible='off';
            app.AdjustrangeButton_2.Visible='off';
            app.AdjustrangeButton_3.Visible='off';
            app.which_map.Visible='off';
            app.WhichMetaboliteButtonGroup.Visible='off';
            app.TabGroup.Visible='on';
            app.ROIatlasDropDown.Visible='on';
            app.RegionNameDropDownLabel.Visible='off';

            app.ROIAtlasLabel.Visible='on';
            app.RegionNetworkExclusionEditField.Visible='on';
            app.RegionNetworkExclusionEditFieldLabel.Visible='on';
            set(app.DistributionsButton,'Enable','on');
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
                        filename='/Atlases/Schaefer2018_100Parcels_7Networks.xlsx';
                    case 'Schaefer2018_400Parcels_7Networks_2mm'
                        app.atlaspath='Schaefer2018_100Parcels_7Networks_order_FSLMNI152_2mm.nii.gz';
                        filename='/Atlases/Schaefer2018_400Parcels_7Networks.xlsx';
                    case 'MNI_thr0_2mm'
                        app.atlaspath='MNI-maxprob-thr0-2mm.nii.gz';
                        filename='/Atlases/MNI.xlsx';
                    case 'MNI_thr25_2mm'
                        app.atlaspath='MNI-maxprob-thr25-2mm.nii.gz';
                        filename='/Atlases/MNI.xlsx';
                    case 'MNI_thr50_2mm'
                        app.atlaspath='MNI-maxprob-thr50-2mm.nii.gz';
                        filename='/Atlases/MNI.xlsx';
                end
                T_selected = readtable(filename);


                [app.meanTab,app.medianTab,app.stdTab]=ScriptAnalyze(app.Pinfo,app.atlaspath,app.RegionNetworkExclusionEditField.Value,T_selected);
            end
            app.TabGroup.Visible='on';
            app.meantable.Data=cell2table(app.meanTab);
            app.mediantable.Data=cell2table(app.medianTab);
            app.stdtable.Data=cell2table(app.stdTab);
            app.roi_status=0;
            app.currentmodule=8;
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
            app.MinEditField.Visible='off';
            app.MaxEditField.Visible='off';
            app.AdjustrangeButton.Visible='off';
            app.AdjustrangeButton_2.Visible='off';
            app.AdjustrangeButton_3.Visible='off';
            button=app.WhichMetaboliteButtonGroup.SelectedObject;
            button=button.Text;
            button=strsplit(button,'Button');
            [~,WhichMetabNo]=ismember(button{1},{app.Metabolites(:).name});

            if app.currentmodule==3
                app.SegmentationButtonPushed(app);
            end
            if app.currentmodule==4 %%Bunu kontrol et 4 mu olcakkk
                app.MinEditField.Visible='on';
                app.MinEditFieldLabel.Visible='on';
                app.MaxEditField.Visible='on';
                app.MaxEditFieldLabel.Visible='on';
                app.AdjustrangeButton.Visible='on';
                app.CRLBFWHMSNRButtonPushed(app);
            end
            if  app.currentmodule==5
                app.SpectralqualityButtonPushed(app);
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
                app.MetabolitemapsButtonPushed(app);
            end
            if app.currentmodule==7
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
            if app.currentmodule==9
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
                app.DistributionsButtonPushed(app);
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
            if app.currentmodule==6
                app.MetabolitemapsButtonPushed(app);
            end
            if app.currentmodule==7
                app.RegistrationButtonPushed(app);
            end
            if app.currentmodule==9
                app.DistributionsButtonPushed(app);
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
            web('https://sevimcengiz.github.io/oryx/','-browser')
        end

        % Image clicked function: Oryxlogo
        function OryxlogoImageClicked(app, event)
            web('https://sevimcengiz.github.io/oryx/','-browser')
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
            switch        selectedButton.Text;
                case  'User defined reference metabolite'
                    set(app.refmetppm,'Enable','on');
                    set(app.refmetname,'Enable','on');
                    app.refppm=app.refmetppm.Value;
                otherwise
                    set(app.refmetppm,'Enable','off');
                    set(app.refmetname,'Enable','off');
            end
        end

        % Selection changed function: DataButtonGroup
        function DataButtonGroupSelectionChanged(app, event)
            selectedButton = app.DataButtonGroup.SelectedObject;
            obj=findobj(app.Panel,'type','Axes'); %panel clear
            delete(obj);%panel clear
            app.LoadDataButtonPushed(app);
        end

        % Button pushed function: BackButton
        function BackButtonPushed(app, event)
            app.backtrig='1';
            app.Panel2.Visible='off';
            app.Panel1.Visible='on';
            app.DataButtonGroup.Visible='off';
            app.Panel_2.Visible='off';
            app.MinEditField.Visible='off';
            app.MinEditFieldLabel.Visible='off';
            app.MaxEditField.Visible='off';
            app.MaxEditFieldLabel.Visible='off';
            app.AdjustrangeButton.Visible='off';
            app.AdjustrangeButton_2.Visible='off';
            app.AdjustrangeButton_3.Visible='off';
            app.RegionNameDropDown.Visible='off';
            app.RegionNameDropDownLabel.Visible='off';

        end

        % Button pushed function: DistributionsButton
        function DistributionsButtonPushed(app, event)
            app.EditSpectralquality.Visible='off';
            obj=findobj(app.Panel,'type','Axes');
            delete(obj);
            app.Panel_2.Visible='off';
            app.MinEditField.Visible='off';
            app.MaxEditField.Visible='off';
            app.AdjustrangeButton.Visible='off';
            app.AdjustrangeButton_2.Visible='off';
            app.AdjustrangeButton_3.Visible='off';
            app.TabGroup.Visible='off';
            app.ROIatlasDropDown.Visible='off';
            app.RegionNameDropDownLabel.Visible='on';

            app.ROIAtlasLabel.Visible='off';
            app.RegionNetworkExclusionEditField.Visible='off';
            app.RegionNetworkExclusionEditFieldLabel.Visible='off';
            app.WhichMetaboliteButtonGroup.Visible='on';
            app.which_map.Visible='on';
            app.SliceNumberLabel.Visible='off';
            app.Slider.Visible='off';


            switch app.ROIatlasDropDown.Value
                case 'Schaefer2018_100Parcels_7Networks_2mm'
                    filename='/Atlases/Schaefer2018_100Parcels_7Networks.xlsx';
                case 'Schaefer2018_400Parcels_7Networks_2mm'
                    filename='/Atlases/Schaefer2018_400Parcels_7Networks.xlsx';
                otherwise

                    filename='/Atlases/MNI.xlsx';
            end
            T_selected = readtable(filename);
            app.RegionNameDropDown.Items = T_selected{:,2};


            app.RegionNameDropDown.Visible='on';
            button=app.WhichMetaboliteButtonGroup.SelectedObject;
            button=button.Text;
            button=strsplit(button,'Button');
            [~,app.WhichMetabNoD]=ismember(button{1},{app.Metabolites(:).name});

            button2=app.which_map.SelectedObject;
            button2=button2.Text;
            for q=1:(max(T_selected{:,1}))
                numbr=strcmp( app.RegionNameDropDown.Value,T_selected{q,2}{1,1});
                if (numbr==1)
                    whichregion=T_selected{q,1};
                end
            end



 app.which_map.Title = 'Which Box Plot?';
 app.concentrationmap.Text = 'concentration';
 app.concentrationmaptoInsRatio.Text = 'concentration to Ins ratio';         
 app.concentrationmaptoCrPCrratio.Text = 'concentration to tCr ratio';
 app.CSFcorrectedconcetrationmaptoCrPCrratio.Text = 'CSF corrected concetration to tCr ratio';
 app.CSFcorrectedconcentrationmaptoInsratio.Text = 'CSF corrected concentration to Ins ratio';
 app.CSFcorrectedconcentrationmap.Text = 'CSF corrected concentration';



            [ROI]=dist_boxplot(app.Pinfo,app.atlaspath,whichregion,app.WhichMetabNoD,button2,button{1,1});
            app.Panel.AutoResizeChildren='off';
            ax=subplot(1,1,1,'Parent',app.Panel);
            boxplot(ax,ROI);
            pos=get(ax,'Position');
            pos2=[0.20+pos(1), pos(2), pos(3)/1.25, pos(4)/1.25];
            set (ax,'Position',pos2);
            ax.Title.String=(['Box plot visual - ', button{1,1}, ' at ', T_selected{whichregion,2}{1,1}]);
            app.currentmodule=9;
        end

        % Image clicked function: Image
        function ImageClicked(app, event)
            web('https://www.youtube.com/watch?v=X4nqGlny-O8','-browser')
        end

        % Image clicked function: pubmed
        function pubmedImageClicked(app, event)
            web('https://www.biorxiv.org/content/10.1101/2021.11.12.468398v1','-browser')
        end

        % Callback function
        function CRLBButtonPushed(app, event)
            app.EditSpectralquality.Visible='off';
            app.MinEditField.Visible='off';
            app.MaxEditField.Visible='off';
            app.AdjustrangeButton.Visible='off';
            app.axialap.Visible='on';
            app.axialrl.Visible='on';
            app.coronalsi.Visible='on';
            app.ILabel.Visible='on';
            app.SLabel.Visible='on';
            app.ALabel.Visible='on';
            app.PLabel.Visible='on';
            app.RLabel.Visible='on';
            app.LLabel.Visible='on';
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
            wait.Value=0.7;
            app.WhichMetaboliteButtonGroup.Visible='on';
            button=app.WhichMetaboliteButtonGroup.SelectedObject;
            button=button.Text;
            button=strsplit(button,'Button');
            [~,WhichMetabNo]=ismember(button{1},{app.Metabolites(:).name});
            app.Panel.AutoResizeChildren='off';
            ax=subplot(1,1,1,'Parent',app.Panel);
            Conc_CRLB_Generation(app.Pinfo,app.AllNumStd,app.coreg_path,app.Metabolites);
            crlbout_mask=[app.Pinfo.spectrapath,filesep,'nifti',filesep,'CRLB_maps'];
            crlbMask=niftiread([crlbout_mask,filesep,app.Pinfo.sparname,'_',button{1,1},'_crlb.nii']);
            slice=[round(app.axialrl.Value),round(app.axialap.Value),round(app.coronalsi.Value)];
            [three_plane_CRLB]= view3D(slice,crlbMask);
            wait.Value=0.9;
            ax=subplot(3,1,1,'Parent',app.Panel);
            imagesc(ax,three_plane_CRLB);
            %              pos=get(ax,'Position');
            %              set (ax,'Position',[0.5-(pos(3)/4) 0.5-(pos(4)/4) pos(3)/2 (pos(4)/2)]);
            colormap(ax,"hot");
            colorbar(ax);
            axis(ax,'off');
            if app.currentmodule==5
                caxis(ax,[app.MinEditField.Value,app.MaxEditField.Value]);
            end
            ax.Title.String=([' CRLB']);
            app.Panel.AutoResizeChildren='on';
            app.currentmodule=3;
            app.MinEditField.Visible='on';
            app.MaxEditField.Visible='on';
            app.AdjustrangeButton.Visible='on';
            app.AdjustrangeButton_2.Visible='on';
            app.AdjustrangeButton_3.Visible='on';
            app.currentmodule=5;
            app.mcrlb=1;
            if  app.mcrlb>0
                set(app.SpectralqualityButton,'Enable','on');
            end
        end

        % Selection changed function: MetaboliteMapListppmButtonGroup
        function MetaboliteMapListppmButtonGroupSelectionChanged(app, event)
            selectedButton = app.MetaboliteMapListppmButtonGroup.SelectedObject;
            %   app.userdefinedmap=app.ReferenceMetabolite.SelectedObject.Text;
            switch        selectedButton.Text;
                case  'Above-mentioned maps'
                    set(app.userdefmapname,'Enable','off');
                    set(app.userdefmapppm,'Enable','off');
                    %app.refppm=app.refmetppm.Value;
                otherwise
                    set(app.userdefmapname,'Enable','on');
                    set(app.userdefmapppm,'Enable','on');
            end
        end

        % Button pushed function: AdjustrangeButton
        function AdjustrangeButtonPushed(app, event)
            if app.currentmodule==3
                app.SegmentationButtonPushed(app);
                app.MinEditField.Value,app.MaxEditField.Value
            end
            if app.currentmodule==4
                app.CRLBFWHMSNRButtonPushed(app);
            end
        end

        % Callback function
        function axialrlValueChanged3(app, event)
            value = app.axialrl.Value;
            if app.currentmodule==3
                app.SegmentationButtonPushed(app);
            end
            if app.currentmodule==4
                app.CRLBFWHMSNRButtonPushed(app);
            end

        end

        % Value changed function: axialrl
        function axialrlValueChanged4(app, event)
            value = app.axialrl.Value;
            if app.currentmodule==3
                app.SegmentationButtonPushed(app);
            end
            if app.currentmodule==4
                app.CRLBFWHMSNRButtonPushed(app);
            end
        end

        % Value changed function: coronalsi
        function coronalsiValueChanged(app, event)
            value = app.coronalsi.Value;
            if app.currentmodule==3
                app.SegmentationButtonPushed(app);
            end
            if app.currentmodule==4
                app.CRLBFWHMSNRButtonPushed(app);
            end

        end

        % Value changed function: axialap
        function axialapValueChanged(app, event)
            value = app.axialap.Value;
            if app.currentmodule==3
                app.SegmentationButtonPushed(app);
            end
            if app.currentmodule==4
                app.CRLBFWHMSNRButtonPushed(app);
            end

        end

        % Button pushed function: EditSpectralquality
        function EditSpectralqualityButtonPushed(app, event)

            answer = questdlg('Would you like to change the inclusion status for the selected voxel?', ...
                ' ', ...
                'No','Yes','Yes');
            % Handle response
            switch answer
                case 'No'
                    % disp([answer 'The analysis will continue'])
                    app.SpectralqualityButtonPushed(app);
                    app.edit=0;

                case 'Yes'
                    % disp([answer 'The parameters are setted up and the previous files will delete!'])
                    app.edit=1;
                    app.SpectralqualityButtonPushed(app);

            end

        end

        % Value changed function: MinEditField
        function MinEditFieldValueChanged(app, event)
            value = app.MinEditField.Value;
        end

        % Value changed function: MaxEditField
        function MaxEditFieldValueChanged(app, event)
            value = app.MaxEditField.Value;
        end

        % Button pushed function: AdjustrangeButton_2
        function AdjustrangeButton_2Pushed(app, event)
            app.CRLBFWHMSNRButtonPushed(app);
        end

        % Value changed function: RegionNameDropDown
        function RegionNameDropDownValueChanged(app, event)
            value = app.RegionNameDropDown.Value;
            app.DistributionsButtonPushed(app);
        end

        % Button pushed function: AdjustrangeButton_3
        function AdjustrangeButton_3Pushed(app, event)
            app.CRLBFWHMSNRButtonPushed(app);
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

            % Create Panel2
            app.Panel2 = uipanel(app.UIFigure);
            app.Panel2.BorderType = 'none';
            app.Panel2.TitlePosition = 'centertop';
            app.Panel2.Title = 'ORYX MRSI';
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
            app.LoadDataButton.Position = [8 538 194 33];
            app.LoadDataButton.Text = 'Load Data';

            % Create CoregistrationButton
            app.CoregistrationButton = uibutton(app.Panel2, 'push');
            app.CoregistrationButton.ButtonPushedFcn = createCallbackFcn(app, @CoregistrationButtonPushed, true);
            app.CoregistrationButton.FontSize = 20;
            app.CoregistrationButton.Position = [8 493 194 33];
            app.CoregistrationButton.Text = 'Coregistration';

            % Create SegmentationButton
            app.SegmentationButton = uibutton(app.Panel2, 'push');
            app.SegmentationButton.ButtonPushedFcn = createCallbackFcn(app, @SegmentationButtonPushed, true);
            app.SegmentationButton.FontSize = 20;
            app.SegmentationButton.Position = [8 448 194 33];
            app.SegmentationButton.Text = 'Segmentation';

            % Create CRLBFWHMSNRButton
            app.CRLBFWHMSNRButton = uibutton(app.Panel2, 'push');
            app.CRLBFWHMSNRButton.ButtonPushedFcn = createCallbackFcn(app, @CRLBFWHMSNRButtonPushed, true);
            app.CRLBFWHMSNRButton.FontSize = 20;
            app.CRLBFWHMSNRButton.Position = [11 403 188 33];
            app.CRLBFWHMSNRButton.Text = 'CRLB FWHM SNR ';

            % Create SpectralqualityButton
            app.SpectralqualityButton = uibutton(app.Panel2, 'push');
            app.SpectralqualityButton.ButtonPushedFcn = createCallbackFcn(app, @SpectralqualityButtonPushed, true);
            app.SpectralqualityButton.FontSize = 20;
            app.SpectralqualityButton.Position = [8 358 194 33];
            app.SpectralqualityButton.Text = 'Spectral quality';

            % Create MetabolitemapsButton
            app.MetabolitemapsButton = uibutton(app.Panel2, 'push');
            app.MetabolitemapsButton.ButtonPushedFcn = createCallbackFcn(app, @MetabolitemapsButtonPushed, true);
            app.MetabolitemapsButton.FontSize = 20;
            app.MetabolitemapsButton.Position = [8 313 194 33];
            app.MetabolitemapsButton.Text = 'Metabolite maps';

            % Create RegistrationButton
            app.RegistrationButton = uibutton(app.Panel2, 'push');
            app.RegistrationButton.ButtonPushedFcn = createCallbackFcn(app, @RegistrationButtonPushed, true);
            app.RegistrationButton.FontSize = 20;
            app.RegistrationButton.Position = [8 268 194 33];
            app.RegistrationButton.Text = 'Registration';

            % Create ROIAnalyzeButton
            app.ROIAnalyzeButton = uibutton(app.Panel2, 'push');
            app.ROIAnalyzeButton.ButtonPushedFcn = createCallbackFcn(app, @ROIAnalyzeButtonPushed, true);
            app.ROIAnalyzeButton.FontSize = 20;
            app.ROIAnalyzeButton.Position = [8 223 194 33];
            app.ROIAnalyzeButton.Text = 'ROI Analyze';

            % Create github
            app.github = uiimage(app.Panel2);
            app.github.ImageClickedFcn = createCallbackFcn(app, @githubImageClicked, true);
            app.github.Position = [68 49 68 55];
            app.github.ImageSource = 'GitHub-Mark-64px.png';

            % Create ExitButton
            app.ExitButton = uibutton(app.Panel2, 'push');
            app.ExitButton.ButtonPushedFcn = createCallbackFcn(app, @ExitButtonPushed, true);
            app.ExitButton.FontSize = 20;
            app.ExitButton.Position = [8 133 194 33];
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

            % Create Slider
            app.Slider = uislider(app.Panel2);
            app.Slider.Limits = [1 3];
            app.Slider.MajorTicks = [1 2 3];
            app.Slider.MajorTickLabels = {'1', '2', '3'};
            app.Slider.ValueChangedFcn = createCallbackFcn(app, @SliderValueChanged, true);
            app.Slider.MinorTicks = [1 2 3];
            app.Slider.Visible = 'off';
            app.Slider.FontSize = 14;
            app.Slider.Position = [683 31 199 3];
            app.Slider.Value = 1;

            % Create SliceNumberLabel
            app.SliceNumberLabel = uilabel(app.Panel2);
            app.SliceNumberLabel.FontSize = 14;
            app.SliceNumberLabel.Visible = 'off';
            app.SliceNumberLabel.Position = [730 28 127 26];
            app.SliceNumberLabel.Text = 'Slice Number';

            % Create pubmed
            app.pubmed = uiimage(app.Panel2);
            app.pubmed.ImageClickedFcn = createCallbackFcn(app, @pubmedImageClicked, true);
            app.pubmed.Position = [66 103 73 30];
            app.pubmed.ImageSource = 'PubMed.png';

            % Create Panel_2
            app.Panel_2 = uipanel(app.Panel2);
            app.Panel_2.BorderType = 'none';
            app.Panel_2.Position = [211 666 345 86];

            % Create XminEditFieldLabel
            app.XminEditFieldLabel = uilabel(app.Panel_2);
            app.XminEditFieldLabel.HorizontalAlignment = 'right';
            app.XminEditFieldLabel.Position = [33 47 35 22];
            app.XminEditFieldLabel.Text = 'Xmin';

            % Create XminEditField
            app.XminEditField = uieditfield(app.Panel_2, 'numeric');
            app.XminEditField.Limits = [1 1024];
            app.XminEditField.Position = [83 47 51 22];
            app.XminEditField.Value = 532;

            % Create XmaxEditFieldLabel
            app.XmaxEditFieldLabel = uilabel(app.Panel_2);
            app.XmaxEditFieldLabel.HorizontalAlignment = 'right';
            app.XmaxEditFieldLabel.Position = [2 8 68 22];
            app.XmaxEditFieldLabel.Text = 'Xmax';

            % Create XmaxEditField
            app.XmaxEditField = uieditfield(app.Panel_2, 'numeric');
            app.XmaxEditField.Limits = [1 1024];
            app.XmaxEditField.Position = [82 8 51 22];
            app.XmaxEditField.Value = 800;

            % Create YminEditFieldLabel
            app.YminEditFieldLabel = uilabel(app.Panel_2);
            app.YminEditFieldLabel.HorizontalAlignment = 'right';
            app.YminEditFieldLabel.Position = [133 45 33 22];
            app.YminEditFieldLabel.Text = 'Ymin';

            % Create YminEditField
            app.YminEditField = uieditfield(app.Panel_2, 'numeric');
            app.YminEditField.Position = [182 45 51 22];
            app.YminEditField.Value = -5000;

            % Create YmaxEditFieldLabel
            app.YmaxEditFieldLabel = uilabel(app.Panel_2);
            app.YmaxEditFieldLabel.HorizontalAlignment = 'right';
            app.YmaxEditFieldLabel.Position = [137 8 34 22];
            app.YmaxEditFieldLabel.Text = 'Ymax';

            % Create YmaxEditField
            app.YmaxEditField = uieditfield(app.Panel_2, 'numeric');
            app.YmaxEditField.Position = [182 8 51 22];
            app.YmaxEditField.Value = 10000;

            % Create AdjustPlotButton
            app.AdjustPlotButton = uibutton(app.Panel_2, 'push');
            app.AdjustPlotButton.ButtonPushedFcn = createCallbackFcn(app, @AdjustPlotButtonPushed, true);
            app.AdjustPlotButton.Position = [242 29 98 24];
            app.AdjustPlotButton.Text = 'Adjust Plot';

            % Create ROIatlasDropDown
            app.ROIatlasDropDown = uidropdown(app.Panel2);
            app.ROIatlasDropDown.Items = {'Schaefer2018_100Parcels_7Networks_2mm', 'Schaefer2018_400Parcels_7Networks_2mm', 'MNI_thr0_2mm', 'MNI_thr25_2mm', 'MNI_thr50_2mm'};
            app.ROIatlasDropDown.ValueChangedFcn = createCallbackFcn(app, @ROIatlasDropDownValueChanged, true);
            app.ROIatlasDropDown.Position = [900 726 405 22];
            app.ROIatlasDropDown.Value = 'MNI_thr25_2mm';

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
            app.RegionNetworkExclusionEditField.Value = 5;

            % Create ROIAtlasLabel
            app.ROIAtlasLabel = uilabel(app.Panel2);
            app.ROIAtlasLabel.Position = [835 726 56 22];
            app.ROIAtlasLabel.Text = 'ROI Atlas';

            % Create DataButtonGroup
            app.DataButtonGroup = uibuttongroup(app.Panel2);
            app.DataButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @DataButtonGroupSelectionChanged, true);
            app.DataButtonGroup.TitlePosition = 'centertop';
            app.DataButtonGroup.Title = 'Data';
            app.DataButtonGroup.FontSize = 20;
            app.DataButtonGroup.Position = [970 661 123 99];

            % Create RealButton
            app.RealButton = uiradiobutton(app.DataButtonGroup);
            app.RealButton.Text = 'Real';
            app.RealButton.FontSize = 20;
            app.RealButton.Position = [11 41 62 24];
            app.RealButton.Value = true;

            % Create ImagButton
            app.ImagButton = uiradiobutton(app.DataButtonGroup);
            app.ImagButton.Text = 'Imag';
            app.ImagButton.FontSize = 20;
            app.ImagButton.Position = [11 22 66 24];

            % Create AbsButton
            app.AbsButton = uiradiobutton(app.DataButtonGroup);
            app.AbsButton.Text = 'Abs';
            app.AbsButton.FontSize = 20;
            app.AbsButton.Position = [11 1 57 24];

            % Create Image
            app.Image = uiimage(app.Panel2);
            app.Image.ImageClickedFcn = createCallbackFcn(app, @ImageClicked, true);
            app.Image.Position = [70 -9 67 68];
            app.Image.ImageSource = 'youtube.png';

            % Create BackButton
            app.BackButton = uibutton(app.Panel2, 'push');
            app.BackButton.ButtonPushedFcn = createCallbackFcn(app, @BackButtonPushed, true);
            app.BackButton.FontSize = 20;
            app.BackButton.Position = [8 583 194 33];
            app.BackButton.Text = 'Back';

            % Create DistributionsButton
            app.DistributionsButton = uibutton(app.Panel2, 'push');
            app.DistributionsButton.ButtonPushedFcn = createCallbackFcn(app, @DistributionsButtonPushed, true);
            app.DistributionsButton.FontSize = 20;
            app.DistributionsButton.Position = [8 178 194 33];
            app.DistributionsButton.Text = 'Distributions';

            % Create Panel
            app.Panel = uipanel(app.Panel2);
            app.Panel.Position = [215 58 1149 562];

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
            app.meantable.Position = [0 12 1146 508];

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

            % Create WhichMetaboliteButtonGroup
            app.WhichMetaboliteButtonGroup = uibuttongroup(app.Panel);
            app.WhichMetaboliteButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @WhichMetaboliteButtonGroupSelectionChanged, true);
            app.WhichMetaboliteButtonGroup.TitlePosition = 'centertop';
            app.WhichMetaboliteButtonGroup.Title = 'Which Metabolite?';
            app.WhichMetaboliteButtonGroup.Position = [1 335 118 226];

            % Create CrPCrButton
            app.CrPCrButton = uiradiobutton(app.WhichMetaboliteButtonGroup);
            app.CrPCrButton.Text = 'Cr+PCr';
            app.CrPCrButton.Position = [11 180 62 22];

            % Create GluGlnButton
            app.GluGlnButton = uiradiobutton(app.WhichMetaboliteButtonGroup);
            app.GluGlnButton.Text = 'Glu+Gln';
            app.GluGlnButton.Position = [11 160 66 22];

            % Create GPCPChButton
            app.GPCPChButton = uiradiobutton(app.WhichMetaboliteButtonGroup);
            app.GPCPChButton.Text = 'GPC+PCh';
            app.GPCPChButton.Position = [11 140 78 22];

            % Create InsButton
            app.InsButton = uiradiobutton(app.WhichMetaboliteButtonGroup);
            app.InsButton.Text = 'Ins';
            app.InsButton.Position = [11 120 38 22];

            % Create LacButton
            app.LacButton = uiradiobutton(app.WhichMetaboliteButtonGroup);
            app.LacButton.Text = 'Lac';
            app.LacButton.Position = [11 100 42 22];

            % Create Lip13aButton
            app.Lip13aButton = uiradiobutton(app.WhichMetaboliteButtonGroup);
            app.Lip13aButton.Text = 'Lip13a';
            app.Lip13aButton.Position = [11 80 58 22];

            % Create Lip13bButton
            app.Lip13bButton = uiradiobutton(app.WhichMetaboliteButtonGroup);
            app.Lip13bButton.Text = 'Lip13b';
            app.Lip13bButton.Position = [11 60 59 22];

            % Create Lip13aLip13bButton
            app.Lip13aLip13bButton = uiradiobutton(app.WhichMetaboliteButtonGroup);
            app.Lip13aLip13bButton.Text = 'Lip13a+Lip13b';
            app.Lip13aLip13bButton.Position = [11 40 102 22];

            % Create NAANAAGButton
            app.NAANAAGButton = uiradiobutton(app.WhichMetaboliteButtonGroup);
            app.NAANAAGButton.Text = 'NAA+NAAG';
            app.NAANAAGButton.Position = [11 20 87 22];
            app.NAANAAGButton.Value = true;

            % Create UserdefinedmetaboliteButton
            app.UserdefinedmetaboliteButton = uiradiobutton(app.WhichMetaboliteButtonGroup);
            app.UserdefinedmetaboliteButton.Text = 'Other';
            app.UserdefinedmetaboliteButton.Position = [11 2 52 22];

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

            % Create EditSpectralquality
            app.EditSpectralquality = uibutton(app.Panel, 'push');
            app.EditSpectralquality.ButtonPushedFcn = createCallbackFcn(app, @EditSpectralqualityButtonPushed, true);
            app.EditSpectralquality.Position = [548 536 125 22];
            app.EditSpectralquality.Text = 'Edit Spectral Quality';

            % Create RegionNameDropDownLabel
            app.RegionNameDropDownLabel = uilabel(app.Panel);
            app.RegionNameDropDownLabel.HorizontalAlignment = 'right';
            app.RegionNameDropDownLabel.Position = [6 306 78 22];
            app.RegionNameDropDownLabel.Text = 'Region Name';

            % Create RegionNameDropDown
            app.RegionNameDropDown = uidropdown(app.Panel);
            app.RegionNameDropDown.Items = {'Region 1', 'Region 2', 'Region 3', 'Region 4', ''};
            app.RegionNameDropDown.ValueChangedFcn = createCallbackFcn(app, @RegionNameDropDownValueChanged, true);
            app.RegionNameDropDown.Position = [99 306 100 22];
            app.RegionNameDropDown.Value = 'Region 1';

            % Create AdjustrangeButton
            app.AdjustrangeButton = uibutton(app.Panel, 'push');
            app.AdjustrangeButton.ButtonPushedFcn = createCallbackFcn(app, @AdjustrangeButtonPushed, true);
            app.AdjustrangeButton.Position = [1044 390 100 22];
            app.AdjustrangeButton.Text = 'Adjust range';

            % Create MinEditFieldLabel
            app.MinEditFieldLabel = uilabel(app.Panel);
            app.MinEditFieldLabel.HorizontalAlignment = 'right';
            app.MinEditFieldLabel.Position = [1054 442 25 22];
            app.MinEditFieldLabel.Text = 'Min';

            % Create MinEditField
            app.MinEditField = uieditfield(app.Panel, 'numeric');
            app.MinEditField.ValueChangedFcn = createCallbackFcn(app, @MinEditFieldValueChanged, true);
            app.MinEditField.Position = [1086 442 55 22];
            app.MinEditField.Value = 20;

            % Create MaxEditFieldLabel
            app.MaxEditFieldLabel = uilabel(app.Panel);
            app.MaxEditFieldLabel.HorizontalAlignment = 'right';
            app.MaxEditFieldLabel.Position = [1053 416 29 22];
            app.MaxEditFieldLabel.Text = 'Max';

            % Create MaxEditField
            app.MaxEditField = uieditfield(app.Panel, 'numeric');
            app.MaxEditField.ValueChangedFcn = createCallbackFcn(app, @MaxEditFieldValueChanged, true);
            app.MaxEditField.Position = [1086 416 55 22];
            app.MaxEditField.Value = 100;

            % Create MinEditField_2Label
            app.MinEditField_2Label = uilabel(app.Panel);
            app.MinEditField_2Label.HorizontalAlignment = 'right';
            app.MinEditField_2Label.Position = [1052 289 25 22];
            app.MinEditField_2Label.Text = 'Min';

            % Create MinEditField_2
            app.MinEditField_2 = uieditfield(app.Panel, 'numeric');
            app.MinEditField_2.Position = [1086 289 55 22];

            % Create MaxEditField_2Label
            app.MaxEditField_2Label = uilabel(app.Panel);
            app.MaxEditField_2Label.HorizontalAlignment = 'right';
            app.MaxEditField_2Label.Position = [1053 264 29 22];
            app.MaxEditField_2Label.Text = 'Max';

            % Create MaxEditField_2
            app.MaxEditField_2 = uieditfield(app.Panel, 'numeric');
            app.MaxEditField_2.Position = [1086 264 55 22];
            app.MaxEditField_2.Value = 0.1;

            % Create AdjustrangeButton_2
            app.AdjustrangeButton_2 = uibutton(app.Panel, 'push');
            app.AdjustrangeButton_2.ButtonPushedFcn = createCallbackFcn(app, @AdjustrangeButton_2Pushed, true);
            app.AdjustrangeButton_2.Position = [1044 238 100 22];
            app.AdjustrangeButton_2.Text = 'Adjust range';

            % Create MinEditField_3Label
            app.MinEditField_3Label = uilabel(app.Panel);
            app.MinEditField_3Label.HorizontalAlignment = 'right';
            app.MinEditField_3Label.Position = [1053 141 25 22];
            app.MinEditField_3Label.Text = 'Min';

            % Create MinEditField_3
            app.MinEditField_3 = uieditfield(app.Panel, 'numeric');
            app.MinEditField_3.Position = [1087 141 55 22];

            % Create MaxEditField_3Label
            app.MaxEditField_3Label = uilabel(app.Panel);
            app.MaxEditField_3Label.HorizontalAlignment = 'right';
            app.MaxEditField_3Label.Position = [1054 116 29 22];
            app.MaxEditField_3Label.Text = 'Max';

            % Create MaxEditField_3
            app.MaxEditField_3 = uieditfield(app.Panel, 'numeric');
            app.MaxEditField_3.Position = [1087 116 55 22];
            app.MaxEditField_3.Value = 30;

            % Create AdjustrangeButton_3
            app.AdjustrangeButton_3 = uibutton(app.Panel, 'push');
            app.AdjustrangeButton_3.ButtonPushedFcn = createCallbackFcn(app, @AdjustrangeButton_3Pushed, true);
            app.AdjustrangeButton_3.Position = [1043 90 100 22];
            app.AdjustrangeButton_3.Text = 'Adjust range';

            % Create ALabel
            app.ALabel = uilabel(app.Panel);
            app.ALabel.Position = [150 5 25 22];
            app.ALabel.Text = 'A';

            % Create PLabel
            app.PLabel = uilabel(app.Panel);
            app.PLabel.Position = [313 5 25 22];
            app.PLabel.Text = 'P';

            % Create RLabel
            app.RLabel = uilabel(app.Panel);
            app.RLabel.Position = [345 5 25 22];
            app.RLabel.Text = 'R';

            % Create axialrl
            app.axialrl = uislider(app.Panel);
            app.axialrl.MajorTicks = [];
            app.axialrl.MajorTickLabels = {''};
            app.axialrl.ValueChangedFcn = createCallbackFcn(app, @axialrlValueChanged4, true);
            app.axialrl.MinorTicks = [];
            app.axialrl.Position = [354 14 150 3];
            app.axialrl.Value = 66;

            % Create LLabel
            app.LLabel = uilabel(app.Panel);
            app.LLabel.Position = [509 4 25 22];
            app.LLabel.Text = 'L';

            % Create SLabel
            app.SLabel = uilabel(app.Panel);
            app.SLabel.Position = [542 4 25 22];
            app.SLabel.Text = 'S';

            % Create coronalsi
            app.coronalsi = uislider(app.Panel);
            app.coronalsi.MajorTicks = [];
            app.coronalsi.MajorTickLabels = {''};
            app.coronalsi.ValueChangedFcn = createCallbackFcn(app, @coronalsiValueChanged, true);
            app.coronalsi.MinorTicks = [];
            app.coronalsi.Position = [551 14 150 3];
            app.coronalsi.Value = 68;

            % Create ILabel
            app.ILabel = uilabel(app.Panel);
            app.ILabel.Position = [706 4 25 22];
            app.ILabel.Text = 'I';

            % Create axialap
            app.axialap = uislider(app.Panel);
            app.axialap.MajorTicks = [];
            app.axialap.MajorTickLabels = {''};
            app.axialap.ValueChangedFcn = createCallbackFcn(app, @axialapValueChanged, true);
            app.axialap.MinorTicks = [];
            app.axialap.Position = [159 14 150 3];
            app.axialap.Value = 71;

            % Create Panel1
            app.Panel1 = uipanel(app.UIFigure);
            app.Panel1.ForegroundColor = [0.8 0.8 0.8];
            app.Panel1.BorderType = 'none';
            app.Panel1.TitlePosition = 'centertop';
            app.Panel1.Title = 'ORYX MRSI';
            app.Panel1.SizeChangedFcn = createCallbackFcn(app, @Panel1SizeChanged, true);
            app.Panel1.FontWeight = 'bold';
            app.Panel1.FontSize = 20;
            app.Panel1.Position = [1 1 1400 800];

            % Create MetaboliteMapListppmButtonGroup
            app.MetaboliteMapListppmButtonGroup = uibuttongroup(app.Panel1);
            app.MetaboliteMapListppmButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @MetaboliteMapListppmButtonGroupSelectionChanged, true);
            app.MetaboliteMapListppmButtonGroup.TitlePosition = 'centertop';
            app.MetaboliteMapListppmButtonGroup.Title = 'Metabolite Map List (ppm)';
            app.MetaboliteMapListppmButtonGroup.FontSize = 18;
            app.MetaboliteMapListppmButtonGroup.Position = [89 104 240 256];

            % Create UserdefinedmapButton
            app.UserdefinedmapButton = uiradiobutton(app.MetaboliteMapListppmButtonGroup);
            app.UserdefinedmapButton.Text = 'User defined map';
            app.UserdefinedmapButton.FontSize = 16;
            app.UserdefinedmapButton.Position = [9 25 149 22];

            % Create NameEditFieldLabel
            app.NameEditFieldLabel = uilabel(app.MetaboliteMapListppmButtonGroup);
            app.NameEditFieldLabel.HorizontalAlignment = 'right';
            app.NameEditFieldLabel.FontColor = [0.502 0.502 0.502];
            app.NameEditFieldLabel.Position = [15 4 37 22];
            app.NameEditFieldLabel.Text = 'Name';

            % Create userdefmapname
            app.userdefmapname = uieditfield(app.MetaboliteMapListppmButtonGroup, 'text');
            app.userdefmapname.Position = [58 4 79 22];
            app.userdefmapname.Value = 'Ala';

            % Create userdefmapppm
            app.userdefmapppm = uieditfield(app.MetaboliteMapListppmButtonGroup, 'numeric');
            app.userdefmapppm.Position = [146 4 75 22];
            app.userdefmapppm.Value = 3.8;

            % Create crppm
            app.crppm = uieditfield(app.MetaboliteMapListppmButtonGroup, 'numeric');
            app.crppm.Position = [145 201 75 25];
            app.crppm.Value = 3.03;

            % Create gluglnppm
            app.gluglnppm = uieditfield(app.MetaboliteMapListppmButtonGroup, 'numeric');
            app.gluglnppm.Position = [145 179 75 25];
            app.gluglnppm.Value = 2.25;

            % Create insppm
            app.insppm = uieditfield(app.MetaboliteMapListppmButtonGroup, 'numeric');
            app.insppm.Position = [145 136 75 25];
            app.insppm.Value = 3.52;

            % Create lacppm
            app.lacppm = uieditfield(app.MetaboliteMapListppmButtonGroup, 'numeric');
            app.lacppm.Position = [145 112 75 25];
            app.lacppm.Value = 1.3;

            % Create lipppm
            app.lipppm = uieditfield(app.MetaboliteMapListppmButtonGroup, 'numeric');
            app.lipppm.Position = [145 88 75 25];
            app.lipppm.Value = 1.3;

            % Create naappm
            app.naappm = uieditfield(app.MetaboliteMapListppmButtonGroup, 'numeric');
            app.naappm.Position = [145 64 75 25];
            app.naappm.Value = 2.02;

            % Create choppm
            app.choppm = uieditfield(app.MetaboliteMapListppmButtonGroup, 'numeric');
            app.choppm.Position = [145 157 75 25];
            app.choppm.Value = 3.2;

            % Create PredefinedmapsAboveButton
            app.PredefinedmapsAboveButton = uiradiobutton(app.MetaboliteMapListppmButtonGroup);
            app.PredefinedmapsAboveButton.Text = 'Pre-defined maps (Above)';
            app.PredefinedmapsAboveButton.FontSize = 16;
            app.PredefinedmapsAboveButton.Position = [8 44 209 22];
            app.PredefinedmapsAboveButton.Value = true;

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
            app.SelectaSPARfileButton.Text = 'Select an SPAR / a NIfTI-MRS file';

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
            app.ReferenceMetabolite.Title = 'Reference (Plan Scan) Metabolite ';
            app.ReferenceMetabolite.FontSize = 18;
            app.ReferenceMetabolite.Position = [328 104 297 256];

            % Create H2OButton
            app.H2OButton = uiradiobutton(app.ReferenceMetabolite);
            app.H2OButton.Text = 'H2O';
            app.H2OButton.FontSize = 16;
            app.H2OButton.Position = [25 202 55 22];

            % Create NAAButton
            app.NAAButton = uiradiobutton(app.ReferenceMetabolite);
            app.NAAButton.Text = 'NAA';
            app.NAAButton.FontSize = 16;
            app.NAAButton.Position = [25 175 65 24];
            app.NAAButton.Value = true;

            % Create CrButton
            app.CrButton = uiradiobutton(app.ReferenceMetabolite);
            app.CrButton.Text = 'Cr';
            app.CrButton.FontSize = 16;
            app.CrButton.Position = [25 151 65 23];

            % Create ChoButton
            app.ChoButton = uiradiobutton(app.ReferenceMetabolite);
            app.ChoButton.Text = 'Cho';
            app.ChoButton.FontSize = 16;
            app.ChoButton.Position = [25 126 59 23];

            % Create LacLipButton
            app.LacLipButton = uiradiobutton(app.ReferenceMetabolite);
            app.LacLipButton.Text = 'Lac/Lip';
            app.LacLipButton.FontSize = 16;
            app.LacLipButton.Position = [25 99 88 23];

            % Create Userdefrefmet
            app.Userdefrefmet = uiradiobutton(app.ReferenceMetabolite);
            app.Userdefrefmet.Text = 'User defined reference metabolite';
            app.Userdefrefmet.FontSize = 16;
            app.Userdefrefmet.Position = [24 73 267 22];

            % Create NameEditField_2Label
            app.NameEditField_2Label = uilabel(app.ReferenceMetabolite);
            app.NameEditField_2Label.HorizontalAlignment = 'right';
            app.NameEditField_2Label.FontColor = [0.502 0.502 0.502];
            app.NameEditField_2Label.Position = [26 44 37 22];
            app.NameEditField_2Label.Text = 'Name';

            % Create refmetname
            app.refmetname = uieditfield(app.ReferenceMetabolite, 'text');
            app.refmetname.Position = [69 44 62 22];

            % Create ppmEditFieldLabel
            app.ppmEditFieldLabel = uilabel(app.ReferenceMetabolite);
            app.ppmEditFieldLabel.HorizontalAlignment = 'right';
            app.ppmEditFieldLabel.FontColor = [0.502 0.502 0.502];
            app.ppmEditFieldLabel.Position = [137 45 30 22];
            app.ppmEditFieldLabel.Text = 'ppm';

            % Create refmetppm
            app.refmetppm = uieditfield(app.ReferenceMetabolite, 'numeric');
            app.refmetppm.Position = [174 45 75 22];

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

            % Create CrTextAreaLabel
            app.CrTextAreaLabel = uilabel(app.Panel1);
            app.CrTextAreaLabel.FontSize = 16;
            app.CrTextAreaLabel.Position = [98 309 25 22];
            app.CrTextAreaLabel.Text = 'Cr';

            % Create CrTextArea
            app.CrTextArea = uitextarea(app.Panel1);
            app.CrTextArea.Editable = 'off';
            app.CrTextArea.HorizontalAlignment = 'right';
            app.CrTextArea.BackgroundColor = [0.9412 0.9412 0.9412];
            app.CrTextArea.Enable = 'off';
            app.CrTextArea.Visible = 'off';
            app.CrTextArea.Position = [236 306 10 25];

            % Create GluGlnTextAreaLabel
            app.GluGlnTextAreaLabel = uilabel(app.Panel1);
            app.GluGlnTextAreaLabel.FontSize = 16;
            app.GluGlnTextAreaLabel.Position = [98 287 69 22];
            app.GluGlnTextAreaLabel.Text = 'Glu+Gln ';

            % Create GluGlnTextArea
            app.GluGlnTextArea = uitextarea(app.Panel1);
            app.GluGlnTextArea.Editable = 'off';
            app.GluGlnTextArea.HorizontalAlignment = 'right';
            app.GluGlnTextArea.Enable = 'off';
            app.GluGlnTextArea.Visible = 'off';
            app.GluGlnTextArea.Position = [236 284 10 25];

            % Create InsTextAreaLabel
            app.InsTextAreaLabel = uilabel(app.Panel1);
            app.InsTextAreaLabel.FontSize = 16;
            app.InsTextAreaLabel.Position = [98 241 27 22];
            app.InsTextAreaLabel.Text = 'Ins';

            % Create InsTextArea
            app.InsTextArea = uitextarea(app.Panel1);
            app.InsTextArea.Editable = 'off';
            app.InsTextArea.HorizontalAlignment = 'right';
            app.InsTextArea.Enable = 'off';
            app.InsTextArea.Visible = 'off';
            app.InsTextArea.Position = [236 238 10 25];

            % Create LacTextAreaLabel
            app.LacTextAreaLabel = uilabel(app.Panel1);
            app.LacTextAreaLabel.FontSize = 16;
            app.LacTextAreaLabel.Position = [98 217 32 22];
            app.LacTextAreaLabel.Text = 'Lac';

            % Create LacTextArea
            app.LacTextArea = uitextarea(app.Panel1);
            app.LacTextArea.Editable = 'off';
            app.LacTextArea.HorizontalAlignment = 'right';
            app.LacTextArea.Enable = 'off';
            app.LacTextArea.Visible = 'off';
            app.LacTextArea.Position = [236 214 10 25];

            % Create LipTextAreaLabel
            app.LipTextAreaLabel = uilabel(app.Panel1);
            app.LipTextAreaLabel.FontSize = 16;
            app.LipTextAreaLabel.Position = [98 193 27 22];
            app.LipTextAreaLabel.Text = 'Lip';

            % Create LipTextArea
            app.LipTextArea = uitextarea(app.Panel1);
            app.LipTextArea.Editable = 'off';
            app.LipTextArea.HorizontalAlignment = 'right';
            app.LipTextArea.Enable = 'off';
            app.LipTextArea.Visible = 'off';
            app.LipTextArea.Position = [236 190 10 25];

            % Create NAATextAreaLabel
            app.NAATextAreaLabel = uilabel(app.Panel1);
            app.NAATextAreaLabel.FontSize = 16;
            app.NAATextAreaLabel.Position = [98 169 38 22];
            app.NAATextAreaLabel.Text = 'NAA';

            % Create NAATextArea
            app.NAATextArea = uitextarea(app.Panel1);
            app.NAATextArea.Editable = 'off';
            app.NAATextArea.HorizontalAlignment = 'right';
            app.NAATextArea.Enable = 'off';
            app.NAATextArea.Visible = 'off';
            app.NAATextArea.Position = [236 166 10 25];

            % Create NotesTextArea
            app.NotesTextArea = uitextarea(app.Panel1);
            app.NotesTextArea.ValueChangedFcn = createCallbackFcn(app, @CRLBEditFieldValueChanged, true);
            app.NotesTextArea.FontSize = 20;
            app.NotesTextArea.Position = [88 45 1218 60];
            app.NotesTextArea.Value = {'- Data imaging system Left, Posterior, Superior (LPS)   '; '- The current version of the code only calculates the directions for transverse slice orientation and 3D scan mode.'};

            % Create ChoTextAreaLabel
            app.ChoTextAreaLabel = uilabel(app.Panel1);
            app.ChoTextAreaLabel.FontSize = 16;
            app.ChoTextAreaLabel.Position = [98 264 35 22];
            app.ChoTextAreaLabel.Text = 'Cho';

            % Create ChoTextArea
            app.ChoTextArea = uitextarea(app.Panel1);
            app.ChoTextArea.Editable = 'off';
            app.ChoTextArea.HorizontalAlignment = 'right';
            app.ChoTextArea.Enable = 'off';
            app.ChoTextArea.Visible = 'off';
            app.ChoTextArea.Position = [236 261 10 25];

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