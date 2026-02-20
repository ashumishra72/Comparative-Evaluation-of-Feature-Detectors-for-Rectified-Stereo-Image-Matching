%% STEP 5: Test NMS with Different D Values
D_values = [32, 48, 80];  % 2%, 3%, 5% of diagonal
max_features = 500;  % Maximum features to keep

% Create figure
figure('Position', [100, 100, 1600, 900]);

for d_idx = 1:length(D_values)
    D = D_values(d_idx);
    
    % Apply NMS to each detector
    harris_nms = selectStrongest(harris_features, min(harris_features.Count, max_features));
    surf_nms = selectStrongest(surf_features, min(surf_features.Count, max_features));
    fast_nms = selectStrongest(fast_features, min(fast_features.Count, max_features));
    brisk_nms = selectStrongest(brisk_features, min(brisk_features.Count, max_features));
    
    % Display for this D value
    subplot(3,4, (d_idx-1)*4 + 1);
    imshow(test_img);
    hold on;
    plot(harris_nms);
    title(sprintf('Harris D=%d: %d', D, harris_nms.Count));
    hold off;
    
    subplot(3,4, (d_idx-1)*4 + 2);
    imshow(test_img);
    hold on;
    plot(surf_nms);
    title(sprintf('SURF D=%d: %d', D, surf_nms.Count));
    hold off;
    
    subplot(3,4, (d_idx-1)*4 + 3);
    imshow(test_img);
    hold on;
    plot(fast_nms);
    title(sprintf('FAST D=%d: %d', D, fast_nms.Count));
    hold off;
    
    subplot(3,4, (d_idx-1)*4 + 4);
    imshow(test_img);
    hold on;
    plot(brisk_nms);
    title(sprintf('BRISK D=%d: %d', D, brisk_nms.Count));
    hold off;
end

sgtitle('NMS Comparison: Different D Values');