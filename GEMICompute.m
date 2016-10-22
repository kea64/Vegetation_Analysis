function [GEMI_OUT] = GEMICompute(GEMI_IN, gain, offset, cutoff)
%Computes the GEMI of an NIR+R+B image 
%   By using the GEMI algorithm, a Vegetation Health Index can be
%   calculated by solely R and NIR values. This is useful in assessing
%   whether crops are healthy, stressed, or dead. GEMI is atmosphere and
%   soil level resistant
%   
%   Implemented by Kris Auker
%   FJ Drones, LLC.

%Creates an empty matrix for future storage
GEMI_OUT = zeros(size(GEMI_IN,1), size(GEMI_IN,2)); %Grayscale matrix image (NO RGB)

%Main Processing Loop. Runs through each pixel
for i = 1:size(GEMI_IN,1)
    for j = 1:size(GEMI_IN,2)
        %Creates doubles to store each pixel's composition
        R = double(GEMI_IN(i,j,1));
        G = double(GEMI_IN(i,j,2));
        B = double(GEMI_IN(i,j,3));
        
        
        %NDVI Calculation and Scaling
        %NDVI = (NIRIntensity - R)/(NIRIntensity + R);
        NIRN = R/255;
        RN = G/255;
        
        n = (2*(NIRN^2-RN^2)+1.5*NIRN+.5*RN)/(NIRN + RN + 0.5);
        
        GEMI = n*(1-.25*n)-(RN-.125)/(1-RN);
        
        %Black out useless values like soil and buildings
        if GEMI <= cutoff
            GEMI_OUT(i,j) = (GEMI-.5)/2;
        else
            %Finalizes output by scaling and offseting
            GEMI_OUT(i,j) = (GEMI + offset) * gain;
        end
    end
end

end


