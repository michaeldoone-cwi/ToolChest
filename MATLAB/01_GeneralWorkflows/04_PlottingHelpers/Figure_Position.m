function pos = Figure_Position(posInput)
    % SUMMARY:
    %   Sets or retrieves the figure position.
    %
    % ARGUMENTS:
    %   posInput (1x4 double) [opt] - The figure position [left, bottom, width, height].
    %
    % EXAMPLES:
    %   % Get current figure position
    %   pos = Figure_Position();
    %
    %   % Set figure position
    %   Figure_Position([100, 100, 800, 600]);
    %
    % RETURNS:
    %   pos (1x4 double) - The current or newly set figure position.
    %
    % CHANGED:
    %   03 Feb 2025 - Renamed `GetFigurePosition` → `Figure_Position`.
    %   03 Feb 2025 - Allows setting figure position when passing an argument.
    %   03 Feb 2025 - Always returns the current figure position.


    if nargin == 0
    
        warning('Changing format to longG')
        format longG

        % Return current figure position
        pos = get(gcf, 'Position');
    else
        % Validate input
        if ~isvector(posInput) || length(posInput) ~= 4
            error('Input must be a 1x4 position vector: [left, bottom, width, height].');
        end
        
        % Set the figure position
        set(gcf, 'Position', posInput);
        pos = posInput; % Return the new position
    end
end
