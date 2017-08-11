%% This script runcias find first a maximum of all z-vlaues over all
% frames and afterward produced a movie and start the movieviever
% Last edit: Stefan Wiemer 11/94

report_this_filefun(mfilename('fullpath'));
think


j = 0;
it = 20
iwl = iwl3/days(ZG.bin_days);
[len, ncu] = size(cumuall);
len = len -2;
step = len/nustep;


ma = [];
mi = [];

wai = waitbar(0,'Please wait...')
set(wai,'Color',[0.8 0.8 0.8],'NumberTitle','off',...
    'Name','fin_max -Percent done','pos',[ZG.welcome_pos 300 80]);


pause(0.1)
% find maximu for scaling
%
for it = 1:step:len-iwl;
    fin_malt
    waitbar(it/len)
end   % for i
close(wai)

ZG.maxc = max(max(ma));
ZG.minc = min(min(mi));

%set up movie axes
%
figure
tmp = gcf

cin_lta
axes(has)
fs_m = get(gcf,'pos');

m = moviein(length(1:step:len-iwl));

wai = waitbar(0,'Please wait...')
set(wai,'Color',[0.8 0.8 0.8],'NumberTitle','off',...
    'Name','Movie -Percent done','pos',[ZG.welcome_pos 300 80]);
pause(0.1)

for it = 1:step:len-iwl;
    j = j+1;
    cin_lta
    axes(has)
    m(:,j) = getframe(has);
    figure_w_normalized_uicontrolunits(wai)
    waitbar(it/len)
end   % for i

close(tmp)
close(wai)

% save movie
%
clear newmatfile

[newmatfile, newpath] = uiputfile('*.mat', 'Save As');

if length(newpath)  > 1 
    save([newpath newmatfile file1])
    showmovi
else
    showmovi
end

