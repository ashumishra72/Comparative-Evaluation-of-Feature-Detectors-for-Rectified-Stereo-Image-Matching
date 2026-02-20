%% STEP 2: Choose Final Thresholds
% Run this in MATLAB after your tuning script

% Harris: Choose 0.005 or 0.01 for good balance
harris_final = 0.005;  % Gives 353 features - good balance

% SURF: Choose 1000 or 2000
surf_final = 1000;     % Gives 2025 features - manageable after NMS

% FAST: Since all give 685, use 0.05 (standard)
fast_final = 0.05;     % Gives 685 features

% BRISK: Use default but will apply strong NMS
% No threshold needed for BRISK