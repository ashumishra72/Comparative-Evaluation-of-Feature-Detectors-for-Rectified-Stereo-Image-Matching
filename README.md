# Comparative Evaluation of Feature Detectors for Rectified Stereo Image Matching

## Overview
This project presents a comparative analysis of different feature detection algorithms applied to rectified stereo image pairs. The goal is to evaluate their performance in terms of feature detection quality, robustness, and suitability for stereo image matching tasks.

## Objectives
The main objectives of this project are:
- To implement and compare four feature detectors: Harris, SURF, FAST, and BRISK
- To apply these detectors to rectified stereo image pairs
- To analyze the number and distribution of detected features
- To evaluate left-right feature consistency

## Dataset
The dataset consists of rectified stereo image pairs captured in a controlled laboratory environment. Each stereo pair contains a left and a right image with aligned epipolar geometry.

## Methodology
1. Load rectified stereo image pairs
2. Convert images to grayscale
3. Apply feature detection algorithms:
   - Harris Corner Detector
   - SURF Detector
   - FAST Detector
   - BRISK Detector
4. Apply non-maximum suppression to improve feature distribution
5. Extract and compare features from left and right images
6. Store quantitative and visual results

## Results
The results include:
- Number of features detected in left and right images
- Feature distribution visualizations
- Left-to-right feature detection ratios
- Comparative tables and plots

All result images and tables are available in the `results/` directory.

## Code Structure
