function [color] = NDVIColor()
%Returns a color index matrix perfect for NDVI
%   Just use NDVIColor() instead of a variable
%   
%   Added by Kris Auker
%   FJ Drone, LLC.

color = [0, 0, 0;
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

end

