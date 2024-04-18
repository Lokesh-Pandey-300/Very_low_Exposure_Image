% simulate_low_light_demo.m

clc; 
clear all; 
close all;

% Read the .jpeg image
original_image = imread("C:\Users\hp\OneDrive\Desktop\istockphoto-611295844-612x612.jpg");

% Convert the image to grayscale
grayscale_image = rgb2gray(original_image);

% Simulate low light exposure
number_of_quanta = 8000000;
low_light_image = low_light_single_channel(grayscale_image, number_of_quanta);

% Display the results
figure;
subplot(1, 2, 1);
imshow(grayscale_image, []);
title('Grayscale Image');
subplot(1, 2, 2);
imshow(low_light_image, []);
title('Simulated Low Exposure Image');