%% Test Script to Further Test NDVI and VARI

%% Image Reading
RNIR = imread('Flower_RNIR.png');
RGB1 = imread('Crab_Apple_Tree.jpg');
RGB2 = imread('BlueNotchFarm.jpg');

NDVI_O = NDVICompute(RNIR, 1, 1, -1);

%VARI_O1 = VARICompute(RGB1, 1, .6, -1);
VARI_O2 = NDVICompute(RNIR, 1, .75, -1);

figure
% subplot(2,1,1)
% imshow(VARI_O1)
% colormap(NDVIColor())
% title('VARI 1')

%subplot(2,1,2)
imshow(VARI_O2, 'displayrange', [-1 1])
colormap(NDVIColor())
title('VARI 2')