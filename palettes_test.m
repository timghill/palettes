% Script to check out an interesting colourmap combination

cm0='-BrownGray';
cm1='-blue-1';
cm2='-BlueSpectrum';
cm3='blue-11';

cm_lengths=56*[1,1,2,1];

cmap1=palettes(cm1,cm_lengths(2)+35);
cmap1=cmap1(1:cm_lengths(2),:);

cmap=[palettes(cm0,cm_lengths(1));
      cmap1;
      palettes(cm2,cm_lengths(3));
      palettes(cm3,cm_lengths(4))];
  
figure
hold on
dem=load('../../carseb/kaskawulsh-data/kask_rgi_ela_dem.mat');
pcolor(dem.xx,dem.yy,dem.Z.*dem.mask)
set(gca,'Visible','off')
colormap(cmap)
shading interp
colorbar
