%% STEP 10: Generate Summary Report

fid = fopen('project3_results_report.txt', 'w');

fprintf(fid, '========================================\n');
fprintf(fid, 'ECE 738 Project 3 - Feature Detection\n');
fprintf(fid, 'Spring 2026\n');
fprintf(fid, '========================================\n\n');

fprintf(fid, 'EXPERIMENTAL SETUP:\n');
fprintf(fid, '- 4 Detectors: Harris, SURF, FAST, BRISK\n');
fprintf(fid, '- 3 Stereo Pairs: L1-R1, L5-R5, L10-R10\n');
fprintf(fid, '- Image Resolution: 960 x 1280 pixels\n');
fprintf(fid, '- NMS Distance D: 48 pixels (3%% of diagonal)\n');
fprintf(fid, '- Max features after NMS: 500\n\n');

fprintf(fid, 'RESULTS SUMMARY:\n');
fprintf(fid, '%s\n', repmat('=', 1, 60));

for pair = 1:3
    pair_num = [1,5,10];
    fprintf(fid, '\nPAIR %d (L%d-R%d):\n', pair, pair_num(pair), pair_num(pair));
    fprintf(fid, '%-10s | %-10s | %-10s | %-10s\n', 'Detector', 'Left', 'Right', 'Ratio');
    fprintf(fid, '%s\n', repmat('-', 1, 45));
    
    % Your actual results
    if pair == 1
        fprintf(fid, '%-10s | %-10d | %-10d | %-10.2f\n', 'Harris', 353, 472, 0.75);
        fprintf(fid, '%-10s | %-10d | %-10d | %-10.2f\n', 'SURF', 500, 500, 1.00);
        fprintf(fid, '%-10s | %-10d | %-10d | %-10.2f\n', 'FAST', 500, 500, 1.00);
        fprintf(fid, '%-10s | %-10d | %-10d | %-10.2f\n', 'BRISK', 500, 500, 1.00);
    elseif pair == 2
        fprintf(fid, '%-10s | %-10d | %-10d | %-10.2f\n', 'Harris', 432, 500, 0.86);
        fprintf(fid, '%-10s | %-10d | %-10d | %-10.2f\n', 'SURF', 500, 500, 1.00);
        fprintf(fid, '%-10s | %-10d | %-10d | %-10.2f\n', 'FAST', 500, 500, 1.00);
        fprintf(fid, '%-10s | %-10d | %-10d | %-10.2f\n', 'BRISK', 500, 500, 1.00);
    else
        fprintf(fid, '%-10s | %-10d | %-10d | %-10.2f\n', 'Harris', 299, 490, 0.61);
        fprintf(fid, '%-10s | %-10d | %-10d | %-10.2f\n', 'SURF', 500, 500, 1.00);
        fprintf(fid, '%-10s | %-10d | %-10d | %-10.2f\n', 'FAST', 500, 500, 1.00);
        fprintf(fid, '%-10s | %-10d | %-10d | %-10.2f\n', 'BRISK', 500, 500, 1.00);
    end
end

fprintf(fid, '\n\nANALYSIS:\n');
fprintf(fid, '1. SURF, FAST, and BRISK consistently hit the 500-feature cap\n');
fprintf(fid, '2. Harris detector shows variation (299-432 features) based on scene content\n');
fprintf(fid, '3. Left-right balance is good for all detectors (ratios 0.61-1.00)\n');
fprintf(fid, '4. NMS with D=48 effectively limits feature density\n\n');

fprintf(fid, 'CONCLUSION:\n');
fprintf(fid, 'All 4 detectors successfully identified features across all 3 stereo pairs.\n');
fprintf(fid, 'Results are suitable for Project 4 (feature matching and stereo reconstruction).\n');

fclose(fid);

fprintf('\n✓ Report saved to: project3_results_report.txt\n');