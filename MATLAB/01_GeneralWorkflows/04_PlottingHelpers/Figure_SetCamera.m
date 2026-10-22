function Figure_SetCamera(point_of_interest, varargin)
    % SUMMARY:
    %   Sets the camera position dynamically relative to a given 3D point.
    %
    % ARGUMENTS:
    %   point_of_interest (1x3 double) - [X, Y, Z] coordinates of the focus point.
    %   'camera_offset' (1x2 double) - [distance, height] offset from POI (default: [50, 20]).
    %   'view_angles' (1x2 double) - [azimuth, elevation] in degrees (default: [180, 30]).
    %   'zoom' (double) - Camera zoom angle (default: 30°).
    %
    % EXAMPLES:
    %   % Set the camera 50m back and 20m up, facing 180° azimuth, 30° elevation
    %   Figure_SetCamera([100, 200, 30], 'camera_offset', [50, 20], 'view_angles', [180, 30]);
    %
    %   % Set camera to follow an antenna position with zoom adjustment
    %   Figure_SetCamera(antenna_position, 'view_angles', [135, 45], 'zoom', 20);

    % Default values
    camera_offset = [50, 20];  % [distance from POI, height adjustment]
    view_angles = [180, 30];   % [azimuth, elevation] default to looking from the south
    zoom = 30;                 % Default zoom level

    % Parse optional parameters
    if nargin > 1
        camera_offset = get_option(varargin, 'camera_offset', camera_offset);
        view_angles = get_option(varargin, 'view_angles', view_angles);
        zoom = get_option(varargin, 'zoom', zoom);
    end

    % Extract components
    distance_from_poi = camera_offset(1);
    height_offset = camera_offset(2);
    
    azimuth = deg2rad(view_angles(1));
    elevation = deg2rad(view_angles(2));

    % Compute camera position based on azimuth/elevation
    camera_position = point_of_interest + distance_from_poi * [
        cos(azimuth) * cos(elevation), ...  % X component
        sin(azimuth) * cos(elevation), ...  % Y component
        sin(elevation)                      % Z component
    ] + [0, 0, height_offset]; % Apply height offset separately

    % Set camera properties
    campos(camera_position);     % Set camera position
    camtarget(point_of_interest); % Look at the POI
    camva(zoom);                 % Set zoom level
    camup([0, 0, 1]);            % Ensure Z is up

    % Debug print
    fprintf('Camera Position Set: [%.2f, %.2f, %.2f]\n', camera_position(1), camera_position(2), camera_position(3));
    fprintf('Point of Interest: [%.2f, %.2f, %.2f]\n', point_of_interest(1), point_of_interest(2), point_of_interest(3));
    fprintf('View Angles (Azimuth, Elevation): [%.2f, %.2f]\n', view_angles(1), view_angles(2));
    fprintf('Zoom Level: %.2f\n', zoom);
end
