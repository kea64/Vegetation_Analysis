function [NDVI_OUT] = NDVICompute(NDVI_IN, gain, offset, cutoff)
%Computes the NDVI of an NIR+R image 
%   By using the NDVI algorithm, a Vegetation Health Index can be
%   calculated by solely R and NIR values. This is useful in assessing
%   whether crops are healthy, stressed, or dead
%   
%   Implemented by Kris Auker
%   FJ Drones, LLC.

%Creates an empty matrix for future storage
NDVI_OUT = zeros(size(NDVI_IN,1), size(NDVI_IN,2)); %Grayscale matrix image (NO RGB)

%Main Processing Loop. Runs through each pixel
for i = 1:size(NDVI_IN,1)
    for j = 1:size(NDVI_IN,2)
        %Creates doubles to store each pixel's composition
        R = double(NDVI_IN(i,j,1));
        G = double(NDVI_IN(i,j,2));
        B = double(NDVI_IN(i,j,3));
        
        %Determine Luminosity with Luminosity Calc
        %NIRIntensity = .2126 * R + .7152 * G + .0722 * B;
        %Alternate Method
        %NIRIntensity = .333 * R + .333 * G + .333 * B;
        
        %NDVI Calculation and Scaling
        %NDVI = (NIRIntensity - R)/(NIRIntensity + R);
        NIR = B;
        TrueR = R - NIR;
        %NDVI = (NIR - TrueR)/(NIR + TrueR);
        NDVI = (NIR - TrueR)/(NIR + TrueR);
        
        %Black out useless values like soil and buildings
        if NDVI <= cutoff
            NDVI_OUT(i,j) = -1;
        else
            %Finalizes output by scaling and offseting
            NDVI_OUT(i,j) = (NDVI + offset) * gain;
        end
    end
end

end


