% Script to test the palettes functions

% Plot all available colourmaps
palettes

% Load in test data
data=load('test_data.mat');

figure
subplot(2,2,1)
hold on
pcolor(data.kask_xx,data.kask_yy,data.kask_melt)
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
pcolor(data.kask_xx,data.kask_yy,data.kask_melt)
cmap=palettes('pale-sat-blue-rainbow');
colormap(gca,cmap)
shading interp
axis image
colorbar
set(gca,'Visible','off')
caxis([1.5,4.5])

subplot(2,2,3)
hold on
pcolor(data.kask_xx,data.kask_yy,data.kask_melt)
cmap=palettes('mellow-rainbow');
colormap(gca,cmap)
shading interp
axis image
colorbar
set(gca,'Visible','off')
caxis([1,4.5])

subplot(2,2,4)
hold on
pcolor(data.kask_xx,data.kask_yy,data.kask_melt)
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
pcolor(data.kask_xx,data.kask_yy,data.kask_albedo)

cmap=load('examples/3wave_BrBl.mat');
colormap(cmap.cmap)
shading interp
colorbar
axis image
caxis([0,1])
set(gca,'visible','off')

print('kask_albedo_wave','-dpng','-r400')

%% Do the same for Naluday
figure
hold on
pcolor(data.nal_xx, data.nal_yy, data.nal_albedo)
colormap(cmap.cmap)
shading interp
colorbar
axis image
caxis([0,1])
set(gca,'visible','off')

print('nal_albedo_wave','-dpng','-r400')