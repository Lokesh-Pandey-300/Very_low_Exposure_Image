% Simple Monte-Carlo Example
% Robin Jenkin - March 2024
% NVIDIA

% Tidy Up
clc; clear all; close all;

% Parameters
array_size = 64;
number_of_quanta = 10000;

a = 0.5;  % average level of cosine
b = 0.25; % amplitude
w = 0.1; % spatial frequency of cosine
t = 30;   % angle in degrees


% Produce example of the original image
x = 1:array_size;
y = 1:array_size;
[xx, yy]  = meshgrid(x,y);
pp = a + b .* cos(2.* pi() .* w .* (xx .* cos(deg2rad(t)) + yy * sin(deg2rad(t))));


% Produce low light image
ll = zeros(array_size); % set low light image to zero

for i = 1:number_of_quanta
 
    x = ceil(rand() * array_size); % Choose a random x-position between 1 and array_size
    y = ceil(rand() * array_size); % Choose a random y-position between 1 and array_size
 
    p = a + b .* cos(2.* pi() .* w .* (x .* cos(deg2rad(t)) + y * sin(deg2rad(t)))); % generate the exposure distribution at the position
 
    n = rand();

    if n>p
        continue
    else
        ll(x,y) = ll(x,y) + 1;
    end
 
 end


figure
subplot(1,2,1)
imshow(pp,[0 1])
subplot(1,2,2)
imshow(ll',[])