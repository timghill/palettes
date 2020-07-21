% Script to test the cm_xml_to_matlab functions

% Plot all available colourmaps
cm_xml_to_matlab

% Load in test data
SEBout=load('SEBout_085.mat');
DEM=load('kask_rgi_ela_dem.mat');
albedo=load('kask_rgi_ela_albedo.mat');

figure
subplot(2,2,1)
hold on
pcolor(DEM.xx,DEM.yy,0.85*SEBout.SEBout.melt)
cmap=cm_xml_to_matlab('3w_bgYr');
% cmap=cm_xml_to_matlab('mellow-rainbow');
% cmap=cm_xml_to_matlab('-blue-6');
colormap(gca,cmap)
shading interp
axis image
colorbar
set(gca,'Visible','off')
caxis([1,4.5])

subplot(2,2,2)
hold on
pcolor(DEM.xx,DEM.yy,0.85*SEBout.SEBout.melt)
cmap=cm_xml_to_matlab('pale-sat-blue-rainbow');
colormap(gca,cmap)
shading interp
axis image
colorbar
set(gca,'Visible','off')
caxis([1.5,4.5])

subplot(2,2,3)
hold on
pcolor(DEM.xx,DEM.yy,0.85*SEBout.SEBout.melt)
cmap=cm_xml_to_matlab('mellow-rainbow');
colormap(gca,cmap)
shading interp
axis image
colorbar
set(gca,'Visible','off')
caxis([1,4.5])

subplot(2,2,4)
hold on
pcolor(DEM.xx,DEM.yy,0.85*SEBout.SEBout.melt)
cmap=cm_xml_to_matlab('BlueSky');
colormap(gca,cmap)
shading interp
axis image
colorbar
set(gca,'Visible','off')
caxis([1,4.5])

print('melt_cmap_tests','-dpng','-r400')

figure
hold on
pcolor(DEM.xx,DEM.yy,albedo.albedo.*DEM.mask)
% Create your own "wave" colourmap to highlight the ice albedo rangr
% (~0.15--0.5)
cmap1=cm_xml_to_matlab('BrownGray',15);
cmap2=cm_xml_to_matlab('BlueWater',35);
cmap3=cm_xml_to_matlab('blue-11',50);
cmap=[cmap1;cmap2;cmap3];
colormap(cmap)
shading interp
colorbar
axis image
caxis([0,1])
set(gca,'visible','off')

print('albedo_wave','-dpng','-r400')