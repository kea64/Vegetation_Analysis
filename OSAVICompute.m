function [OSAVI_OUT] = OSAVICompute(OSAVI_IN, gain, offset, cutoff)
%Computes the OSAVI of an NIR+R image 
%   By using the OSAVI algorithm, a Vegetation Health Index can be
%   calculated by solely R and NIR values. This is useful in assessing
%   whether crops are healthy, stressed, or dead. Similar to NDVI
%   
%   Implemented by Kris Auker
%   FJ Drones, LLC.

%Creates an empty matrix for future storage
OSAVI_OUT = zeros(size(OSAVI_IN,1), size(OSAVI_IN,2)); %Grayscale matrix image (NO RGB)

%Main Processing Loop. Runs through each pixel
for i = 1:size(OSAVI_IN,1)
    for j = 1:size(OSAVI_IN,2)
        %Creates doubles to store each pixel's composition
        R = double(OSAVI_IN(i,j,1));
        G = double(OSAVI_IN(i,j,2));
        B = double(OSAVI_IN(i,j,3));
        
        %Determine Luminosity with Luminosity Calc
        %NIRIntensity = .2126 * R + .7152 * G + .0722 * B;
        %Alternate Method
        %NIRIntensity = .333 * R + .333 * G + .333 * B;
        
        %NDVI Calculation and Scaling
        %NDVI = (NIRIntensity - R)/(NIRIntensity + R);
        NIR = R;
        TrueR = G;
        
        OSAVI = 1.5*(NIR - TrueR)/(NIR + TrueR + .16);
        %NDVI = ((NIR - R)/(NIR + R + (255 * L))) * (1 + L);
        
        %Black out useless values like soil and buildings
        if OSAVI <= cutoff
            OSAVI_OUT(i,j) = -1;
        else
            %Finalizes output by scaling and offseting
            OSAVI_OUT(i,j) = (OSAVI + offset) * gain;
        end
    end
end

end


