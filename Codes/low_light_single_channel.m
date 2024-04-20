% simulate_low_light_demo.m

clc; 
clear all; 
close all;

% Read the .jpeg image
image = imread("C:\Users\hp\OneDrive\Desktop\output_gray_image.jpg");

% Convert the image to grayscale
grayscale_image = rgb2gray(image);

% Simulate low light exposure
number_of_quanta = 8000000;
tic;%start timer
    % Parameters
    array_size = max(size(image)); % Assuming square image for simplicity

    % Normalize the image
    normalized_image = double(image) / 255;

    % Initialize the low light image
    ll = zeros(size(normalized_image));

    % Apply Monte Carlo simulation to the normalized image
    for i = 1:number_of_quanta
        % Generate random coordinates
        x = ceil(rand() * size(normalized_image, 1));
        y = ceil(rand() * size(normalized_image, 2));

        % Use grayscale intensity as the probability
        p = normalized_image(x, y);

        % Generate a random number to determine if a photon is absorbed
        n = rand();
        if n <= p
            % Increment the pixel value in the low light image
            ll(x, y) = ll(x, y) + 1;
        end
    end
toc;%timer stops
   
% Display the results
figure;
subplot(1, 2, 1);
imshow(grayscale_image, []);
title('Grayscale Image');
subplot(1, 2, 2);
imshow(ll, []);
title('Simulated Low Exposure Image');
