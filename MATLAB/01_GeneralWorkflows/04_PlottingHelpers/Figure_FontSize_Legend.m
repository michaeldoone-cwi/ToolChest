function fontsize = Figure_FontSize_Legend(fontsize_i)
% Changes the font size for the legend text in the current figure.
% If no input is provided, returns the current legend font size.

leg = findobj(gcf, 'Type', 'Legend');
if isempty(leg)
    warning('No legend found in the current figure.');
    fontsize = []; % Return empty if no legend exists
    return;
end

if nargin == 0
    fontsize = get(leg, 'FontSize'); % Return current legend font size
    return;
end

% Change font size for legend text
set(leg, 'FontSize', fontsize_i);
fontsize = fontsize_i; % Return the newly set legend font size
end
