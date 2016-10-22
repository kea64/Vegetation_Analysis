%% Test Script to Further Test NDVI and VARI

%% Image Reading

GEMI = GEMICompute(RNIR, 1, 0, -1);
OSAVI = OSAVICompute(RNIR, 1, .0, 0);
IPVI = IPVICompute(RNIR, 1, -.1, .6);

figure
subplot(1,2,1);
imshow(imsharpen(GEMI), 'displayrange', [-1 1])
colormap(NDVIColor())

subplot(1,2,2);
imshow(imsharpen(OSAVI), 'displayrange', [-1 1])
colormap(NDVIColor())