function qui() % autogenerated function wrapper
 % turned into function by Celso G Reyes 2017
 
ZG=ZmapGlobal.Data; % used by get_zmap_globals
report_this_filefun(mfilename('fullpath'));

ButtonName=questdlg('Really Quit?', ...
    'Warning', ...
    'Yes','Cancel','');

switch ButtonName
    case 'Yes'
        disp('Quitting ZMAP - have a nice day'); quitzmap;
    case 'Cancel'
        disp('Canceled'); return
end % switch
end
