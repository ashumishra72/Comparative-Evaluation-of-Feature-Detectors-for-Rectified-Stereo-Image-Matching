%% STEP 4: Visualize Detector Performance with Chosen Thresholds
% Load your test image
test_img = imread('C:\Users\axk2681\Desktop\feature_project\Data\L_rectified\L_rectified1.JPG');
if size(test_img, 3) == 3
    test_gray = rgb2gray(test_img);
else
    test_gray = test_img;
end

% Define detectors with final thresholds
harris_features = detectHarrisFeatures(test_gray, 'MinQuality', 0.005);
surf_features = detectSURFFeatures(test_gray, 'MetricThreshold', 1000);
fast_features = detectFASTFeatures(test_gray, 'MinQuality', 0.05);
brisk_features = detectBRISKFeatures(test_gray);

% Display results
figure('Position', [100, 100, 1600, 1000]);

% Harris
subplot(2,2,1);
imshow(test_img);
hold on;
plot(harris_features.selectStrongest(200));
title(sprintf('Harris (0.005): %d features', harris_features.Count));
hold off;

% SURF
subplot(2,2,2);
imshow(test_img);
hold on;
plot(surf_features.selectStrongest(200));
title(sprintf('SURF (1000): %d features', surf_features.Count));
hold off;

% FAST
subplot(2,2,3);
imshow(test_img);
hold on;
plot(fast_features.selectStrongest(200));
title(sprintf('FAST (0.05): %d features', fast_features.Count));
hold off;

% BRISK
subplot(2,2,4);
imshow(test_img);
hold on;
plot(brisk_features.selectStrongest(200));
title(sprintf('BRISK: %d features', brisk_features.Count));
hold off;

sgtitle('Detector Performance with Selected Thresholds');