function fontcolor = Figure_FontColor(fontcolor_i)
    % SUMMARY:
    %   Sets or retrieves the font color for axis ticks and labels in the current figure.
    %
    % ARGUMENTS:
    %   fontcolor_i (1x3 double or char) [opt] - The font color to set.
    %     - RGB triplet (e.g., [1, 1, 1] for white, [0, 0, 0] for black)
    %     - Standard MATLAB color character (e.g., 'k' for black, 'w' for white)
    %
    % RETURNS:
    %   fontcolor (1x3 double) - The current or newly set font color.
    %
    % EXAMPLES:
    %   % Set font color to black
    %   Figure_FontColor('k');
    %
    %   % Set font color to white
    %   Figure_FontColor('w');
    %
    %   % Set font color using an RGB triplet
    %   Figure_FontColor([0.5, 0.5, 0.5]);
    %
    %   % Retrieve current font color
    %   currentColor = Figure_FontColor();
    %
    % CHANGED:
    %   24 Feb 2025 - Initial version.

    % Get current axis
    ax = gca;

    % Retrieve current font color if no input is provided
    if nargin == 0
        fontcolor = ax.XColor; % Return current font color (assumes all axis colors are the same)
        return;
    end

    % If input is a string, check if it's a valid MATLAB color character
    if ischar(fontcolor_i)
        validMatlabColors = struct('k', [0, 0, 0], 'w', [1, 1, 1], 'r', [1, 0, 0], ...
                                   'g', [0, 1, 0], 'b', [0, 0, 1], 'y', [1, 1, 0], ...
                                   'm', [1, 0, 1], 'c', [0, 1, 1]);

        if length(fontcolor_i) == 1 && isfield(validMatlabColors, fontcolor_i)
            fontcolor_i = validMatlabColors.(fontcolor_i);
        else
            error('Unknown font color: %s', fontcolor_i);
        end
    end

    % Apply the font color to the axis labels and ticks
    ax.XColor = fontcolor_i;
    ax.YColor = fontcolor_i;
    ax.ZColor = fontcolor_i;

    % Return the newly set font color
    fontcolor = fontcolor_i;
end
