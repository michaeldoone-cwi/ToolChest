function colour = Figure_Colour_Background(colourInput)
    % SUMMARY:
    %   Sets or retrieves the figure background color.
    %
    % ARGUMENTS:
    %   colourInput (1x3 double, string, or 'transparent') [opt] - The color to set.
    %     - RGB triplet (e.g., [1,1,1] for white)
    %     - Standard MATLAB color character (e.g., 'w' for white, 'k' for black)
    %     - 'transparent' → Sets background to fully transparent (good for copying to PowerPoint)
    %     - 'ARNGIN_Template' → [246/255, 246/255, 246/255]
    %     - 'CWI_Template' → [1, 1, 1] (White)
    %
    % RETURNS:
    %   colour (1x3 double or 'transparent') - The current or newly set background color.
    %
    % EXAMPLES:
    %   Figure_Colour_Background('transparent'); % Set transparent background
    %   Figure_Colour_Background('w'); % White background
    %   Figure_Colour_Background([0, 0, 0]); % Black background
    %   currentColor = Figure_Colour_Background(); % Get current color
    %
    % CHANGED:
    %   24 Feb 2025 - Added 'transparent' background option.

    % Retrieve current background color if no input is provided
    if nargin == 0
        colour = get(gcf, 'Color');
        return;
    end

    % If input is a string, check if it's a valid MATLAB single-character color
    if ischar(colourInput)
        validMatlabColors = struct('k', [0, 0, 0], 'w', [1, 1, 1], 'r', [1, 0, 0], ...
                                   'g', [0, 1, 0], 'b', [0, 0, 1], 'y', [1, 1, 0], ...
                                   'm', [1, 0, 1], 'c', [0, 1, 1]);

        if length(colourInput) == 1 && isfield(validMatlabColors, colourInput)
            colourInput = validMatlabColors.(colourInput);
        elseif strcmpi(colourInput, 'transparent')
            colourInput = 'none'; % MATLAB uses 'none' for transparency
        else
            % Handle named templates
            switch colourInput
                case 'ARNGIN_Template'
                    colourInput = [246/255, 246/255, 246/255];
                case 'CWI_Template'
                    colourInput = [1, 1, 1]; % White
                otherwise
                    error('Unknown color template: %s', colourInput);
            end
        end
    end

    % Set figure background color
    set(gcf, 'Color', colourInput);

    % Set axes background to transparent if required
    if strcmp(colourInput, 'none')
        set(gca, 'Color', 'none'); % Also make the axes transparent
    end

    % Return the newly set color
    colour = colourInput;
end
