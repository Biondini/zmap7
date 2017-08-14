function slices() % autogenerated function wrapper
 % turned into function by Celso G Reyes 2017
 
ZG=ZmapGlobal.Data; % used by get_zmap_globals
report_this_filefun(mfilename('fullpath'));

figure_w_normalized_uicontrolunits(slice)
clf
hold off
set(gca,'visible','off')

rect = [0.1 0.1 0.4 0.4];
orient landscape
axes('position',rect);
hold on
surf(gx,gy,re4);
view(3) % default 3-d view
axis([-155.7 -155.2 19 19.5  -20 1000]);
colormap(jet)
shading interp
hold on
grid
set(gca,'visible','on','FontSize',ZmapGlobal.Data.fontsz.m,'FontWeight','bold',...
    'FontWeight','bold','LineWidth',1.5,...
    'Box','on','TickDir','out')

end
