% Simple Monte-Carlo Example for Low Light Image Simulation
% Robin Jenkin - March 2024
% NVIDIA
 
% Tidy Up
clc; clear all; close all;
 
% Parameters
array_size = 64; % This will be updated based on the image size
number_of_quanta = 7000000;
 
% Read the .jpeg image
original_image = imread("C:\Users\aryan\Documents\MINOR proj 2\image (1).jpg");
 
% Convert to grayscale if it's a color image
if size(original_image, 3) == 3
    original_image = rgb2gray(original_image);
end
 
% Normalize the image
normalized_image = double(original_image) / 255;
 
% Update array_size based on the image dimensions
[array_size_x, array_size_y] = size(normalized_image);
array_size = max(array_size_x, array_size_y);
 
% Initialize the low light image
ll = zeros(array_size_x, array_size_y);
 
% Apply Monte Carlo simulation to the normalized image
for i = 1:number_of_quanta
    x = ceil(rand() * array_size_x);
    y = ceil(rand() * array_size_y);
 
    p = normalized_image(x, y); % Use the normalized image intensity as the probability
 
    n = rand();
    if n <= p
        ll(x, y) = ll(x, y) + 1;
    end
end
 
% Display the results
figure;
subplot(1, 2, 1);
imshow(original_image, []);
title('Original Image');
subplot(1, 2, 2);
imshow(ll, []);
title('Simulated Low Exposure Image');