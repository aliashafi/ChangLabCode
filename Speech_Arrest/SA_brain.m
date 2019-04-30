hold on
%lighting will be set from L or R depending on hem
hem = 'rh';
%this plots the right hemisphere
c_h = ctmr_gauss_plot(rh, [0 0 0], 0, hem, 1); 

map_min = 5;
map_max = 17;
for i = 1:size(sizeC);
    stat_min = min(sizeC);
    stat_max = max(sizeC);
    statC = map_min + ((sizeC-stat_min)*(map_max - map_min))/(stat_max - stat_min);
end

for i = 1:size(sizeM);
    stat_min = min(sizeM);
    stat_max = max(sizeM);
    statM = map_min + ((sizeM-stat_min)*(map_max - map_min))/(stat_max - stat_min);
end

for i = 1:size(sizeO);
    stat_min = min(sizeO);
    stat_max = max(sizeO);
    statO = map_min + ((sizeO-stat_min)*(map_max - map_min))/(stat_max - stat_min);
end


for i = 1:size(sizeW);
    stat_min = min(sizeW);
    stat_max = max(sizeW);
    statW = map_min + ((sizeW-stat_min)*(map_max - map_min))/(stat_max - stat_min);
end



for i = 1:size(elecmatrixM,1)
    el_add(elecmatrixM(i,:),'color','b','edgecol','k', 'msize',statM(i))
end

for i = 1:size(elecmatrixW,1)
    el_add(elecmatrixW(i,:),'color','r','edgecol','k', 'msize',statW(i))
end

for i = 1:size(elecmatrixC,1)
    el_add(elecmatrixC(i,:),'color','g', 'edgecol','k', 'msize',statC(i))
end

for i = 1:size(elecmatrixO,1)
    el_add(elecmatrixO(i,:),'color','y','edgecol','k', 'msize',5)
end

