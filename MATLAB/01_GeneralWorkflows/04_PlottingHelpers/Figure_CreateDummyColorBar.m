function Figure_CreateDummyColorBar(range, varargin)
    % SUMMARY:
    %   Creates a standalone dummy colorbar with a specified range and optional ticks.
    %
    % ARGUMENTS:
    %   range (1x2 double) - Defines the minimum and maximum values for the colorbar.
    %   'ticks' (1xN double) [opt] - Custom tick positions (default: automatic).
    %
    % EXAMPLES:
    %   % Create a colorbar with range [0, 100]
    %   Figure_CreateDummyColorBar([0, 100]);
    %
    %   % Create a colorbar with custom ticks
    %   Figure_CreateDummyColorBar([0, 100], 'ticks', [0, 50, 100]);
    %
    % RETURNS:
    %   None.
    %
    % CHANGED:
    %   03 Feb 2025 - Initial version.

    error('replaced with Figure_CreateStandaloneColourbar')

    % Parse optional parameters
    ticks = get_option(varargin, 'ticks', []);

    % Validate range input
    if ~isvector(range) || length(range) ~= 2 || range(1) >= range(2)
        error('Input "range" must be a 1x2 vector with increasing values: [min max].');
    end

    % Create a dummy image to associate with the colorbar
    caxis(range); % Set color limits
    colormap(jet); % Default colormap
    colorbarHandle = colorbar;

    % Apply optional tick marks
    if ~isempty(ticks)
        set(colorbarHandle, 'Ticks', ticks);
    end
end
