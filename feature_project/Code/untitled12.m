%% STEP 5: Debug - Check Right Image Folder
right_path = 'C:\Users\axk2681\Desktop\feature_project\Data\R_rectifed';

% List ALL files in right folder
right_files = dir(fullfile(right_path, '*'));
fprintf('Contents of right folder:\n');
for i = 1:length(right_files)
    if ~right_files(i).isdir
        fprintf('  File %d: %s\n', i, right_files(i).name);
    end
end

% Check if any files match the pattern
pattern_found = false;
for i = 1:length(right_files)
    if contains(right_files(i).name, 'R_rectifed', 'IgnoreCase', true)
        fprintf('\nFound matching file: %s\n', right_files(i).name);
        pattern_found = true;
    end
end

if ~pattern_found
    fprintf('\nNo files matching "R_rectifed" found.\n');
    fprintf('Please check the actual names of your right images.\n');
end