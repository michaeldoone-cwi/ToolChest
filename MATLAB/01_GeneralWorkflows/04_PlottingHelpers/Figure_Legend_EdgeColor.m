function current_color = Figure_Legend_EdgeColor(new_color)
    % SUMMARY
    %   Sets or retrieves the legend edge color.
    %   Accepts standard MATLAB color values, and aliases:
    %     - 'transparent' → 'none'
    %     - 'off' → 'none'
    %
    % ARGUMENTS
    %   new_color (optional): Color value (e.g., 'red', [0 0 1], 'none', 'transparent', 'off').
    %
    % RETURNS
    %   current_color: The current legend edge color.
    %
    % CHANGED
    %   03Feb25: Created function to control legend edge color.
    
    % Retrieve legend handle
    legend_handle = legend;
    if isempty(legend_handle)
        warning('No legend found.');
        current_color = [];
        return;
    end
    
    % Handle input arguments
    if nargin == 1
        % Convert aliases
        if ischar(new_color) || isstring(new_color)
            switch lower(new_color)
                case {'transparent', 'off'}
                    new_color = 'none';
            end
        end
        % Apply new edge color
        set(legend_handle, 'EdgeColor', new_color);
    end

    % Retrieve current edge color
    current_color = get(legend_handle, 'EdgeColor');
end
