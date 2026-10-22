function Figure_CreateStandaloneView(varargin)
% SUMMARY:
%   Create a blank 2D or 3D axis (no data), with white background.
%   Only shows the axes you define (label/tick/limits).
%
% ARGUMENTS:
%   Optional key-value pairs:
%     'xlabel', 'ylabel', 'zlabel'          : Axis labels (string)
%     'xticks', 'yticks', 'zticks'         : Tick positions (vector)
%     'xlim', 'ylim', 'zlim'               : Axis limits (2-element vector)
%     'xdir', 'ydir', 'zdir'               : 'normal' or 'reverse'
%     'XAxisLocation', 'YAxisLocation'     : 'top', 'bottom', 'left', 'right'
%     'ZAxisLocation'                      : 'left' or 'right' (3D only)
%     'fontsize'                           : Font size (default: 12)
%     'latex'                              : Use LaTeX interpreter (true/false)
%     'is3D'                               : true = 3D view, false = 2D
%     'view'                               : 3D view vector, e.g. [-25 50]
%
% RETURNS:
%   None
%
% CHANGED:
%   - 19May25: Added axis side/reverse support for overlay flexibility.

% INPUTS
xlabel_str   = get_option(varargin, 'xlabel', '');
ylabel_str   = get_option(varargin, 'ylabel', '');
zlabel_str   = get_option(varargin, 'zlabel', '');
xticks_v     = get_option(varargin, 'xticks', []);
yticks_v     = get_option(varargin, 'yticks', []);
zticks_v     = get_option(varargin, 'zticks', []);
xlim_v       = get_option(varargin, 'xlim', []);
ylim_v       = get_option(varargin, 'ylim', []);
zlim_v       = get_option(varargin, 'zlim', []);
fontsize_v   = get_option(varargin, 'fontsize', 12);
use_latex    = get_option(varargin, 'latex', false);
is3D         = get_option(varargin, 'is3D', false);
view_v       = get_option(varargin, 'view', []);

xdir_opt     = get_option(varargin, 'xdir', '');
ydir_opt     = get_option(varargin, 'ydir', '');
zdir_opt     = get_option(varargin, 'zdir', '');
xloc_opt     = get_option(varargin, 'XAxisLocation', '');
yloc_opt     = get_option(varargin, 'YAxisLocation', '');
zloc_opt     = get_option(varargin, 'ZAxisLocation', '');

% FIGURE SETUP
figure;
ax = axes;
set(gcf, 'Color', 'w');
set(gca, 'FontSize', fontsize_v);
hold on;

% AXIS MODE
if is3D
    axis vis3d;
    if ~isempty(view_v)
        view(view_v);
    else
        view(3);
    end
else
    axis on;
end

% Clear everything by default
set(ax, 'XTick', [], 'YTick', [], 'ZTick', []);
xlabel(''); ylabel(''); zlabel('');

% === X AXIS ===
if ~isempty(xlabel_str), xlabel(xlabel_str); end
if ~isempty(xticks_v), set(ax, 'XTick', xticks_v); end
if ~isempty(xlim_v), xlim(xlim_v); end
if ~isempty(xdir_opt), set(ax, 'XDir', xdir_opt); end
if ~isempty(xloc_opt), set(ax, 'XAxisLocation', xloc_opt); end

% === Y AXIS ===
if ~isempty(ylabel_str), ylabel(ylabel_str); end
if ~isempty(yticks_v), set(ax, 'YTick', yticks_v); end
if ~isempty(ylim_v), ylim(ylim_v); end
if ~isempty(ydir_opt), set(ax, 'YDir', ydir_opt); end
if ~isempty(yloc_opt), set(ax, 'YAxisLocation', yloc_opt); end

% === Z AXIS (if 3D) ===
if is3D
    if ~isempty(zlabel_str), zlabel(zlabel_str); end
    if ~isempty(zticks_v), set(ax, 'ZTick', zticks_v); end
    if ~isempty(zlim_v), zlim(zlim_v); end
    if ~isempty(zdir_opt), set(ax, 'ZDir', zdir_opt); end
    if ~isempty(zloc_opt), set(ax, 'ZAxisLocation', zloc_opt); end
end

% === LATEX MODE ===
if use_latex
    set(gca, 'TickLabelInterpreter', 'latex');
    if ~isempty(xlabel_str), xlabel(xlabel_str, 'Interpreter', 'latex'); end
    if ~isempty(ylabel_str), ylabel(ylabel_str, 'Interpreter', 'latex'); end
    if is3D && ~isempty(zlabel_str), zlabel(zlabel_str, 'Interpreter', 'latex'); end
end
end
