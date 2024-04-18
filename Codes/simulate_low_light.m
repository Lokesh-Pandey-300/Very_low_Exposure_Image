% Example usage
clc; 
clear all; 
close all;

% Read the .jpeg image
image = imread("C:\Lokesh\Minor 2_Nvidia\Very_low_Exposure_Image\Pictures\istockphoto-611295844-612x612.jpg");

% Simulate low light exposure
number_of_quanta = 2000000;
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

% Apply Monte Carlo simulation to the normalized image
for i = 1:number_of_quanta
    % Generate random coordinates
    x = ceil(rand() * size(normalized_image, 1));
    y = ceil(rand() * size(normalized_image, 2));

    % For RGB images
    if size(normalized_image, 3) == 3
        % Generate random channel
        z = ceil(rand() * size(normalized_image, 3));
        p = normalized_image(x, y, z); % Use the normalized image intensity as the probability
    else
        % For grayscale images
        p = normalized_image(x, y); % Use the normalized image intensity as the probability
    end

    % Generate a random number to determine if a photon is absorbed
    n = rand();
    if n <= p
        % Increment the pixel value in the low light image
        if size(normalized_image, 3) == 3
            ll(x, y, z) = ll(x, y, z) + 1;
        else
            ll(x, y) = ll(x, y) + 1;
        end
    end
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
