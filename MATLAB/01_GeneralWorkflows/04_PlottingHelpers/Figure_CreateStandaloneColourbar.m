function Figure_CreateStandaloneColourbar(varargin)
    % SUMMARY:
    %   Creates a standalone colorbar figure for exporting to presentations.
    %   Supports colormap selection, color limits, tick labels, and orientation.
    %
    % ARGUMENTS (name–value):
    %   'colormap'     - (string/char) Colormap to use (default: 'turbo')
    %   'caxis'        - (1x2 double) Min and max values for color scale (default: [0 1])
    %   'ticks'        - (1xN double) Tick positions; if omitted, auto linspace
    %   'tick_labels'  - (1xN cellstr) Custom tick labels; if omitted, auto from ticks
    %   'tick_format'  - (string) sprintf format for auto labels (e.g., '%.0f')
    %   'label'        - (string/char) Label text for the colorbar (default: '')
    %   'font_size'    - (double) Font size for labels (default: 14)
    %   'orientation'  - (string) 'vertical' or 'horizontal' (default: 'vertical')
    %
    % EXAMPLE:
    %   Figure_CreateStandaloneColourbar('orientation','vertical','colormap','jet', ...
    %       'caxis',[-25 15],'ticks',-25:10:15,'tick_format','%.0f', ...
    %       'label','Realised gain (dBi)')

    % ---- Parse inputs (uses your get_option helper) -----------------------
    cmap_name     = get_option(varargin, 'colormap', 'turbo');
    caxis_vals    = get_option(varargin, 'caxis', [0 1]);
    ticks_in      = get_option(varargin, 'ticks', []);
    tick_labels   = get_option(varargin, 'tick_labels', []);
    tick_format   = get_option(varargin, 'tick_format', '');
    label_text    = get_option(varargin, 'label', '');
    font_size     = get_option(varargin, 'font_size', 14);
    orientation   = get_option(varargin, 'orientation', 'vertical');

    % Validate caxis
    if ~isnumeric(caxis_vals) || numel(caxis_vals) ~= 2
        error('Figure_CreateStandaloneColourbar: caxis must be a 1x2 numeric vector.');
    end
    caxis_vals = sort(caxis_vals(:).');

    % Build ticks (if not provided)
    if isempty(ticks_in)
        % 6 ticks (inclusive) by default for readability
        tick_positions = linspace(caxis_vals(1), caxis_vals(2), 6);
    else
        tick_positions = ticks_in(:).';
    end

    % Auto-generate labels if not provided
    if isempty(tick_labels)
        if isempty(tick_format)
            % Default numeric labels with minimal fuss
            tick_labels = arrayfun(@num2str, tick_positions, 'UniformOutput', false);
        else
            tick_labels = arrayfun(@(v) sprintf(tick_format, v), tick_positions, 'UniformOutput', false);
        end
    else
        % Ensure labels match ticks
        if numel(tick_labels) ~= numel(tick_positions)
            error('Figure_CreateStandaloneColourbar: tick_labels must match the number of ticks.');
        end
    end

    % ---- Create figure/axes/colorbar -------------------------------------
    fig = figure('Color', 'w');
    ax  = axes(fig, 'Visible', 'off');

    % Set colormap and limits on the axes (colorbar will inherit)
    colormap(ax, cmap_name);
    caxis(ax, caxis_vals);

    % Create colorbar with requested orientation
    if strcmpi(orientation, 'horizontal')
        c = colorbar(ax, 'Location', 'SouthOutside');
    else
        c = colorbar(ax, 'Location', 'EastOutside');
    end

    % Apply ticks and labels
    c.Ticks      = tick_positions;
    c.TickLabels = tick_labels;

    % Label + fonts
    c.Label.String   = label_text;
    c.Label.FontSize = font_size;
    c.FontSize       = font_size;

    % Make sure everything lays out nicely
    drawnow;
end
% function Figure_CreateStandaloneColourbar(varargin)
%     % SUMMARY:
%     %   Creates a standalone colorbar figure for exporting to presentations.
%     %   Supports colormap selection, color limits, tick labels, and orientation.
%     %
%     % ARGUMENTS:
%     %   'colormap'    - (string) Colormap to use (default: 'turbo')
%     %   'caxis'       - (1x2 double) Min and max values for color scale (default: [0 1])
%     %   'ticks'       - (1xN double) Tick positions (default: auto)
%     %   'tick_labels' - (cell array) Custom tick labels (default: auto)
%     %   'label'       - (string) Label text for the colorbar (default: '')
%     %   'font_size'   - (double) Font size for labels (default: 14)
%     %   'orientation' - (string) 'vertical' or 'horizontal' (default: 'vertical')
%     %
%     % EXAMPLES:
%     %   % Standard power dBm colorbar (vertical)
%     %   Figure_CreateStandaloneColourbar('caxis', [-100 -30], 'label', 'Power (dBm)')
%     %
%     %   % Custom horizontal colorbar with specific ticks
%     %   Figure_CreateStandaloneColourbar('orientation', 'horizontal', 'colormap', 'jet', ...
%     %                                    'caxis', [0 1], 'ticks', [0 0.5 1], ...
%     %                                    'tick_labels', {'Min', 'Mid', 'Max'})
%     %
%     %   % Custom ticks for power in dBm
%     %   Figure_CreateStandaloneColourbar('caxis', [-150 -65], 'ticks', [-150, -125, -100, -75, -65])
% 
%     % Parse inputs
%     cmap_name = get_option(varargin, 'colormap', 'turbo');
%     caxis_vals = get_option(varargin, 'caxis', [0 1]);
%     tick_positions = get_option(varargin, 'ticks', linspace(caxis_vals(1), caxis_vals(2), 5)); 
%     tick_labels = get_option(varargin, 'tick_labels', arrayfun(@num2str, tick_positions, 'UniformOutput', false));
%     label_text = get_option(varargin, 'label', '');
%     font_size = get_option(varargin, 'font_size', 14);
%     orientation = get_option(varargin, 'orientation', 'vertical');
% 
%     % Create figure without setting explicit size
%     fig = figure('Color', 'w');
% 
%     % Create dummy axes for colorbar
%     ax = axes(fig, 'Visible', 'off');
%     c = colorbar(ax, 'Location', 'EastOutside');
% 
%     % Set colormap and limits
%     colormap(ax, cmap_name);
%     caxis(ax, caxis_vals);
% 
%     % Set colorbar properties
%     c.Ticks = tick_positions;
%     c.TickLabels = tick_labels;
%     c.Label.String = label_text;
%     c.Label.FontSize = font_size;
%     c.FontSize = font_size;
% 
%     % Adjust orientation
%     if strcmpi(orientation, 'horizontal')
%         c.Location = 'SouthOutside';
%     else
%         c.Location = 'EastOutside';
%     end
% 
%     % Let MATLAB handle figure size naturally
%     drawnow;
% end
