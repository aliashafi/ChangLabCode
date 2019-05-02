clear all
close all


addpath(genpath('/Users/alia/Documents/tVNS/code/ctmr_guipackage'))
addpath(genpath('/Users/alia/Documents/tVNS/code/cbrewer'));

%%

% subj1 = 'pt394';
subj2 = 'pt399';
hemi = 'rh';
imaging_rootdir = '/Users/alia/Documents/dura/data_store2/imaging/subjects/Iowa';

% plotting params
% elec_size = 120;
% elec_color = 'r';

%% LOAD DATA elecs for all the subjects you want on the MNI brain
%load each elecs_all file one at a time and rename the elecmatrix
%load([imaging_rootdir filesep subj1 filesep 'elecs' filesep 'elecs_all_RAS_warped.mat']);
%load([imaging_rootdir filesep subj2 filesep 'elecs' filesep 'elecs_all_RAS_warped.mat']);
load(['/Users/alia/Documents/dura/data_store2/imaging/subjects/pt399_Iowa/elecs/elecs_all_RAS.mat'])
% load(['/Users/alia/Documents/dura/data_store2/imaging/subjects/pt394_Iowa/elecs/elecs_all_RAS_warped.mat'])

%loads the MNI rh_pial as cortex
load(['/Users/alia/Documents/dura/data_store2/imaging/subjects/pt399_Iowa/Meshes/pt399_Iowa_rh_pial.mat']);
%% PLOT BRAIN
 
figure;
 
ctmr_gauss_plot(cortex,[0 0 0],0,hemi);
%% get desired elecs as elecs matrix
cd /Users/alia/Documents/mandarin/

chan_stats = readtable('max_zscores.csv');

%% 
hold on;
% elecs = ][]
% for i = 1:256;
%     num = chan_stats(i,1);
%     disp(num)
%     elecs1 = elecmatrix(num,1:3);
%     elecs = [elecs;elecs1];
%  end

% stats = chan_stats(:,'zscore');
stats = chan_stats(:,'zscore');
% stats = table2array(stats);
%%
for i = 1:size(stats)
        if stats(i) > 16
       stats(i) = 16;
    end
end


%% normalize values of statistics
% normalize data between 1 and 101 (where lowest value is 1)
%     % only include blues if there are negative values
if stats > 1
    color_range = [min(stats), max(stats)];
    stat_min = min(stats);
    stat_max = max(stats);
    map_min = 1;
    map_max = 101;
    
%normalize
    stats = map_min + ((stats-stat_min)*(map_max - map_min))/(stat_max - stat_min);
else
% save color range
     color_range = [min(stats), max(stats)];
% 
%     % get maxes and minses
     stat_min = min(stats);
     stat_max = max(stats);
% 
     map_min = 1;
     map_max = 101;
     stats = map_min + ((stats-stat_min)*(map_max - map_min))/(stat_max - stat_min);

 end



%% Make Colormap
cd /Users/alia/Documents/tVNS/code
if stat_min < 0
    cmap = flipud(cbrewer('div','Reds',101)); % value between 1 and 101
else
    cmap = cbrewer('seq','Reds',101); % value between 1 and 101
end

%% PLOT BRAIN
figure(1);
c_h = ctmr_gauss_plot(cortex,[0 0 0],0,'bottom',0);
% c_h1 = ctmr_gauss_plot(lh,[0 0 0],0,'rh',0);
% set (c_h, 'FaceColor', 'y','EdgeColor','y', 'FaceAlpha', fa,'EdgeAlpha', ea);


% hipp = ctmr_gauss_plot(hipp_mesh,[0 0 0],0,'rh', 0);
% stg = ctmr_gauss_plot(stg_mesh,[0 0 0],0,'rh', 0);
% thal = ctmr_gauss_plot(thal_mesh,[0 0 0],0,'rh', 0);
% 
% 
% set (hipp, 'FaceColor', 'y','EdgeColor','y', 'FaceAlpha', fa,'EdgeAlpha', ea);
% set (stg, 'FaceColor', 'b','EdgeColor','b', 'FaceAlpha', fa,'EdgeAlpha', ea);
% set (thal, 'FaceColor', 'g','EdgeColor','g', 'FaceAlpha', fa,'EdgeAlpha', ea);

% edge alpha for all
ea = .3;
%face alpha for all
fa = .2;
% 
set (c_h, 'EdgeAlpha', .2, 'FaceAlpha', .2); 
% set (c_h1, 'EdgeAlpha', .2, 'FaceAlpha', .2); 
%%
important_elecs = [166,165,164,174,173,172,182,181,180,190,189,188,198,197,196,206,205,204,214,213,212,221,220,222,228,229,230,237,236,245,244,253,252,13,14,15,32,33,16,34,17,35,18,36,19,37,20,38,21,22,23,119,120,121]
important_elecs = important_elecs'
HG_elecs = [13,14,15,32,33,16,34,17,35,18,36,19,37,20,38,21,22,23]
HG_elecs = HG_elecs'
MGB = [119,120,121]
%% edit elecs to pop up on brain 

hold on;
cond_number=6;
ints = uint8(stats);
for i = 1:size(ints)
    if ismember(i-1,MGB) == 1
        disp(i)
        num = ints(i);
        color = cmap(num,1:3);
%         el_add(elecmatrix(i,1:3), 'color', color, 'msize', 10, 'edgecol', 'k')
        el_add(elecmatrix(i,1:3), 'color', color, 'msize', 10, 'edgecol', 'k', 'number',i)

    end
%     if ismember(i-1,important_elecs) == 0 
%         num = ints(i);
%         color = cmap(num,1:3);
%         el_add(elecmatrix(i,1:3), 'color', color, 'msize', 10)  
%     end
end

hold on

    
%% color bar
% colormap(cmap)
% %axes('Clim', color_range)
% cbh=colorbar('h');
% colorbar

cmap = cbrewer('seq','Reds',100);
c = colorbar;
c.Ticks = [-1,0,1]; % <- the default tick locations are between -1 and 1
% change tick labels to whatever you want
c.TickLabels = [round(stat_min,1) round(mean([stat_min,stat_max]),1) round(stat_max,1)];
colormap(c,cmap); % <- changes the colormap of the colorbar to whatever cmap you want.

