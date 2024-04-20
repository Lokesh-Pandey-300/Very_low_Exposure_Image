% Example usage
clc; 
clear all;
close all;

% Read the .jpeg image
image = imread("C:\Users\hp\OneDrive\Desktop\output_gray_image.jpg");

% Simulate low light exposure
number_of_quanta = 1099900;
tic;%start timer
% Parameters
array_size = max(size(image)); % Assuming square image for simplicity

% Normalize the image
if size(image, 3) == 3
    normalized_image = double(image) / 255;
else
    normalized_image = double(image) / 255;
end

% Initialize the low light image
ll = zeros(size(normalized_image));

% Generate all random coordinates at once
x = ceil(rand(number_of_quanta, 1) * size(normalized_image, 1));
y = ceil(rand(number_of_quanta, 1) * size(normalized_image, 2));

% For RGB images
if size(normalized_image, 3) == 3
    % Generate all random channels at once
    z = ceil(rand(number_of_quanta, 1) * size(normalized_image, 3));
    p = normalized_image(sub2ind(size(normalized_image), x, y, z)); % Use the normalized image intensity as the probability
else
    % For grayscale images
    p = normalized_image(sub2ind(size(normalized_image), x, y)); % Use the normalized image intensity as the probability
end

% Generate all random numbers at once
n = rand(number_of_quanta, 1);

% Find where a photon is absorbed
absorbed = n <= p;

% Increment the pixel values in the low light image
if size(normalized_image, 3) == 3
    idx = sub2ind(size(ll), x(absorbed), y(absorbed), z(absorbed));
    ll(idx) = ll(idx) + 1;
else
    idx = sub2ind(size(ll), x(absorbed), y(absorbed));
    ll(idx) = ll(idx) + 1;
end

toc;%end timer
   
% Display the results
figure;
subplot(1, 2, 1);
imshow(image, []);
title('Original Image');
subplot(1, 2, 2);
imshow(ll, []);
title('Simulated Low Exposure Image');
