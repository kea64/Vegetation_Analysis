function [color] = NDVIColor()
%Returns a color index matrix perfect for NDVI
%   Just use NDVIColor() instead of a variable
%   
%   Added by Kris Auker
%   FJ Drone, LLC.

color = [0, 0, 0;   %Black
        0.0, 0, 0;  %Black
        0.0, 0, 0;
        0.0, 0, 0;
        0.0, 0, 0;
        0.0, 0, 0;
        0.0, 0, 0;
        0.0, 0, 0;
        0.0, 0, 0;  %Black
        0.0, 0, 0;  %Black
        0.0, 0, 0;
        0.0, 0, 0;
        0.0, 0, 0;
        0.0, 0, 0;
        0.0, 0, 0;
        0.0, 0, 0;
        0.0, 0, 0;  %Black
        0.7, 0, 0; %Red
        0.75, 0, 0;
        0.80, 0, 0;
        0.85, 0, 0;
        .9, 0, 0;
        .95, 0, 0;
        1, 0, 0;
        1, .2, 0;
        1, .3, 0;
        1, .5, 0;
        1, 1, 0;
        0.4, 1, 0;
        0, .8, .2;
        0, .5, .07];

end

