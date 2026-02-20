%% STEP 3: Calculate NMS Distance D
image_height = 960;
image_width = 1280;

% Calculate diagonal
diagonal = sqrt(image_height^2 + image_width^2);
fprintf('Image diagonal: %.1f pixels\n', diagonal);

% Try different percentages (2%, 3%, 5%)
D_2percent = round(0.02 * diagonal);  % More features, closer together
D_3percent = round(0.03 * diagonal);  % Recommended starting point
D_5percent = round(0.05 * diagonal);  % Fewer features, well separated

fprintf('\nNMS Distance Options:\n');
fprintf('D (2%% of diagonal) = %d pixels\n', D_2percent);
fprintf('D (3%% of diagonal) = %d pixels\n', D_3percent);
fprintf('D (5%% of diagonal) = %d pixels\n', D_5percent);