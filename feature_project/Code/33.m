%% tune_parameters.m
% Run this first to find optimal thresholds for each detector

% Load a sample image
test_img = imread(fullfile(left_path, 'L_rectified1.jpg'));
if size(test_img, 3) == 3
    test_gray = rgb2gray(test_img);
else
    test_gray = test_img;
end

% Test different thresholds for each detector
fprintf('\n=== PARAMETER TUNING ===\n');

% Harris detector - test MinQuality
harris_thresholds = [0.001, 0.005, 0.01, 0.02, 0.05, 0.1];
harris_counts = [];
fprintf('\nHarris Detector:\n');
for t = harris_thresholds
    features = detectHarrisFeatures(test_gray, 'MinQuality', t);
    harris_counts = [harris_counts, features.Count];
    fprintf('  MinQuality=%.3f -> %d features\n', t, features.Count);
end

% SURF detector - test MetricThreshold
surf_thresholds = [100, 500, 1000, 2000, 5000];
surf_counts = [];
fprintf('\nSURF Detector:\n');
for t = surf_thresholds
    features = detectSURFFeatures(test_gray, 'MetricThreshold', t);
    surf_counts = [surf_counts, features.Count];
    fprintf('  MetricThreshold=%d -> %d features\n', t, features.Count);
end

% FAST detector - test MinQuality
fast_thresholds = [0.01, 0.03, 0.05, 0.08, 0.1];
fast_counts = [];
fprintf('\nFAST Detector:\n');
for t = fast_thresholds
    features = detectFASTFeatures(test_gray, 'MinQuality', t);
    fast_counts = [fast_counts, features.Count];
    fprintf('  MinQuality=%.2f -> %d features\n', t, features.Count);
end

% BRISK detector
fprintf('\nBRISK Detector:\n');
features = detectBRISKFeatures(test_gray);
fprintf('  Default -> %d features\n', features.Count);

% Plot results
figure;
subplot(2,2,1);
plot(harris_thresholds, harris_counts, 'b-o');
xlabel('MinQuality'); ylabel('Feature Count'); title('Harris');
grid on;

subplot(2,2,2);
plot(surf_thresholds, surf_counts, 'r-o');
xlabel('MetricThreshold'); ylabel('Feature Count'); title('SURF');
grid on;

subplot(2,2,3);
plot(fast_thresholds, fast_counts, 'g-o');
xlabel('MinQuality'); ylabel('Feature Count'); title('FAST');
grid on;