%% List of daily code I like to use, and probably will open with every matlab window

%% Selecting custom figure position:Set Default Figure Position
% create figure
fh_tmp = figure;
pos = Figure_Position();
% Set new default figure position
Figure_PositionDefault(pos);
% Reset to MATLAB default
% Figure_PositionDefault('reset');
