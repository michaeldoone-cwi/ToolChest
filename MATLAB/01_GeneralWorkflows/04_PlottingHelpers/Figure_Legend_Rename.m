function Figure_Legend_Rename(names)
    % SUMMARY:
    %   Renames the legend entries of the current figure using custom labels.
    %
    % ARGUMENTS:
    %   names (cell array of strings) - Custom legend labels to replace existing ones.
    %
    % EXAMPLES:
    %   % Rename legend with custom labels
    %   Figure_Legend_Rename({'Line A', 'Line B', '$\alpha + \beta = \gamma$'});
    %
    %   % Rename with LaTeX expressions
    %   Figure_Legend_Rename({'$\alpha$', '$\beta$', '$\gamma$'});
    %
    % RETURNS:
    %   None.
    %
    % CHANGED:
    %   03 Feb 2025 - Initial version with LaTeX support for custom legend labels.
    %   03 Feb 2025 - Ensures legend exists; creates one if missing.
    %   03 Feb 2025 - Fixed order issue (preserves original plotting order).

    % Ensure names are in a cell array format
    if ~iscell(names)
        error('Input "names" must be a cell array of strings.');
    end

    % Get all plotted lines in the original order (reverse findobj output)
    plottedObjects = flipud(findobj(gca, 'Type', 'Line'));

    % Check if there are enough plotted objects
    if isempty(plottedObjects)
        error('No plotted objects found to create a legend.');
    end

    % Ensure the number of names matches the number of plotted lines
    numObjects = length(plottedObjects);
    numNames = length(names);
    
    if numNames ~= numObjects
        error('Number of provided names (%d) does not match the number of plotted objects (%d).', numNames, numObjects);
    end

    % Check for an existing legend
    hLegend = findobj(gca, 'Type', 'Legend');

    if isempty(hLegend)
        % Create a new legend if none exists
        legend(plottedObjects, names, 'Interpreter', 'latex');
    else
        % Update existing legend
        set(hLegend, 'String', names, 'Interpreter', 'latex');
    end
end
