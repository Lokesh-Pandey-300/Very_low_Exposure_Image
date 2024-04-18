% Example usage
clc; clear all; close all;

% Read the .jpeg image
original_image = imread("C:\Users\hp\OneDrive\Desktop\istockphoto-611295844-612x612.jpg");

% Simulate low light exposure
number_of_quanta = 2000000;
low_light_image = low_light_single_channel(original_image, number_of_quanta);

% Display the results
figure;
subplot(1, 2, 1);
imshow(original_image, []);
title('Original Image');
subplot(1, 2, 2);
imshow(low_light_image, []);
title('Simulated Low Exposure Image');