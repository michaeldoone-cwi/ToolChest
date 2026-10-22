function fontsize = Figure_FontSize_Axis(fontsize_i)
% Changes the font size for axis ticks and labels in the current figure.
% If no input is provided, returns the current axis font size.

if nargin == 0
    fontsize = get(gca, 'FontSize'); % Return current axis font size
    return;
end

% Change font size for axis ticks and labels
ax = gca;
ax.FontSize = fontsize_i;
fontsize = fontsize_i; % Return the newly set axis font size
end
