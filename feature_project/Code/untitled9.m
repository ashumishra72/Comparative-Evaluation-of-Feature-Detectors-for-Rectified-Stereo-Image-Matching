%% STEP 6: Check Left-Right Balance
% Load a left and right image pair
left_img = imread('C:\Users\axk2681\Desktop\feature_project\Data\L_rectified\L_rectified1.JPG');
right_img = imread('C:\Users\axk2681\Desktop\feature_project\Data\R_rectifed\R_rectified1.JPG');

if size(left_img, 3) == 3
    left_gray = rgb2gray(left_img);
    right_gray = rgb2gray(right_img);
end

% Detect features with your chosen thresholds
left_harris = detectHarrisFeatures(left_gray, 'MinQuality', 0.005);
right_harris = detectHarrisFeatures(right_gray, 'MinQuality', 0.005);

left_surf = detectSURFFeatures(left_gray, 'MetricThreshold', 1000);
right_surf = detectSURFFeatures(right_gray, 'MetricThreshold', 1000);

left_fast = detectFASTFeatures(left_gray, 'MinQuality', 0.05);
right_fast = detectFASTFeatures(right_gray, 'MinQuality', 0.05);

left_brisk = detectBRISKFeatures(left_gray);
right_brisk = detectBRISKFeatures(right_gray);

% Calculate balance ratios
fprintf('\n=== LEFT-RIGHT BALANCE CHECK ===\n');
fprintf('Detector    | Left  | Right | Ratio\n');
fprintf('%s\n', repmat('-', 1, 40));

fprintf('Harris      | %4d  | %4d  | %.2f\n', ...
    left_harris.Count, right_harris.Count, left_harris.Count/right_harris.Count);
fprintf('SURF        | %4d  | %4d  | %.2f\n', ...
    left_surf.Count, right_surf.Count, left_surf.Count/right_surf.Count);
fprintf('FAST        | %4d  | %4d  | %.2f\n', ...
    left_fast.Count, right_fast.Count, left_fast.Count/right_fast.Count);
fprintf('BRISK       | %4d  | %4d  | %.2f\n', ...
    left_brisk.Count, right_brisk.Count, left_brisk.Count/right_brisk.Count);

% Ideal ratio is close to 1.0 (0.9 to 1.1 is good)