%% Test Script to experiment with image processing

%Color Index Scaling
NDVIColor = [0, 0, 0;
        0.02, 0, 0;
        0.04, 0, 0;
        0.06, 0, 0;
        0.08, 0, 0;
        0.10, 0, 0;
        0.12, 0, 0;
        0.14, 0, 0;
        0.16, 0, 0;
        0.8, .1, .1;
        0.90, .1, .1;
        1, 0, 0;
        1, .5, 0;
        1, 1, 0;
        0.4, 1, 0;
        0, .8, .2;
        0, .5, .07];
    
%% Image Reading
RNIR = imread('Flower_RNIR.png');
RGB = imread('Flower_RGB.png');

%% File Copying
test = RNIR;
test3 = zeros(size(RNIR,1), size(RNIR,2)); %Grayscale matrix image (NO RGB)

%%Main Loop for IR Processing
for i = 1:size(test,1)
    for j = 1:size(test,2)
        %Creates doubles to store each pixel's composition
        R = double(test(i,j,1));
        G = double(test(i,j,2));
        B = double(test(i,j,3));
        
        %Determine Luminosity with Luminosity Calc
        NIRIntensity = .2126 * R + .7152 * G + .0722 * B;
        %NIRIntensity = .333 * R + .333 * G + .333 * B;
        
        %NDVI Calculation and Scaling
        NDVI = (NIRIntensity - R)/(NIRIntensity + R);
        NDVIScaled = 255*((NDVI + 1)/2); %Scaled to 0-255 for uint8
        
        %Write to new image
        test(i,j,1) = uint8(NDVIScaled);
        test(i,j,2) = uint8(NDVIScaled);
        test(i,j,3) = uint8(NDVIScaled);
        
        %Black out useless values like soil and buildings
        if NDVI <= -.15
            test3(i,j) = (NDVI + 1) * 1;
        else
            test3(i,j) = (NDVI + 1) * 1;
        end
    end
end

%Display Images for Comparison
figure
subplot(3,1,1)
imshow(RGB)
title('Original RGB')
subplot(3,1,2)
imshow(RNIR)
title('NIR + IR Composite')
subplot(3,1,3)
imshow(test3)
title('NDVI Sample')
colormap(NDVIColor)

%% Part 2: VARI Testing

%% File Copying
test = RGB;
test4 = zeros(size(RGB,1), size(RGB,2)); %Grayscale matrix image (NO RGB)

for i = 1:size(test,1)
    for j = 1:size(test,2)
        %Creates doubles to store each pixel's composition
        R = double(test(i,j,1));
        G = double(test(i,j,2));
        B = double(test(i,j,3));
        
        %VARI Calculation and Scaling
        VARI = (G - R)/(G + R - B);
        VARIScaled = 255*((NDVI + 1)/2); %Scaled to 0-255 for uint8
        
        %Write to new image
        test(i,j,1) = uint8(VARIScaled);
        test(i,j,2) = uint8(VARIScaled);
        test(i,j,3) = uint8(VARIScaled);
        
        %Black out useless values like soil and buildings
        if VARI <= -1
            test4(i,j) = (VARI + 1) * 1;
        else
            test4(i,j) = (VARI + 1) * 1;
        end
    end
end

%max(test4)
min(test4);
%Display Images for Comparison
figure
subplot(2,1,1)
imshow(RGB)
title('Original RGB')
subplot(2,1,2)
imshow(test4)
title('VARI Sample')
colormap(NDVIColor);

       

% test5 = rand(250,250);
% for i = 1:size(test5,1)
%    for j = 1:size(test5,2)
%        test5(i,j) = j/250;
%    end
% end
% 
% figure
% imshow(test5)
% colormap(NDVIColor)

figure
subplot(2,1,1)
imshow(test3)
title('NDVI Sample')
colormap(NDVIColor);
subplot(2,1,2)
imshow(test4)
title('VARI Sample')
colormap(NDVIColor);
