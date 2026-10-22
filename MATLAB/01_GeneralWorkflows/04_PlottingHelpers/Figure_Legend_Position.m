function Figure_Legend_Position(positionInput)
    % SUMMARY:
    %   Sets the position of the legend in the current figure.
    %
    % ARGUMENTS:
    %   positionInput (1x4 double OR string) - 
    %     - Custom position: [left, bottom, width, height]
    %     - Standard MATLAB location (e.g., 'northwest', 'southeast')
    %
    % EXAMPLES:
    %   % Set the legend position using custom coordinates
    %   Figure_Legend_Position([0.4186, 0.1801, 0.2582, 0.1492]);
    %
    %   % Set the legend position using MATLAB standard location
    %   Figure_Legend_Position('northwest');
    %
    % RETURNS:
    %   None.
    %
    % CHANGED:
    %   03 Feb 2025 - Initial version.
    %   03 Feb 2025 - Ensures a legend exists before setting position.
    %   03 Feb 2025 - Added support for MATLAB standard location commands.

    % Validate input
    if ~(ischar(positionInput) || (isvector(positionInput) && length(positionInput) == 4))
        error('Input must be either a 1x4 position vector [left, bottom, width, height] or a standard location string.');
    end

    % Find the existing legend
    hLegend = findobj(gca, 'Type', 'Legend');

    % If no legend exists, create one
    if isempty(hLegend)
        % Get all plotted lines
        plottedObjects = findobj(gca, 'Type', 'Line');

        % If no lines exist, throw an error
        if isempty(plottedObjects)
            error('No legend found and no plotted objects available to create one.');
        end

        % Create a legend with default labels
        hLegend = legend(plottedObjects, 'Auto Legend');
    end

    % Apply the legend position
    if ischar(positionInput)
        % Set standard MATLAB location
        set(hLegend, 'Location', positionInput);
    else
        % Set custom position
        set(hLegend, 'Position', positionInput);
    end
end
