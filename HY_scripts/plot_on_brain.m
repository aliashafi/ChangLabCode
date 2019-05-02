table_matrix = NaN(length(tvals),3);
        table_matrix(:,1) = 1:length(tvals); % channel
        table_matrix(:,2) = sig_chans; % is significant
        table_matrix(:,3) = tvals; % test statistic
        stattable = array2table(table_matrix,'VariableNames',{'channel','is_sig','test_statistic'});
        
        non_sig_chans = unique(stattable(stattable.is_sig < 1,:).channel);
        sig_table = stattable(stattable.is_sig > 0,:);
        sig_chans = unique(sig_table.channel);

        abs_min = abs(min(sig_table.test_statistic));
        abs_max = abs(max(sig_table.test_statistic));
        if abs_max > abs_min
            % positive stats
            pos_table = sig_table(sig_table.test_statistic>0,:);
            pos_stats = pos_table.test_statistic;
            map_min = 51;
            map_max = 100;
            stat_min = 0;
            stat_max = max(pos_stats);  
            if stat_min == stat_max
                pos_normed = 100;
            else
                pos_normed = round(map_min + ((pos_stats-stat_min)*(map_max - map_min))/(stat_max - stat_min));
            end
            pos_table.stat_normed = pos_normed;
            
            % negative stats
            neg_table = sig_table(sig_table.test_statistic<0,:);
            neg_stats = neg_table.test_statistic;
            map_min = 1;
            map_max = 50;
            stat_min = -1*stat_max;
            stat_max = 0;
            if stat_min == stat_max
                neg_normed = 1;
            else
                neg_normed = round(map_min + ((neg_stats-stat_min)*(map_max - map_min))/(stat_max - stat_min));
            end
            neg_table.stat_normed = neg_normed;

            
        elseif abs_min > abs_max
            % negative stats
            neg_table = sig_table(sig_table.test_statistic<0,:);
            neg_stats = neg_table.test_statistic;
            map_min = 1;
            map_max = 50;
            stat_min = min(neg_stats);
            stat_max = 0;
            if stat_min == stat_max
                neg_normed = 1;
            else
                neg_normed = round(map_min + ((neg_stats-stat_min)*(map_max - map_min))/(stat_max - stat_min));
            end
            neg_table.stat_normed = neg_normed;

            % positive stats
            pos_table = sig_table(sig_table.test_statistic>0,:);
            pos_stats = pos_table.test_statistic;
            map_min = 51;
            map_max = 100;
            stat_max = -1*stat_min;  
            stat_min = 0;
            if stat_min == stat_max
                pos_normed = 100;
            else
                pos_normed = round(map_min + ((pos_stats-stat_min)*(map_max - map_min))/(stat_max - stat_min));
            end
            pos_table.stat_normed = pos_normed;          
            
        end
        

        % recombine, sort by channel, and pull out new stats
        comb_table = vertcat(neg_table,pos_table);
        comb_table = sortrows(comb_table,'channel');
        stats_normed = comb_table.stat_normed;

        if abs_max > abs_min
            % set min and max for colorbar
            stat_max = max(pos_stats);
            stat_min = -1*stat_max;
        elseif abs_min > abs_max
            stat_min = min(neg_stats);
            stat_max = -1*stat_min;
        end

        % create color map
        cmap = flipud(cbrewer('div','RdBu',100));
    end