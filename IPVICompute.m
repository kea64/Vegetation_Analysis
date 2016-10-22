function [IPVI_OUT] = IPVICompute(IPVI_IN, gain, offset, cutoff)
%Computes the IPVI of an NIR+R image 
%   By using the IPVI algorithm, a Vegetation Health Index can be
%   calculated by solely R and NIR values. This is useful in assessing
%   whether crops are healthy, stressed, or dead. Similar to NDVI
%   
%   Implemented by Kris Auker
%   FJ Drones, LLC.

%Creates an empty matrix for future storage
IPVI_OUT = zeros(size(IPVI_IN,1), size(IPVI_IN,2)); %Grayscale matrix image (NO RGB)

%Main Processing Loop. Runs through each pixel
for i = 1:size(IPVI_IN,1)
    for j = 1:size(IPVI_IN,2)
        %Creates doubles to store each pixel's composition
        R = double(IPVI_IN(i,j,1));
        G = double(IPVI_IN(i,j,2));
        B = double(IPVI_IN(i,j,3));
        
        %Determine Luminosity with Luminosity Calc
        %NIRIntensity = .2126 * R + .7152 * G + .0722 * B;
        %Alternate Method
        %NIRIntensity = .333 * R + .333 * G + .333 * B;
        
        %NDVI Calculation and Scaling
        %NDVI = (NIRIntensity - R)/(NIRIntensity + R);
        NIR = R;
        TrueR = G;
        
        IPVI = (NIR)/(NIR + TrueR);
        %NDVI = ((NIR - R)/(NIR + R + (255 * L))) * (1 + L);
        
        %Black out useless values like soil and buildings
        if IPVI <= cutoff
            IPVI_OUT(i,j) = -1;
        else
            %Finalizes output by scaling and offseting
            IPVI_OUT(i,j) = (IPVI + offset) * gain;
        end
    end
end

end


