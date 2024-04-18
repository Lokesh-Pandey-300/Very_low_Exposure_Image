% Simple Monte-Carlo Example
% Robin Jenkin - March 2024
% NVIDIA

% Tidy Up
clc; clear all; close all;

% Parameters
number_of_quanta = 1000000;

a = 0.5;  % average level of cosine
b = 0.25; % amplitude
w = 0.1; % spatial frequency of cosine
t = 30;   % angle in degrees

% Load input image
input_image = imread('C:\Users\hp\OneDrive\Desktop\istockphoto-611295844-612x612.jpg'); % Replace 'your_input_image.jpg' with the path to your image
input_image_gray = rgb2gray(input_image); % Convert to grayscale if needed

% Get the size of the input image
[array_size_x, array_size_y] = size(input_image_gray);

% Produce low light image
ll = zeros(array_size_x, array_size_y); % Initialize low light image

for i = 1:number_of_quanta
    x = ceil(rand() * array_size_x); % Choose a random x-position between 1 and array_size_x
    y = ceil(rand() * array_size_y); % Choose a random y-position between 1 and array_size_y
    
    % Generate the exposure distribution at the position
    p = a + b .* cos(2.* pi() .* w .* (x .* cos(deg2rad(t)) + y * sin(deg2rad(t))));
    
    % Compare with random number and update low light image
    n = rand();
    if n <= p
        ll(x, y) = ll(x, y) + 1;
    end
end

% Display the input image and the low light image
figure;
subplot(1, 2, 1);
imshow(input_image_gray);
title('Input Image');

subplot(1, 2, 2);
imshow(ll', []);
title('Low Light Image');
