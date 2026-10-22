function viewOut = Figure_View(varargin)
% SUMMARY:
%   Sets or retrieves the current figure view.
%
% ARGUMENTS:
%   varargin (1x2 double | double, double) [opt] - The azimuth and elevation angles.
%
% EXAMPLES:
%   % Get current figure view
%   viewAngles = Figure_View();
%
%   % Set figure view using a vector
%   Figure_View([30, 60]);
%
%   % Set figure view using separate arguments
%   Figure_View(30, 60);
%
% RETURNS:
%   viewOut (1x2 double) - The current or newly set figure view.
%
% CHANGED:
%   03 Feb 2025 - Allows setting view using [az, el] or (az, el).
%   03 Feb 2025 - Always returns the current view.
%   03 Feb 2025 - Prints the view if no input is provided with correct precision.

    if nargin == 0
        % Retrieve azimuth and elevation correctly
        [az, el] = view(gca);
        viewOut = [az, el]; % Store result

        % Print correctly formatted angles
        disp(sprintf('Current view: [%.2f, %.2f]', az, el));
    else
        % Handle input as [az, el] or (az, el)
        if nargin == 1 && isnumeric(varargin{1}) && numel(varargin{1}) == 2
            azEl = varargin{1};
        elseif nargin == 2 && all(cellfun(@isnumeric, varargin))
            azEl = [varargin{1}, varargin{2}];
        else
            error('Input must be either a 1x2 vector [az, el] or two separate values (az, el).');
        end

        % Set figure view
        view(gca, azEl);
        viewOut = azEl; % Return the new view
    end
end
