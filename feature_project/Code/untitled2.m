% Explore your data to understand image properties
left_path = fullfile(project_dir, 'data', 'L_rectified');
right_path = fullfile(project_dir, 'data', 'R_rectified');

% List all files
left_files = dir(fullfile(left_path, '*.jpg'));
right_files = dir(fullfile(right_path, '*.jpg'));

fprintf('Found %d left images and %d right images\n', ...
    length(left_files), length(right_files));

% Check one image to understand resolution
test_img = imread(fullfile(left_path, left_files(1).name));
[h, w, c] = size(test_img);
fprintf('Image resolution: %d x %d pixels\n', h, w);