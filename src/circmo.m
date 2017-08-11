%   This subroutine "circle"  selects the Ni closest earthquakes
%   around a interactively selected point.  Resets ZG.newcat and ZG.newt2
%   Operates on "a".

%  Input Ni:
%
report_this_filefun(mfilename('fullpath'));
ZG=ZmapGlobal.Data;
try
    delete(plos1)
catch ME
    error_handler(ME,@do_nothing);
end


%zoom off

titStr ='Selecting EQ in Circles                         ';
messtext= ...
    ['                                                '
    '  Please use the LEFT mouse button              '
    ' to select the center point.                    '
    ' The "ni" events nearest to this point          '
    ' will be selected and displayed in the map.     '];

zmap_message_center.set_message(titStr,messtext);

% Input center of circle with mouse
%
axes(hmo)
[xa0,ya0]  = ginput(1);

stri1 = [ 'Circle: ' num2str(xa0,5) '; ' num2str(ya0,4)];
stri = stri1;
pause(0.1)

[mask, max_km] = closest_events(ZG.a,ya0, xa0, ni);
ZG.newt2 = ZG.a(mask);
ZG.newt2.sort('Date')

messtext = ['Radius of selected Circle: ' num2str(max_km)  ' km' ];
disp(messtext)
zmap_message_center.set_message('Message',messtext)
%
% take first ni and sort by time


% plot Ni clostest events on map as 'x':

hold on
plos1 = plot(ZG.newt2.Longitude,ZG.newt2.Latitude,'xk','EraseMode','normal');
set(gcf,'Pointer','arrow')

ZG.newcat = ZG.newt2;                   % resets ZG.newcat and ZG.newt2

% plot cumulative number
timeplot(ZG.newt2);
