clear all
close all


addpath(genpath('/Users/alia/Documents/tVNS/code/ctmr_guipackage'))
addpath(genpath('/Users/alia/Documents/tVNS/code/cbrewer'));

%%

subj = 'pt399';
hemi = 'rh';
block1 = '049';
block2 = '020';
block = '22';
imaging_rootdir = '/Users/alia/Documents/dura/data_store2/imaging/subjects/';


%% LOAD DATA elecs for all the subjects you want on the MNI brain
%load each elecs_all file one at a time and rename the elecmatrix
%load([imaging_rootdir filesep subj1 filesep 'elecs' filesep 'elecs_all_RAS_warped.mat']);
%load([imaging_rootdir filesep subj2 filesep 'elecs' filesep 'elecs_all_RAS_warped.mat']);
% load(['/Users/alia/Documents/dura/data_store2/imaging/subjects/pt399_Iowa/Meshes/pt399_rh_pial.mat'])

load(['/Users/alia/Documents/dura/data_store2/imaging/subjects/pt399_Iowa/Meshes/pt399_rh_pial.mat'])

%% PLOT BRAIN
 
figure;
 
ctmr_gauss_plot(cortex,[0 0 0],0,hemi);
%% get desired elecs as elecs matrix

load(['/Users/alia/Documents/dura/data_store2/imaging/subjects/pt399_Iowa/elecs/elecs_all_RAS.mat'])

%% normalize values of statistics
% normalize data between 1 and 101 (where lowest value is 1)
%     % only include blues if there are negative values

stats = allstats(:,2)
%tone 1
if stats > 1
    color_range = [min(stats), max(stats)];
    stat_min = min(stats);
    stat_max = max(stats);
    map_min = 1;
    map_max = 100;
    
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
     map_max = 100;
     stats = map_min + ((stats-stat_min)*(map_max - map_min))/(stat_max - stat_min);

end

%% plot elecsize

for i = 1:11
    el_add(elecmatrix(i,:), 'msize', time(i))
end


%% Make Colormap
if stat_min > 0
    cmap = cbrewer('seq','PuRd',100); % value between 1 and 101
else
    cmap = cbrewer('seq','PuRd',100); % value between 1 and 101
end

%% PLOT BRAIN
figure(1);

RH = ctmr_gauss_plot(rh,[0 0 0],0,'rh',1);
% LH = ctmr_gauss_plot(lh, [0 0 0],0,'rh',1);
% title('Beta Permutation')
ea = .3;
%face alpha for allx

fa = .3;
% % 
% HG = ctmr_gauss_plot(mesh, [0 0 0], 0, 'rh', 0);
% stg = ctmr_gauss_plot(STG, [0 0 0], 0, 'top', 1);
% 
% 
% set (HG, 'FaceColor', 'b');
% set (stg, 'EdgeAlpha', .1, 'FaceAlpha', .5);

% set (stg) 

% set (LH, 'EdgeAlpha', .3, 'FaceAlpha', .2); 

% set (RH, 'EdgeAlpha', .3, 'FaceAlpha', .2); 

%% move elecs up so it looks better
% elecmatrix(:,3) = elecmatrix(:,3)+2

elecmatrix(:,3) = elecmatrix(:,3)+2


%% PLOT ELECS (WITH DATA)

%% PLOT ELECS (WITH DATA)

hold on;
% for i = 1:size(ints)
%     num = ints(i);
%     color = cmap(num,1:3);
%     el_add(elecmatrix(i,1:3), 'color', color, 'msize', time(i,1));
% end
 for i = 1:numel(neg_table.channel);
     i
     for j = 1:numel(neg_table.stat_normed);
        h = neg_table.channel(i);
        m = neg_table.stat_normed(j);
     
        test = ismember(h,hg_elecs)
        sig = ismember(h, sig_chans)
        if test == 1;
            if sig == 1;
                color = cmap(m,1:3);
                el_add(elecmatrix(h,1:3),'color', color, 'msize', 8, 'numbers', [h]);
            end
%      el_add(elecmatrix(i,1:3),'color', color, 'msize', 8, 'numbers', [i]);
        end
     end

%      hold off
%      alpha(s,.3)
 end
for a = 1:numel(pos_table.channel);
     for b = 1:numel(pos_table.stat_normed);
         x = pos_table.channel(a);
         y = pos_table.stat_normed(b);
         test = ismember(x,hg_elecs)
         sig = ismember(x, sig_chans)
         if test == 1;
             if sig == 1;
                 color = cmap(y,1:3);
                 el_add(elecmatrix(x,1:3),'color', color, 'msize', 8,'numbers', [x]);
             
             end
         end
     end
end
hold on

    

%% PLOT All elecs (WITH DATA)

hold on;

 for i = 1:numel(stats);
    h = sig_chans(i);
    m = stats(i);
    m = round(m)
    color = cmap(m,1:3);
    %            el_add(elecmatrix(h,1:3),'color', color, 'msize', 8, 'numbers',[h]);
    el_add(elecmatrix(h,1:3),'color', color, 'msize', 8);
 end
     



hold on;

%% color bar
% colormap(cmap)
% axes('Clim', color_range)
% colorbar('h');
% colorbar

% cmap = cbrewer('seq','YlOrRd',100);
c = colorbar;
c.Ticks = [-1,0,1]; % <- the default tick locations are between -1 and 1
% change tick labels to whatever you want
c.TickLabels = [round(stat_min,1) round(mean([stat_min,stat_max]),1) round(stat_max,1)];
colormap(c,cmap); % <- changes the colormap of the colorbar to whatever cmap you want.
%% plot circles

x = 1:10;
for i = 1:10
    scatter(y, x, time(i,1));
end

