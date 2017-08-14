function zgrid3d(sel) % autogenerated function wrapper
% This subroutine assigns creates a 3D grid with
% spacing dx,dy, dz (in degreees). The size will
% be selected interactiVELY. The pvalue in each
% volume around a grid point containing ni earthquakes
% will be calculated as well as the magnitude
% of completness
%   Stefan Wiemer 1/98
 % turned into function by Celso G Reyes 2017
 
ZG=ZmapGlobal.Data; % used by get_zmap_globals

report_this_filefun(mfilename('fullpath'));

if sel == 'in'
    % get the grid parameter
    % initial values
    %
    dx = 0.1;
    dy = 0.1 ;
    dz = 5.00 ;
    ni = 300;
    R = 10000;


    def = {'0.1','0.1',num2str(dz),num2str(max(ZG.a.Depth)), num2str(min(ZG.a.Depth))};

    tit ='Three dimesional z-value analysis';
    prompt={...
        'Spacing in Longitude (dx in [deg])',...
        'Sapcing in Latitude  (dy in [deg])',...
        'Spacing in Depth    (dz in [km ])',...
        'Depth Range: deep limit [km] ',...
        'Depth Range: shallow limit',...
        };


    ni2 = inputdlg(prompt,tit,1,def);

    l = ni2{1}; dx= str2double(l);
    l = ni2{2}; dy= str2double(l);
    l = ni2{3}; dz= str2double(l);
    l = ni2{4}; z1= str2double(l);
    l = ni2{5}; z2= str2double(l);


    zgrid3d('ca')


end   % if sel == 'in'

% get the grid-size interactively and
% calculate the b-value in the grid by sorting
% thge seimicity and selectiong the ni neighbors
% to each grid point

if sel == 'ca'
    selgp3dB
    zvect=[z2:dz:z1];
    gz = zvect;
    itotal = length(t5);
    zmap_message_center.set_info(' ','Running... ');think
    %  make grid, calculate start- endtime etc.  ...
    %
    zvg = ones(length(gx),length(gy),length(gz),300)*nan;
    ram  = ones(length(gx),length(gy),length(gz),300)*nan;

    t0b = min(ZG.a.Date)  ;
    n = ZG.a.Count;
    teb = ZG.a.Date(n) ;
    tdiff = round(days(teb-t0b)/ZG.bin_days);
    loc = zeros(3, length(gx)*length(gy));

    % loop over  all points
    %
    i2 = 0.;
    i1 = 0.;
    allcount = 0.;
    wai = waitbar(0,' Please Wait ...  ');
    set(wai,'NumberTitle','off','Name',' 3D gridding - percent done');;
    drawnow
    %
    %


    z0 = 0; x0 = 0; y0 = 0; dt = 1;
    % loop over all points
    for il =1:length(t5);

        x = t5(il,1);
        y = t5(il,2);
        z = t5(il,3);
        allcount = allcount + 1.;
        i2 = i2+1;

        % calculate distance from center point and sort wrt distance
        di = sqrt(((ZG.a.Longitude-x)*cosd(y)*111).^2 + ((ZG.a.Latitude-y)*111).^2 + ((ZG.a.Depth - z)).^2 ) ;
        [s,is] = sort(di);

        l2 = find(is <= 300);


        %[cumu, xt] = hist(b.Date,(t0b:(teb-t0b)/99:teb));

        zvg(t5(il,5),t5(il,6),t5(il,7),:) = is(1:300);
        ram(t5(il,5),t5(il,6),t5(il,7),:) = di(is(1:300));
        if rem(allcount,20) == 0;  waitbar(allcount/itotal) ;end
    end  % for xt5
    % save data
    %
    catSave3 =...
        [ 'zmap_message_center.set_info(''Save Grid'',''  '');think;',...
        '[file1,path1] = uiputfile(fullfile(ZmapGlobal.Data.data_dir, ''*.mat''), ''Grid Datafile Name?'') ;',...
        ' sapa2 = [''save '' path1 file1 '' zvg ram gx gy gz dx dy dz  ZG.bin_days tdiff t0b teb a main faults mainfault coastline yvect xvect tmpgri ll''];',...
        ' if length(file1) > 1, eval(sapa2),end , done']; eval(catSave3)

    close(wai)
    watchoff

    gz = -gz;
    zv2 = zvg;
    sel = 'no';
    tdiff = teb-t0b;

    lta_winy = tdiff/5;
    zv4 = zv2;
    tiz = 10;
    slicemapz('new');

end  % if cal


end
