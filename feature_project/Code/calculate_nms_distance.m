% Run this in MATLAB to create necessary folders
project_dir = 'C:\Users\axk2681\Desktop\feature_project'; % Adjust path
results_path = fullfile(project_dir, 'results');
if ~exist(results_path, 'dir')
    mkdir(results_path);
end