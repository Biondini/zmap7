function comcat() % autogenerated function wrapper
 % turned into function by Celso G Reyes 2017
 
ZG=ZmapGlobal.Data; % used by get_zmap_globals
titStr ='Combining two catalogs';
%TODO fix this, it's a mixture of old and new a
report_this_filefun(mfilename('fullpath'));

messtext= ...
    ['                                                '
    ' To combine two catalogs please input the       '
    ' second catalog filename. The data will be      '
    ' sorted in time                                 '];

zmap_message_center.set_message(titStr,messtext);

[file1,path1] = uigetfile('*.mat',' Second Earthquake Datafile');
aa = a;

if length(path1) < 2
    zmap_message_center.clear_message();
    done
    return
else
    lopa = [path1 file1];
    name = file1;
    messtext=...
        ['Thank you! Now loading data'
        'Hang on...                 '];
    zmap_message_center.set_message('  ',messtext)
end
try
    load(lopa)
catch ME
    error_handler(ME,'Error loading data! Are they in the right *.mat format?');
end

if max(ZG.a.Date) < 100;
    ZG.a.Date = ZG.a.Date+1900;
    errdisp = ...
        ['The catalog dates appear to be 2 digit.    '
        'Action taken: added 1900 for Y2K compliance'];
    zmap_message_center.set_message('Error!  Alert!',errdisp)
    warndlg(errdisp)

end


l1 = length(a(1,:));
l2 = length(aa(1,:));
l3 = min([l1 l2]);
error('fix the following line')
try
    ZG.a=[a(:, 1:l3) ; aa(:, 1:l3)] ;
catch
    errordlg('Error combining data - same number of colums?');
    return
end

ZG.a.sort('Date');

update(mainmap())

end
