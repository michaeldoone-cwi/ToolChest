function Figure_AddHorizontalLine(y, varargin)
    % SUMMARY:
    %   Adds a horizontal dashed line to the current figure with an optional annotation.
    %
    % ARGUMENTS:
    %   y (double or [xmin xmax]) - The y-position of the horizontal line.
    %   'name' (string) [opt] - The annotation text (default: none).
    %   'namePosition' (string or [x, y]) [opt] - 'above', 'below', or [x, y] position (default: auto-above).
    %   'x' (1x2 double) [opt] - X-range [xmin, xmax] (default: full x-axis).
    %
    % EXAMPLES:
    %   % Just a horizontal line (Full Width)
    %   Figure_AddHorizontalLine(-150);
    %
    %   % Line with annotation above (default)
    %   Figure_AddHorizontalLine(-150, 'name', 'Signal Detection Threshold');
    %
    %   % Line with annotation below
    %   Figure_AddHorizontalLine(-200, 'name', 'Noise Floor', 'namePosition', 'below');
    %
    %   % Line within specific x-range
    %   Figure_AddHorizontalLine(-100, 'name', 'Threshold', 'x', [100 500]);
    %
    %   % Line with custom annotation position
    %   Figure_AddHorizontalLine(-120, 'name', 'Custom Label', 'namePosition', [300, -110], 'x', [200 400]);
    %
    % RETURNS:
    %   None.
    %
    % CHANGED:
    %   03 Feb 2025 - Initial version with automatic axis-based positioning.
    %   03 Feb 2025 - Renamed 'lineNote' → 'name' and 'annotationPosition' → 'namePosition'.
    %   03 Feb 2025 - Ensured horizontal lines do not appear in the legend.
    %   03 Feb 2025 - Fixed issue with `namePosition` when passing [x, y].

    % Get the current axis limits
    ax = gca;
    xlims = ax.XLim; % Default full x-axis range

    % Default values
    name = '';        % No annotation by default
    namePosition = 'above'; % Default to above
    x = xlims;        % Default to full width

    % Parse optional arguments
    if nargin > 1
        for i = 1:2:length(varargin)
            switch lower(varargin{i})
                case 'name'
                    name = varargin{i+1};
                case 'nameposition'
                    namePosition = varargin{i+1};
                case 'x'
                    x = varargin{i+1};
            end
        end
    end

    % If `y` is given as an array, extract x range and y position
    if length(y) == 2
        x = y;       % Use as x range
        y = mean(ax.YLim); % Default y position at mid-axis
    end

    % Plot the horizontal line, ensuring it does NOT appear in the legend
    hLine = line('XData', x, 'YData', [y y], 'LineStyle', '--', 'LineWidth', 1, 'Color', 'k', ...
                 'HandleVisibility', 'off');

    % Handle annotation if provided
    if ~isempty(name)
        % Determine annotation position
        if isnumeric(namePosition) && numel(namePosition) == 2
            % If namePosition is a coordinate [x, y], use it directly
            noteX = namePosition(1);
            noteY = namePosition(2);
        else
            % Handle string-based positioning
            switch namePosition
                case 'above'
                    noteY = y + (ax.YLim(2) - ax.YLim(1)) * 0.03; % Slightly above
                    noteX = mean(x); % Centered
                case 'below'
                    noteY = y - (ax.YLim(2) - ax.YLim(1)) * 0.03; % Slightly below
                    noteX = mean(x); % Centered
                otherwise
                    error('Invalid namePosition. Use "above", "below", or [x, y].');
            end
        end

        % Convert annotation position to figure units
        [xaf, yaf] = ds2nfu(noteX, noteY);

        % Create the annotation textbox
        hAnnot = annotation('textbox', 'Position', [xaf yaf 0 0], 'FitBoxToText', 'on', ...
                            'EdgeColor', 'none', 'BackgroundColor', 'none', ...
                            'String', name, 'Interpreter', 'latex');

        % Set font properties
        hAnnot.FontSize = 10;
        hAnnot.FontName = 'Times New Roman';
    end
end
