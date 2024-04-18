oimg = imread("C:\Users\hp\OneDrive\Desktop\untitled1.png");

% Convert the image to grayscale if it's RGB
if size(img, 3) == 3
  img_gray = rgb2gray(img);
else
  img_gray = img;
end

% Calculate the histogram of pixel intensities
[counts, ~] = imhist(img_gray);

% Normalize the histogram (assuming you want probability distribution)
counts = counts / sum(counts);

% Define the range of pixel intensities
x = 0:255;

% Option 1: No frequency information (use default)
pd = fitdist(x', 'Poisson');  % Uncomment this line if you don't have frequency data

% Option 2: Provide frequency vector (if available)
% Assuming you have a frequency vector named 'frequency_counts' with non-negative integers
% pd = fitdist(x', 'Poisson', 'Frequency', frequency_counts);  % Uncomment this line and provide the frequency vector

% Choose one of the option blocks above based on your data availability

% Plot the original histogram
bar(x, counts, 'FaceColor', [0.5 0.5 0.5]);
hold on;

% Plot the Poisson distribution (using the fitted model from chosen option)
plot(x, pdf(pd, x), 'r', 'LineWidth', 2);

% Set labels and title
xlabel('Pixel Intensity');
ylabel('Probability');
title('Poisson Distribution of Image Pixel Intensities');

% Add a legend
legend('Image Histogram', 'Poisson Distribution');

% Display grid
grid on;

% Display the plot
hold off;
