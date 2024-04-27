% Read the image
image = imread("C:\Lokesh\KDC\PLEIADES\IMG_0181.JPG"); % Replace 'your_image.jpg' with the path to your image file

% Convert the image to grayscale if it's a color image
if size(image, 3) == 3
    image_gray = rgb2gray(image);
else
    image_gray = image;
end

% Calculate the histogram
[counts, bins] = imhist(image_gray);

% Plot the histogram
bar(bins, counts);
xlabel('Pixel Intensity');
ylabel('Frequency');
title('Histogram of the Image');
