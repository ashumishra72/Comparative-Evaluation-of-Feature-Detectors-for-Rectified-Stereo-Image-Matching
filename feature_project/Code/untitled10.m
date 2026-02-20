%% STEP 7: FINAL THRESHOLD SELECTION
% Copy these values for your main script

% FINAL SELECTED THRESHOLDS
harris_threshold = 0.005;    % 353 features - good balance
surf_threshold = 1000;        % 2025 features - manageable
fast_threshold = 0.05;        % 685 features - consistent
% BRISK uses default parameters

% NMS Distance (start with 3% and adjust if needed)
D_final = 48;  % 3% of diagonal (1600 * 0.03 = 48)

fprintf('\n=== FINAL SELECTED PARAMETERS ===\n');
fprintf('Harris MinQuality: %.3f\n', harris_threshold);
fprintf('SURF MetricThreshold: %d\n', surf_threshold);
fprintf('FAST MinQuality: %.2f\n', fast_threshold);
fprintf('NMS Distance D: %d pixels\n', D_final);