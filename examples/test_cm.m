% Script to test the palettes functions

% Plot all available colourmaps
palettes

% Load in test data
data=load('test_data.mat');

figure
subplot(2,2,1)
hold on
pcolor(data.xx,data.yy,data.melt)
cmap=palettes('3w_bgYr');
% cmap=palettes('mellow-rainbow');
% cmap=palettes('-blue-6');
colormap(gca,cmap)
shading interp
axis image
colorbar
set(gca,'Visible','off')
caxis([1,4.5])

subplot(2,2,2)
hold on
pcolor(data.xx,data.yy,data.melt)
cmap=palettes('pale-sat-blue-rainbow');
colormap(gca,cmap)
shading interp
axis image
colorbar
set(gca,'Visible','off')
caxis([1.5,4.5])

subplot(2,2,3)
hold on
pcolor(data.xx,data.yy,data.melt)
cmap=palettes('mellow-rainbow');
colormap(gca,cmap)
shading interp
axis image
colorbar
set(gca,'Visible','off')
caxis([1,4.5])

subplot(2,2,4)
hold on
pcolor(data.xx,data.yy,data.melt)
cmap=palettes('BlueSky');
colormap(gca,cmap)
shading interp
axis image
colorbar
set(gca,'Visible','off')
caxis([1,4.5])

print('melt_cmap_tests','-dpng','-r400')

figure
hold on
pcolor(data.xx,data.yy,data.albedo)
% Create your own "wave" colourmap to highlight the ice albedo rangr
% (~0.15--0.5)
cmap1=palettes('BrownGray',15);
cmap2=palettes('BlueWater',35);
cmap3=palettes('blue-11',50);
cmap=[cmap1;cmap2;cmap3];
colormap(cmap)
shading interp
colorbar
axis image
caxis([0,1])
set(gca,'visible','off')

print('albedo_wave','-dpng','-r400')