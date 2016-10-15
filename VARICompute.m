function [VARI_OUT] = VARICompute(VARI_IN, gain, offset, cutoff)
%Computes the VARI of an RGB image 
%   By using the VARI algorithm, a Vegetation Health Index can be
%   calculated by solely R,G, and B values. Since this index does not use
%   NIR, accuracy is impaired and none plant objects tend to show odd
%   behavior
%   Implemented by Kris Auker, FJ Drones, LLC.

%Creates an empty matrix for future storage
VARI_OUT = zeros(size(VARI_IN,1), size(VARI_IN,2)); %Grayscale matrix image (NO RGB)

%Main Processing Loop. Runs through each pixel
for i = 1:size(VARI_IN,1)
    for j = 1:size(VARI_IN,2)
        %Creates doubles to store each pixel's composition
        R = double(VARI_IN(i,j,1));
        G = double(VARI_IN(i,j,2));
        B = double(VARI_IN(i,j,3));
        
        %VARI Calculation and Scaling
        VARI = (G - R)/(G + R - B);
        
        %Black out useless values like soil and buildings
        if 6 > 5
            if VARI <= cutoff
              VARI_OUT(i,j) = 0;
            else
              %Finalizes output by scaling and offseting
              VARI_OUT(i,j) = (VARI + offset) * gain;
            end
        else
            VARI_OUT(i,j) = 0;
        end
    end
end

end

