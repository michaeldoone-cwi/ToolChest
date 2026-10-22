function fontsize = Figure_FontSize(fontsize_i)
% Changes the font size for all text elements in the current figure.
% If no input is provided, returns the current font size of the figure.

if nargin == 0
    fontsize = get(gca, 'FontSize'); % Return current axis font size
    return;
end

% Change font size for all text elements
set(findall(gcf, '-property', 'FontSize'), 'FontSize', fontsize_i);
fontsize = fontsize_i; % Return the newly set font size
end
