%% STEP 8: Process All Three Pairs with Final Parameters - CORRECTED VERSION

% Define detectors with final thresholds
detectors = {
    @(img) detectHarrisFeatures(img, 'MinQuality', 0.005), ...
    @(img) detectSURFFeatures(img, 'MetricThreshold', 1000), ...
    @(img) detectFASTFeatures(img, 'MinQuality', 0.05), ...
    @(img) detectBRISKFeatures(img)
};

detector_names = {'Harris', 'SURF', 'FAST', 'BRISK'};

% NMS parameters
max_features = 500;

% Your three selected pairs
pairs = [1, 5, 10];

% IMPORTANT: Set the correct paths to your image folders
% Use forward slashes / instead of backslashes \
base_path = 'C:/Users/axk2681/Desktop/feature_project/Data/';
left_folder = [base_path, 'L_rectified/'];
right_folder = [base_path, 'R_rectifed/'];  % Note: rectifed (missing 'i') as per your folder name

fprintf('Left folder: %s\n', left_folder);
fprintf('Right folder: %s\n', right_folder);

% Process each pair
for p = 1:3
    pair_num = pairs(p);
    fprintf('\n========================================\n');
    fprintf('Processing Pair %d (L%d-R%d)\n', p, pair_num, pair_num);
    fprintf('========================================\n');
    
    % Construct FULL file paths
    left_filename = sprintf('L_rectified%d.jpg', pair_num);
    right_filename = sprintf('R_rectified%d.jpg', pair_num);
    
    left_fullpath = fullfile(left_folder, left_filename);
    right_fullpath = fullfile(right_folder, right_filename);
    
    fprintf('Looking for: %s\n', left_fullpath);
    fprintf('Looking for: %s\n', right_fullpath);
    
    % Check if files exist before trying to read
    if ~exist(left_fullpath, 'file')
        error('Cannot find left image: %s', left_fullpath);
    end
    
    if ~exist(right_fullpath, 'file')
        error('Cannot find right image: %s', right_fullpath);
    end
    
    % Load images using FULL paths
    left = imread(left_fullpath);
    right = imread(right_fullpath);
    
    fprintf('✓ Images loaded successfully\n');
    
    % Convert to grayscale
    if size(left, 3) == 3
        left = rgb2gray(left);
    end
    if size(right, 3) == 3
        right = rgb2gray(right);
    end
    
    % Calculate NMS distance D based on image size
    [h, w] = size(left);
    diagonal = sqrt(h^2 + w^2);
    D = round(0.03 * diagonal);  % 3% of diagonal
    fprintf('Image size: %d x %d, D = %d pixels\n', h, w, D);
    
    fprintf('\nResults:\n');
    fprintf('%-10s | %-10s | %-10s | %-10s\n', 'Detector', 'Left', 'Right', 'Ratio');
    fprintf('%s\n', repmat('-', 1, 45));
    
    % Process each detector
    for d = 1:4
        % Detect features
        left_feat = detectors{d}(left);
        right_feat = detectors{d}(right);
        
        % Apply NMS
        left_nms = selectStrongest(left_feat, min(left_feat.Count, max_features));
        right_nms = selectStrongest(right_feat, min(right_feat.Count, max_features));
        
        % Calculate ratio
        ratio = left_nms.Count / max(right_nms.Count, 1);
        
        fprintf('%-10s | %-10d | %-10d | %-10.2f\n', ...
            detector_names{d}, left_nms.Count, right_nms.Count, ratio);
    end
end

fprintf('\n=== PROCESSING COMPLETE ===\n');