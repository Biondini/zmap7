function loadmovz() % autogenerated function wrapper
 % turned into function by Celso G Reyes 2017
 
ZG=ZmapGlobal.Data; % used by get_zmap_globals
report_this_filefun(mfilename('fullpath'));

[file1,path1] = uigetfile(['*.mat'],'Moviefile');


if length(path1) > 1
    load([path1 file1])
    showmovi
else
    zmap_message_center();
end   % if exist


end
