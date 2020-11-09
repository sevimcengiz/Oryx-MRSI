function [P_subplot,P_fig,P_colorbar,imode_axis] = ...
    subplot_position(x_wide,y_wide,x_num,y_num,flag_colorbar,x_gap,y_gap,c_gap,c_wide,x_border,y_border)
% SUBPLOT_POSITION Calculate position of subplot axis
%   [P_SUBPLOT,P_FIG] = SUBPLOT_POSITION(X_WIDE,Y_WIDE,X_NUM,Y_NUM,FLAG_COLORBAR)
%     x_wide, y_wide are width of x and y direction, in pixels
%     x_num, y_num are number of figs in one row and column
%     flag_colorbar(optional): 0 without colorbar, 1 with X-direction 
%     colorbar, 2 with Y-direction colorbar, 3 with X-dir bar separated, 
%     4 with Y-dir bar separated.
%     P_subplot is a cell array of the sub figure positions, used in
%     subplot('position',P_subplot{II}), II is
%
%      --------------------------
%      |   1   |   2   |   3   |
%      --------------------------
%      |   4   |   5   |   6   |
%      --------------------------
%
%     P_fig is the total width of big figure in pixels
%     figure('Position',P_fig)
%   [...,P_COLORBAR] = SUBPLOT_POSITION(...)
%     P_colorbar is colorbar position
%     colorbar('Position',P_colorbar)
%     if flag_colorbar = 0, these will be 0 too
%   [...,imode_axis] = SUBPLOT_POSITION(...)
%     imode_axis is a vector of struct saves the mode of x/y labels
%     imode_axis.x = 1 means x label on
%                  = 0 means x label off
%     imode_axis.y = 1 means y label on
%                  = 0 means y label off
%   [...] = SUBPLOT_POSITION(...,X_GAP,Y_GAP,C_GAP,C_WIDE)
%     x_gap, y_gap are gaps between figs, default is 50
%     c_gap is gap between colorbar and fig, default also 50
%     c_wide is width of colorbar, default is 30
%   [...] = SUBPLOT_POSITION(...,X_GAP,Y_GAP,C_GAP,C_WIDE,X_BORDER,Y_BORDER)
%     x_border,y_border are additional gaps at borders, default is 0
%
%  Notice:
%       If you want to make no gap between 2 subplots, make sure the ratio
%       of X_WIDE/Y_WIDE equal to the DataAspectRatio between X and 
%       Y-direction of the certain axis.
%
%  Example 1:
%       [P_subplot,P_fig,P_colorbar] = subplot_position(300,300,2,2,0,5,5,30,30,50,50);
%       figure('Position',P_fig)
%       subplot('position',P_subplot{1})
%       ezplot(@sin,[0,2*pi,-2,2])
%       set(gca,'XTickLabel',[])
%       subplot('position',P_subplot{2})
%       ezplot(@cos,[0,2*pi,-2,2])
%       set(gca,'XTickLabel',[])
%       set(gca,'YTickLabel',[])
%       subplot('position',P_subplot{3})
%       ezplot(@tan,[0,2*pi,-2,2])
%       subplot('position',P_subplot{4})
%       ezplot(@cot,[0,2*pi,-2,2])
%       set(gca,'YTickLabel',[])
%
%  Example 2:
%       [P_subplot,P_fig,P_colorbar,imode_axis] = subplot_position(300,300,3,2,1);
%       figure('Position',P_fig)
%       for ii = 1:6
%         subplot('position',P_subplot{ii})
%         if ~imode_axis(ii).x
%           set(gca,'XTickLabel',[])
%         end
%         if ~imode_axis(ii).y
%           set(gca,'YTickLabel',[])
%         end
%       end
%       colorbar('SouthOutside','Position',P_colorbar)
%
%-----------------------------------------------------
%* Yuheng Wang£¬Tianjin Univercity of Science & Tech *
%*                yuheng.w@gmail.com                 *
%-----------------------------------------------------

% Written in 2011.03.14
% Modified in 2013.08.12
%  + change the format of output for facility
%  + vectorize some loops.
% Modified in 2014.01.15
%  + fix a minor bug, the position of colorbar is wrong in mode 2
% Modified in 2014.03.33
%  + add 2 inputs x_border and y_border
% Modified in 2014.04.15
%  + fix a minor bug, flag_colorbar is optional when nargin==4
% Modified in 2014.12.30
%  + length of colorbar are made shorter and fixed.
% Modified in 2015.12.27
%  + add flag_colorbar = 3 and 4
% Modified in 2016.10.23
%  + add output imode_axis

%% get input arguments
switch nargin
    case 4
        x_gap = 50;
        y_gap = 50;
        c_gap = 50;
        c_wide = 30;
        x_border = 0;
        y_border = 0;
        flag_colorbar = 0;
    case 5
        x_gap = 50;
        y_gap = 50;
        c_gap = 50;
        c_wide = 30;
        x_border = 0;
        y_border = 0;
    case 9
        x_border = 0;
        y_border = 0;
    case 11
        % nothing
    otherwise
        error('WYH:subplot_position:incorrectNumInputArgument','incorret number of input')
end

%% pretreatment
x_start = zeros(1,x_num);
y_start = zeros(1,y_num);

%% calculate variables
switch flag_colorbar
    case 0
        X = x_wide*x_num + x_gap*(x_num+1) + x_border*2; %total width of X-direction in pixels
        Y = y_wide*y_num + y_gap*(y_num+1) + y_border*2; %total width of Y-direction in pixels
        x_width  = x_wide/X;
        y_height = y_wide/Y;
        %         for ii = 1:x_num
        %             x_start(ii) = x_gap + (ii-1)*(x_gap+x_wide);
        %         end
        %         for ii = 1:y_num
        %             y_start(ii) = y_gap + (ii-1)*(y_gap+y_wide);
        %         end
        x_start = x_gap + x_border + (0:x_num-1)*(x_gap+x_wide);
        y_start = y_gap + y_border + (0:y_num-1)*(y_gap+y_wide);
        x_start = x_start/X;
        y_start = y_start/Y;
    case {1,3}
        X = x_wide*x_num + x_gap*(x_num+1) + x_border*2;
        Y = y_wide*y_num + y_gap*(y_num+1) + c_gap + c_wide + y_border*2;
        x_width  = x_wide/X;
        y_height = y_wide/Y;
        x_start = x_gap + x_border + (0:x_num-1)*(x_gap+x_wide);
        y_start = y_gap + y_border + (0:y_num-1)*(y_gap+y_wide) + c_wide + c_gap;
        x_start = x_start/X;
        y_start = y_start/Y;
    case {2,4}
        X = x_wide*x_num + x_gap*(x_num+1) + c_gap + c_wide + x_border*2;
        Y = y_wide*y_num + y_gap*(y_num+1) + y_border*2;
        x_width  = x_wide/X;
        y_height = y_wide/Y;
        x_start = x_gap + x_border + (0:x_num-1)*(x_gap+x_wide);
        y_start = y_gap + y_border + (0:y_num-1)*(y_gap+y_wide);
        x_start = x_start/X;
        y_start = y_start/Y;
end


switch flag_colorbar
    case 0
        cx_start = 0;
        cy_start = 0;
        c_width  = 0;
        c_height = 0;
    case 1
        %cx_start = (x_gap+x_border)/X;
        cx_start = 0.3;
        cy_start = (y_gap+y_border)/Y;
        %c_width  = ( x_wide*x_num + x_gap*(x_num-1) )/X;
        c_width = 0.4;
        c_height = c_wide/Y;
    case 2
        cx_start = ( x_wide*x_num + x_gap*x_num + c_gap + x_border )/X;
        %cy_start = ( y_gap + y_border)/Y;
        cy_start = 0.3;
        c_width  = c_wide/X;
        %c_height = ( y_wide*y_num + y_gap*(y_num-1) )/Y;
        c_height = 0.4;
    case 3
        cx_start = x_start;
        cy_start = (y_gap+y_border)/Y;
        c_width = x_width;
        c_height = c_wide/Y;
    case 4
        cx_start = ( x_wide*x_num + x_gap*x_num + c_gap + x_border )/X;
        %cy_start = ( y_gap + y_border)/Y;
        cy_start = y_start;
        c_width  = c_wide/X;
        %c_height = ( y_wide*y_num + y_gap*(y_num-1) )/Y;
        c_height = y_height;
end

%% new output
% #1
y_start = fliplr(y_start);
[X_start,Y_start] = meshgrid(x_start,y_start);
X_start = X_start';
Y_start = Y_start';
P_subplot = cell(1,x_num*y_num);
for ii = 1:x_num*y_num
    P_subplot{ii} = [X_start(ii),Y_start(ii),x_width,y_height];
end

% #2
P_fig = [1,1,X,Y];

% #3
switch flag_colorbar
    case {0,1,2}
        P_colorbar = [cx_start,cy_start,c_width,c_height];
    case 3
        P_colorbar = cell(1,length(cx_start));
        for ii = 1:length(cx_start)
            P_colorbar{ii} = [cx_start(ii),cy_start,c_width,c_height];
        end
    case 4
        P_colorbar = cell(1,length(cy_start));
        for ii = 1:length(cy_start)
            P_colorbar{ii} = [cx_start,cy_start(length(cy_start)-ii+1),c_width,c_height];
        end
end

% #4
imode_axis0.x = 0;
imode_axis0.y = 0;
imode_axis = repmat(imode_axis0,[x_num*y_num,1]);
[imode_axis(x_num*(y_num-1)+1:x_num*y_num).x] = deal(ones([x_num,1])); % only the bottom line have x label
[imode_axis(1:x_num:x_num*y_num).y] = deal(ones([y_num,1])); % only the left line have y label