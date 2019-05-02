clear all
close all


addpath(genpath('/Users/alia/Documents/tVNS/code/ctmr_guipackage'))
addpath(genpath('/Users/alia/Documents/tVNS/code/cbrewer'));

%%

subj = 'pt399';
hemi = 'rh';
imaging_rootdir = '/Users/alia/Documents/dura/data_store2/imaging/subjects/';

% plotting params
% elec_size = 120;
% elec_color = 'r';
%% LOAD DATA elecs for all the subjects you want on the MNI brain
load(['/Users/alia/Documents/dura/data_store2/imaging/subjects/pt399_Iowa/elecs/elecs_all_RAS.mat'])

%loads the MNI rh_pial as cortex
load(['/Users/alia/Documents/dura/data_store2/imaging/subjects/pt399_Iowa/Meshes/pt399_rh_pial.mat'])
%% get data for the matrix
chan_stats = readtable('data.csv');
 
hold on;
elecs = [];
for i = 1:size(chan_stats,1)
    num = chan_stats{i,1};
    elecs1 = elecmatrix(num,1:3);
    elecs = [elecs;elecs1];
end
%
SNR = chan_stats(:,'RMS');
stats = table2array(SNR);

%% run this if you want to look at the HG
chan_stats = readtable('data.csv');
 
hold on;
elecsHG = [];
% for i = 33:40
%     num = chan_stats{i,1};
%     elecs1 = elecmatrix(num,1:3);
%     elecsHG = [elecsHG;elecs1];
% end
for i = 13:24
    num = chan_stats{i,1};
    elecs1 = elecmatrix(num,1:3);
    elecsHG = [elecsHG;elecs1];
end
%
SNR = chan_stats(:,'RMS');
stats = table2array(SNR);
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
cmap = cbrewer('seq','Reds',101); % value between 1 and 101
%% PLOT BRAIN
figure(1);
c_h = ctmr_gauss_plot(cortex,[0 0 0],0,'rh');
HG = ctmr_gauss_plot(mesh, [0 0 0], 0, 'rh', 0);
set (HG, 'FaceColor', 'c','EdgeColor','c','FaceAlpha', .4,'EdgeAlpha', .4);
set (c_h, 'EdgeAlpha', .1, 'FaceAlpha', .1);

%% PLOT ELECS (WITH DATA)

hold on;
cond_number=6;
ints = uint8(stats);
for i = 1:size(ints)
    num = ints(i);
    color = cmap(num,1:3);
    el_add(elecs(i,1:3), 'color', color, 'msize', 8)
end

hold on;
%% color bar
colormap(cmap)
% axes('Clim', color_range)
cbh=colorbar('h');
colorbar
