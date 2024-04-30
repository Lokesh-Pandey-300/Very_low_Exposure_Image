
clear all
% Load YOLOv8 model (assuming yolov8n.mat is in the same directory)
model = load('yolov8n.mat', 'yolov8Net');
net = model.yolov8Net;

% Read the input image
image = imread("C:\Lokesh\Minor 2_Nvidia\Very_low_Exposure_Image\Pictures\istockphoto-611295844-612x612.jpg");

% Resize image to match input size of the network (if necessary)
inputSize = net.Layers(1).InputSize(1:2);
imageResized = imresize(image, inputSize);

% Normalize image
imageNormalized = double(imageResized) / 255;

% Detect objects in the image
[classIDs, scores, boxes] = detectYOLOv8(net, imageNormalized);

% Display the detected objects
detectedImage = insertObjectAnnotation(imageResized, 'rectangle', boxes, cellstr(classIDs), 'LineWidth', 3);
imshow(detectedImage);
title('Detected Objects');
