% Script to create a customize 3-wave asymmetrical colourmap joining the
% 'BrownGray', 'BlueWater', and 'blue-11' colourmaps. The colourmap is
% averaged around the BrownGray-BlueWater interface to avoid any sharp
% transitions.

cmap1=palettes('BrownGray',30);
cmap2=palettes('BlueWater',70+15);
cmap2=cmap2(15+1:end,:);

cmap2_mirror=palettes('BlueWater',30+6);
cmap2_mirror=cmap2_mirror(6+1:end,:);

cmap3=palettes('blue-11',100);

weights=zeros(size(cmap1,1),1);
weights(end-15+1:end)=linspace(0,1,15)';

cmap_blended=(weights.*cmap2_mirror(end:-1:1,:) + (1-weights).*cmap1);
cmap=[cmap_blended;cmap2;cmap3];

save('3wave_BrBl.mat','cmap')

% Plot the r, g, b values of the colourmap (these should be continuous)
figure
hold on
plot(cmap(:,1),'r')
plot(cmap(:,2),'g')
plot(cmap(:,3),'b')