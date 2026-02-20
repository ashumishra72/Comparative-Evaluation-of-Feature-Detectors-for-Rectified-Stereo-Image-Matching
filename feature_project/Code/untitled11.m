%% DEBUG VERSION - Shows exactly what's happening
clear all; close all; clc;

% Your path
base_path = 'C:/Users/axk2681/Desktop/feature_project/Data/';

% Check if base folder exists
fprintf('Checking base folder: %s\n', base_path);
if exist(base_path, 'dir')
    fprintf('✓ Base folder exists\n');
else
    error('Base folder not found!');
end

% Check L_rectified folder
left_folder = fullfile(base_path, 'L_rectified');
fprintf('\nChecking left folder: %s\n', left_folder);
if exist(left_folder, 'dir')
    fprintf('✓ Left folder exists\n');
    
    % List JPG files
    left_files = dir(fullfile(left_folder, '*.JPG'));
    fprintf('Found %d JPG files:\n', length(left_files));
    for i = 1:min(5, length(left_files))
        fprintf('  %s\n', left_files(i).name);
    end
else
    fprintf('✗ Left folder NOT found\n');
end

% Check R_rectified folder
right_folder = fullfile(base_path, 'R_rectifed');  % Correct spelling!
fprintf('\nChecking right folder: %s\n', right_folder);
if exist(right_folder, 'dir')
    fprintf('✓ Right folder exists\n');
    
    % List JPG files
    right_files = dir(fullfile(right_folder, '*.JPG'));
    fprintf('Found %d JPG files:\n', length(right_files));
    for i = 1:min(5, length(right_files))
        fprintf('  %s\n', right_files(i).name);
    end
else
    fprintf('✗ Right folder NOT found\n');
    
    % Check if folder exists with wrong spelling
    wrong_folder = fullfile(base_path, 'R_rectifed');
    if exist(wrong_folder, 'dir')
        fprintf('\nBUT found folder with wrong spelling: R_rectifed\n');
        fprintf('Please rename it to: R_rectifed\n');
    end
end