% Simple Monte-Carlo Example for Low Light Image Simulation
% Robin Jenkin - March 2024
% NVIDIA

% Tidy Up
clc; clear all; close all;

% Parameters
array_size = 64; % This will be updated based on the image size
number_of_quanta = 2000000;

% Read the .jpeg image
original_image = imread("C:\Users\aryan\Documents\MINOR proj 2\image (1).jpg");

% Normalize the image
if size(original_image, 3) == 3
    normalized_image = double(original_image) / 255;
else
    normalized_image = double(original_image) / 255;
end

% Update array_size based on the image dimensions
[array_size_x, array_size_y, array_size_z] = size(normalized_image);
array_size = max([array_size_x, array_size_y]);

% Initialize the low light image
ll = zeros(array_size_x, array_size_y, array_size_z);

% Apply Monte Carlo simulation to the normalized image
for i = 1:number_of_quanta
    x = ceil(rand() * array_size_x);
    y = ceil(rand() * array_size_y);
    z = ceil(rand() * array_size_z);

    p = normalized_image(x, y, z); % Use the normalized image intensity as the probability

    n = rand();
    if n <= p
        ll(x, y, z) = ll(x, y, z) + 1;
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

% Plot the histogram for the original input image using a bar histogram
figure;
hist_values = imhist(original_image);
bar(hist_values / sum(hist_values), 'BarWidth', 1, 'FaceColor', 'b');
title('Histogram of Original Input Image');
xlabel('Pixel Intensity');
ylabel('Probability');

% Plot the histogram for the simulated low exposure image
figure;
histogram(ll(:), 'Normalization', 'probability');
title('Histogram of Simulated Low Exposure Image');
xlabel('Pixel Intensity');
ylabel('Probability');
