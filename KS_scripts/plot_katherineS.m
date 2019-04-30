hold on

g2 = [50/255 205/255 50/255]
c2 = [148/255 0/255 211/255]
r2 = 'b'
% [186/255 85/255 211/255]
y2 = [1 165/255 0]
%lighting will be set from L or R depending on hem
hem = 'lh';
% %this plots the right hemisphere
c_h = ctmr_gauss_plot(lh, [0 0 0], 0, hem, 1); 
c_h1 = ctmr_gauss_plot(rh, [0 0 0], 0, hem, 1); 
% 
% % % Plot insula lol
% Lins_handle = ctmr_gauss_plot(lIns, [0 0 0], 0, hem, 0); 
% Rins_handle = ctmr_gauss_plot(rIns, [0 0 0], 0, hem, 0); 
% % 
% % % 
% % %plot hippo
% lhipp_handle = ctmr_gauss_plot(lHipp, [0 0 0], 0, hem, 0);
% rhipp_handle = ctmr_gauss_plot(rHipp, [0 0 0], 0, hem, 0);
% % % 
% % %plot cingulate
% lcing_handle = ctmr_gauss_plot(lCing, [0 0 0], 0, hem, 0); 
% rcing_handle = ctmr_gauss_plot(rCing, [0 0 0], 0, hem, 0); 
% % % 
% % %plot Amygdala
% lamyg_handle = ctmr_gauss_plot(lAmyg, [0 0 0], 0, hem, 0);
% ramyg_handle = ctmr_gauss_plot(rAmyg, [0 0 0], 0, hem, 0);
% % % 
% % %plot insula
% % lins_handle = ctmr_gauss_plot(lIns, [0 0 0], 0, hem, 0); 
% % rins_handle = ctmr_gauss_plot(rIns, [0 0 0], 0, hem, 0); 
% % 
% % %plot OFC
% lOFC_handle = ctmr_gauss_plot(lOFC, [0 0 0], 0, hem, 0); 
% rOFC_handle = ctmr_gauss_plot(rOFC, [0 0 0], 0, hem, 0); 



%edge alpha for all
ea = .3;
%face alpha for all
fa = .2;

set (c_h, 'EdgeAlpha', .3, 'FaceAlpha', .4); 
set (c_h1, 'EdgeAlpha', .3, 'FaceAlpha', .4);
% % 
% set (lhipp_handle, 'FaceColor', y2,'EdgeColor',y2, 'FaceAlpha', fa,'EdgeAlpha', ea);
% set (rhipp_handle, 'FaceColor', y2,'EdgeColor',y2, 'FaceAlpha', fa,'EdgeAlpha', ea);
% % % 
% % set (lins_handle, 'FaceColor', 'b', 'EdgeColor','b','FaceAlpha', fa,'EdgeAlpha', ea);
% % set (rins_handle, 'FaceColor', 'b', 'EdgeColor','b','FaceAlpha', fa,'EdgeAlpha', ea);
% % % 
% set (lamyg_handle, 'FaceColor', c2, 'EdgeColor',c2,'FaceAlpha', fa,'EdgeAlpha', ea);
% set (ramyg_handle, 'FaceColor', c2, 'EdgeColor',c2,'FaceAlpha', fa,'EdgeAlpha', ea);
% % % 
% % % 
% set (lcing_handle,  'EdgeColor',r2,'FaceAlpha', fa,'EdgeAlpha', ea);
% set (rcing_handle,  'EdgeColor',r2,'FaceAlpha', fa,'EdgeAlpha', ea);
% % % 
% % 
% set (lOFC_handle, 'FaceColor', g2, 'EdgeColor',g2,'FaceAlpha', fa,'EdgeAlpha', ea);
% set (rOFC_handle, 'FaceColor', g2, 'EdgeColor',g2,'FaceAlpha', fa,'EdgeAlpha', ea);




% plot gray elecs
grey = [.7 .7 .7];
a = 6; 


%Set color scheme for all the elecs
% all_color = [0.7    0.75    0.71];
all_coloe = 'b'
brown = [.3 .8 0];
brown = [0.25 0.25 0.25];

%Set color scheme for highlighted elecs 

%el_add(allelec,'color',brown,'edgecol','none','mtype','o','msize',6, 'numbers', [],'LineWidth', 0.02);
% el_add(([1:5460],:),'color',all_color,'msize',6, 'edgecol','none', 'numbers', [], 'LineWidth', 0.02);

%Hippocamous 
% el_add(Hippelecs,'color','y','msize',6, 'edgecol',brown, 'numbers', [],'LineWidth', 0.02);
% 
% %OFC
% el_add(OFCelecs,'color','g','msize',6, 'edgecol',brown, 'numbers', [],'LineWidth', 0.02);
% 
% %el_add(allelec([4327:4329],:),'color','g','msize',6, 'edgecol',brown, 'numbers', [],'LineWidth', 0.02);
% % 
% % % %Insula 
% % el_add(ID,'color','b','msize',6, 'edgecol',brown, 'numbers', [],'LineWidth', 0.02);
% % % 
% % % % %Amygdala
% el_add(Amygelecs,'color','c','msize',6, 'edgecol',brown, 'numbers', [],'LineWidth', 0.02);
% % 
% % %Cingulate 
% el_add(Cingelecs, 'color','m','msize',6, 'edgecol',brown, 'numbers', [],'LineWidth', 0.02);

color = [.7 .7 .7];
color = 'b';

m = 6
el_add(elecmatrix82,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix84,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix87,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix91,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix92,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix96,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix99,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix100,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix107,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix108,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix110,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix111,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix112,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix113,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix115,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix118,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix119,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix125,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix129,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix130,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix131,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix132,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix133,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix135,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix136,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix137,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix139,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix142,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix143,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix144,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix148,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix150,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix152,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix153,'color',color,'msize',m, 'edgecol',brown)
% el_add(elecmatrix154,'color',color,'msize',6, 'edgecol',brown)
el_add(elecmatrix155,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix156,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix158,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix159,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix160,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix162,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix166,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix170,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix175,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix178,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix179,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix182,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix183,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix184,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix186,'color',color,'msize',m, 'edgecol',brown)
% el_add(elecmatrix187,'color',color,'msize',m, 'edgecol',brown)
el_add(elecmatrix188,'color',color,'msize',m, 'edgecol',brown)
% el_add(elecmatrix189,'color',color,'msize',m, 'edgecol',brown)
% el_add(elecmatrix190,'color',color,'msize',m, 'edgecol',brown)






% el_add(elecmatrixKP01,'color',color,'msize',6, 'edgecol',brown)
% el_add(elecmatrixKP06,'color',color,'msize',6, 'edgecol',brown)
% el_add(elecmatrixKP20,'color',color,'msize',6, 'edgecol',brown)
% el_add(elecmatrixKP27,'color',color,'msize',6, 'edgecol',brown)
% % 


%Hippocamous 
% el_add(Hippelecs,'color',y2,'msize',6, 'edgecol',brown, 'numbers', [],'LineWidth', 0.02);

%OFC
% el_add(OFCelecs,'color',g2,'msize',6, 'edgecol',brown, 'numbers', [],'LineWidth', 0.02);
% 
% %el_add(allelec([4327:4329],:),'color','g','msize',6, 'edgecol',brown, 'numbers', [],'LineWidth', 0.02);
% % 
% % % %Insula 
% % el_add(ID,'color','b','msize',6, 'edgecol',brown, 'numbers', [],'LineWidth', 0.02);
% % % 
% % % % %Amygdala
% el_add(Amygelecs,'color',c2,'msize',6, 'edgecol',brown, 'numbers', [],'LineWidth', 0.02);
% % 
% % %Cingulate 
% el_add(Cingelecs, 'color',r2,'msize',6, 'edgecol',brown, 'numbers', [],'LineWidth', 0.02);











