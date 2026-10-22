function pos = Figure_PositionDefault(posInput)
    % SUMMARY:
    %   Gets or sets the global default figure position.
    %
    % ARGUMENTS:
    %   posInput (1x4 double) [opt] - The default figure position [left, bottom, width, height].
    %                                  If omitted, retrieves the current default position.
    %
    % EXAMPLES:
    %   % Get current default figure position
    %   pos = Figure_PositionDefault();
    %
    %   % Set new default figure position
    %   Figure_PositionDefault([100, 100, 800, 600]);
    %
    %   % Reset to MATLAB default
    %   Figure_PositionDefault('reset');
    %
    % RETURNS:
    %   pos (1x4 double | 'reset') - The current or newly set default figure position.
    %
    % CHANGED:
    %   20 Mar 2025 - Created function to manage default figure position.
    %   20 Mar 2025 - Supports retrieval, setting, and reset to MATLAB default.

    if nargin == 0
        % Return the current default figure position
        pos = get(groot, 'DefaultFigurePosition');
    elseif ischar(posInput) && strcmpi(posInput, 'reset')
        % Reset to MATLAB default behavior
        set(groot, 'DefaultFigurePosition', 'remove');
        pos = 'reset';
    else
        % Validate input
        if ~isvector(posInput) || length(posInput) ~= 4
            error('Input must be a 1x4 position vector: [left, bottom, width, height].');
        end

        % Set the default figure position globally
        % set(groot, 'DefaultFigurePosition', posInput);
        set(groot, 'DefaultFigureWindowStyle', 'normal');
        set(groot, 'DefaultFigurePosition', posInput);

        pos = posInput;
    end
end
