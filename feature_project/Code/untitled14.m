%% STEP 9: Visualize the Results - Add this after your processing loop

% Create a summary figure
figure('Position', [100, 100, 1400, 600]);

% Plot 1: Feature counts for all pairs
subplot(1,2,1);
pair_numbers = [1, 5, 10];  % Your actual pair numbers
harris_counts = [353, 432, 299];  % From your results
surf_counts = [500, 500, 500];
fast_counts = [500, 500, 500];
brisk_counts = [500, 500, 500];

plot(pair_numbers, harris_counts, 'ro-', 'LineWidth', 2, 'MarkerSize', 8); hold on;
plot(pair_numbers, surf_counts, 'gs-', 'LineWidth', 2, 'MarkerSize', 8);
plot(pair_numbers, fast_counts, 'bd-', 'LineWidth', 2, 'MarkerSize', 8);
plot(pair_numbers, brisk_counts, 'm^-', 'LineWidth', 2, 'MarkerSize', 8);
hold off;

xlabel('Pair Number');
ylabel('Feature Count (after NMS)');
title('Feature Detection Results Across Pairs');
legend('Harris', 'SURF', 'FAST', 'BRISK', 'Location', 'best');
grid on;

% Plot 2: Left-Right balance ratios
subplot(1,2,2);
ratios_pair1 = [0.75, 1.00, 1.00, 1.00];
ratios_pair2 = [0.86, 1.00, 1.00, 1.00];
ratios_pair3 = [0.61, 1.00, 1.00, 1.00];

bar_data = [ratios_pair1; ratios_pair2; ratios_pair3]';
bar(bar_data);
set(gca, 'XTickLabel', {'Harris', 'SURF', 'FAST', 'BRISK'});
ylabel('Left/Right Ratio');
title('Left-Right Balance by Detector');
legend('Pair 1', 'Pair 5', 'Pair 10', 'Location', 'best');
yline(1, '--k', 'Ideal', 'LineWidth', 2);
grid on;

sgtitle('ECE 738 Project 3 - Feature Detection Results', 'FontSize', 14, 'FontWeight', 'bold');
saveas(gcf, 'feature_detection_summary.png');