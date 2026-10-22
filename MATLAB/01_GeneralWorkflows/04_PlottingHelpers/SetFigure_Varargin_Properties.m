function [  ] = SetFigure_Varargin_Properties( varargin )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% later return width/height etc
% 
% % get(gcf,'Font')
% fontsize(fontsize_i,"points")



while(length(varargin)==1) %multiple unpacks if needed
   varargin = varargin{1,:};               
end

optIndex = find(strcmpi('colour_list',varargin));
if optIndex > 0
    colour_list = varargin{optIndex+1};
else
    colour_list = hsv(3);
end

optIndex = find(strcmpi('ReduceFigurePadding',varargin));
if optIndex > 0
    ReduceFigurePadding_t = varargin{optIndex+1};
else
    ReduceFigurePadding_t = nan;
end

optIndex = find(strcmpi('LineAlpha',varargin));
if optIndex > 0
    LineAlpha_t = varargin{optIndex+1};
else
    LineAlpha_t = 1;
end

optIndex = find(strcmpi('LineWidth',varargin));
if optIndex > 0
    LineWidth_t = varargin{optIndex+1};
else
    LineWidth_t = 1;
end


optIndex = find(strcmpi('Font1',varargin));
if optIndex > 0
    fontsize(varargin{optIndex+1},"points")
end


optIndex = find(strcmpi('FigurePosition',varargin));
if optIndex > 0
    set(gcf, 'Position', varargin{optIndex+1});
end
optIndex = find(strcmpi('FigPosition',varargin));
if optIndex > 0
    error('Replace to FigPosition-->FigurePosition')
end

optIndex = find(strcmpi('xlim',varargin));
if optIndex > 0
    xlim( [ varargin{optIndex+1} ] );
end

optIndex = find(strcmpi('ylim',varargin));
if optIndex > 0
    ylim( [ varargin{optIndex+1} ] );
end

optIndex = find(strcmpi('zlim',varargin));
if optIndex > 0
    zlim( [ varargin{optIndex+1} ] );
end



optIndex = find(strcmpi('view',varargin));
if optIndex > 0
    view_t = varargin{optIndex+1};
    if(~isscalar(view_t))
        view(view_t)
    end
end

optIndex = find(strcmpi('xlabel',varargin));
if optIndex > 0
    val = varargin{optIndex+1};
    if(~isstring(val))
        xlabel(val)
    end
end

optIndex = find(strcmpi('ylabel',varargin));
if optIndex > 0
    val = varargin{optIndex+1};
    if(~isstring(val))
        ylabel(val)
    end
end

optIndex = find(strcmpi('zlabel',varargin));
if optIndex > 0
    val = varargin{optIndex+1};
    if(~isstring(val))
        zlabel(val)
    end
end


optIndex = find(strcmpi('yticks',varargin));
if optIndex > 0
    yticks( varargin{optIndex+1} );
end


optIndex = find(strcmpi('yticklabels',varargin));
if optIndex > 0
    yticklabels( varargin{optIndex+1} );
end


% [X, Y] length
optIndex = find(strcmpi('HLine',varargin));
if optIndex > 0
    vals = varargin{optIndex+1};
    x_len = vals(1);
    y_len = vals(2);

    % [xaf,yaf] = ds2nfu(30,-120);
    % htmp =  annotation('textbox','Position',[xaf yaf 0 0], 'FitBoxToText','on','EdgeColor',[1 1 1 0],'String','Receiver Threshold','Interpreter', 'latex'); %htmp.FontSize = 10; htmp.FontName = 'Times New Roman';%[x y length height]
    line('XData', [0 x_len], 'YData', [y_len y_len], 'LineStyle', '-', 'LineWidth', 1, 'Color','k')

end


optIndex = find(strcmpi('FigureBackgroundColour',varargin));
if optIndex > 0
    SetFigure_Colour_Background ( varargin{optIndex+1} );
end



end

