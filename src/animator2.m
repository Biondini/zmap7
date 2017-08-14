function animator2(action)
%   global ps1 ps2 plin pli zvg gz ra
 % turned into function by Celso G Reyes 2017
 
ZG=ZmapGlobal.Data; % used by get_zmap_globals

global ps1 ps2 plin pli %moved out of switche's "start" statement
report_this_filefun(mfilename('fullpath'));

switch(action)
    case 'start'
        disp('waiting for button press')
        axis manual; hold on
        set(gcf,'Pointer','cross');
        waitforbuttonpress
        point1 = get(gca,'CurrentPoint'); % button down detected
        ps1 = plot(point1(1,1),point1(1,2),'ws');

        set(gcf,'WindowButtonMotionFcn',@(~,~)animator2('move'));
        set(gcf,'WindowButtonUpFcn',@(~,~)animator2('stop'));

        point2 = get(gca,'CurrentPoint');
        ps2 = plot(point2(1,1),point2(1,2),'w^','era','xor');
        plin = [point1(1,1) point1(1,2) ; point2(2,1) point2(2,2)];
        pli = plot(plin(:,1),plin(:,2),'w-','era','xor');
        set(pli,'LineWidth',2)

    case 'move'
        currPt=get(gca,'CurrentPoint');
        set(ps2,'XData',currPt(1,1))
        set(ps2,'YData',currPt(1,2))
        set(pli,'XData',[ plin(1,1) currPt(1,1)]);
        set(pli,'YData',[ plin(1,2) currPt(1,2)]);
    case 'stop'
        set(gcf,'Pointer','arrow');
        set(gcbf,'WindowButtonMotionFcn','')
        set(gcbf,'WindowButtonUpFcn','')
        slicemap('newslice');

end

end
