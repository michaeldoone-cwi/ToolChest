function Figure_Save(varargin)
    % SUMMARY:
    %   Saves a MATLAB figure to a specified directory with a given file type.
    %
    % ARGUMENTS:
    %   'fig_handle'  - (figure handle)  The figure to save (default: gcf).
    %   'save_dir'    - (string)  Directory to save in (default: current dir).
    %   'filename'    - (string)  Filename (can contain full path).
    %   'ext_type'    - (string)  File type (default: 'png').
    %
    % EXAMPLES:
    %   % Save current figure as default 'png' in current directory
    %   SaveFigure();
    %
    %   % Save specific figure to a directory
    %   SaveFigure('fig_handle', fig, 'save_dir', 'C:\Figures', 'filename', 'plot1');
    %
    %   % Save as PDF with custom path
    %   SaveFigure('filename', 'C:\MyFigures\figure1.pdf');
    %
    % RETURNS:
    %   Saves the figure to the specified location.
    %
    % CHANGED:
    %   24 Feb 2025 - Added handling for full-path filenames overriding defaults.
    %   24 Feb 2025 - Added validation for directory existence.
    %   24 Feb 2025 - Improved error handling and robustness.

    % Default values
    fig_handle = gcf; % Current figure
    save_dir = pwd;   % Default to current directory
    filename = 'figure'; % Default base filename
    ext_type = 'png'; % Default extension

    % Parse input arguments manually
    for i = 1:2:length(varargin)
        switch lower(varargin{i})
            case 'fig_handle'
                fig_handle = varargin{i+1};
            case 'save_dir'
                save_dir = varargin{i+1};
            case 'filename'
                filename = varargin{i+1};
            case 'ext_type'
                ext_type = varargin{i+1};
            otherwise
                error('Unknown parameter: %s', varargin{i});
        end
    end

    % Ensure save directory is a valid string
    if iscell(save_dir)
        save_dir = save_dir{1};
    end

    % Extract parts from filename (if it contains a full path)
    [file_path, file_base, file_ext] = fileparts(filename);

    % If filename includes a path, override save_dir
    if ~isempty(file_path)
        save_dir = file_path;
    end

    % If filename includes an extension, override ext_type
    if ~isempty(file_ext)
        ext_type = file_ext(2:end); % Remove dot (.)
    end

    % Construct full save path
    full_save_path = fullfile(save_dir, [file_base, '.', ext_type]);

    % Ensure the save directory exists
    if ~isfolder(save_dir)
        fprintf('Creating save directory: %s\n', save_dir);
        mkdir(save_dir);
    end

    % Save the figure
    fprintf('Saving figure to: %s\n', full_save_path);
    saveas(fig_handle, full_save_path, ext_type);

    fprintf('Figure saved successfully.\n');
end
