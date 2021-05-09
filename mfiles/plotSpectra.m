% This function is written for plotting of the spectra.
% Author: Abdullah Bas, Bogazici University, 2021
function results = plotSpectra(app,i,ppm,linewidth,ax,color,FontSize,varargin)

linewidth=1;
FontSize=8;
pt_axis=0;
ind=1;
list={'In-Vivo','Baseline','Fit','Cr','PCr','GABA','Gln','Glu','GPC','PCh','GSH','Ins',...
    'Lac','NAA','NAAG','Lip13a','Lip13b'};
modplot=4:length(list);
for n=modplot
    
    if n>3
        [out]=io_readlcmcoord(app.coord_filename{i},list{n}); %Graph of the specific metabolite is taken from coordfile(Ex: Only Glu graph from coord file)
        
        if ~isempty(out.specs)
            
            spectra_all(ind,:)=out.specs';
            legendtext{ind}=[ strcat(strjoin(string(list{n})),'-','SD:',num2str(app.tabledata{i}.SDpct(n-3)),'%')];
            a=spectra_all(ind,:)-app.bg{i}.specs';
            b1(ind)=plot(ax,[ppm], [fliplr(a+pt_axis)],'LineWidth',linewidth,"Color",color);
            t=text(ax,ppm(1)*1.01,a(end)+pt_axis, legendtext{ind},"Color",color,"FontSize",FontSize,'VerticalAlignment', 'middle');
            ds=t.FontSize;
            pt_axis=pt_axis-ds;
            ind=ind+1;
            hold (ax,"on");
        else
            legendtext{ind}=[ strcat(strjoin(string(list{n})),'-','SD:',num2str(app.tabledata{i}.SDpct(n-3)),'%')];
            b1(ind)=plot(ax,ppm, ones(size(ppm)).*pt_axis,'LineWidth',linewidth,"Color",color);
            t=text(ax,ppm(1)*1.01,pt_axis, legendtext{ind},"Color",color,"FontSize",FontSize,'VerticalAlignment', 'middle');            
            ds=t.FontSize;            
            pt_axis=pt_axis-ds;
            ind=ind+1;
            hold (ax,"on")
        end
    elseif n<=3
                
        cs={'sp{i}','bg{i}','fit{i}'};
        legends={'\color{white}In Vivo','\color{white}Baseline','\color{white}Fit'};
        x=eval(['app.' cs{n}]);
        b1(ind)=plot(ax,ppm,fliplr(x.specs')+pt_axis,'LineWidth',linewidth,"Color",color);        
        t=text(ax,ppm(1)*1.01,x.specs(end)+pt_axis+FontSize/2, legends{n},"Color",color,"FontSize",FontSize,'VerticalAlignment', 'middle');
        ds=t.FontSize;
        pt_axis=pt_axis-ds;       
        legendtext{ind}=string(legends{n});
        ind=ind+1;
        hold (ax,"on");     
    end   
end
%set(ax,'Color',app.ReportPanel.BackgroundColor);
%             finalt1=strsplit(app.coord_filename{i},filesep);
%             finalt2=strsplit(finalt1{end},'.coord');
%             title(ax,[ finalt2{1,1}]);
set(ax,'ytick',[]);
set(ax,'yticklabel',[ppm(end):ppm(1)]);
set(ax,'XColor',color);
set(ax,'box','off');
%set(ax,'ticklength',[0,0])
ax.XLabel.String="Chemical Shift (ppm)";
%ax.XLabel.Position=[ppm(1)/2,pt_axis*1.05];
set(ax,'xtick',[ppm(end) : 0.5: ppm(1)]);
dsc={'4.0','3.5','3.0' ,'2.5','2.0','1.5','1.0','0.5'};
cx=(dsc);
set(ax,'xticklabel',cx);
xlim(ax,[ppm(end)-0.5,ppm(1)*1.5]);
ylim(ax,[pt_axis*1.1,pt_axis*(-0.1)]);
hold (ax,'off');
set(ax, 'DefaultTextInterpreter', 'none');
end
