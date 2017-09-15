%% polyExtrude
% Below is a demonstration of the features of the |polyExtrude| function

%% Syntax
% |[F_tri,V_tri]=polyExtrude(Vc,cPar);|

%% Description
% The |polyExtrude| function can be used to extrude polygons to obtain
% patch data and generate CAD like model geometry. 

%% Examples

%%
clear; close all; clc;

%%
% Plot settings
figColor='w'; 
figColorDef='white';
fontSize=25;
markerSize1=45;
lineWidth1=4;
faceAlpha=1;

%% Example: EXTRUDING A PLANAR POLYGON

%Sketching profile
ns=150;
t=linspace(0,2*pi,ns);
t=t(1:end-1);
r=6+2.*sin(5*t);
[x,y] = pol2cart(t,r);
z=zeros(size(x));
Vc=[x(:) y(:) z(:)];

%%
% Plotting sketch
hf1=figuremax(figColor,figColorDef);
title('The sketch profile','FontSize',fontSize);
xlabel('X','FontSize',fontSize);ylabel('Y','FontSize',fontSize); zlabel('Z','FontSize',fontSize);
hold on;

plotV(Vc,'r-','lineWidth',lineWidth1,'MarkerSize',markerSize1);

axis equal; view(3); axis tight;  grid on;  set(gca,'FontSize',fontSize);
drawnow;

%%

% Extruding model
cPar.pointSpacing=0.5;
cPar.depth=7; 
cPar.patchType='quad'; 
cPar.dir=0;
cPar.closeLoopOpt=1; 
[F,V]=polyExtrude(Vc,cPar);

%% 
% Plotting meshed model
hf2=figuremax(figColor,figColorDef);
title('The extruded planar polygon','FontSize',fontSize);
xlabel('X','FontSize',fontSize);ylabel('Y','FontSize',fontSize); zlabel('Z','FontSize',fontSize);
hold on;

hp=patch('faces',F,'Vertices',V); set(hp,'FaceColor','g','EdgeColor','k','FaceAlpha',faceAlpha);
% patchNormPlot(F_tri,V_tri);
plotV(Vc,'r-','lineWidth',lineWidth1,'MarkerSize',markerSize1);

axis equal; view(3); axis tight;  grid on;  set(gca,'FontSize',fontSize);
camlight headlight;
drawnow;

%% Example: EXTRUDING A TILTED PLANAR POLYGON

%Create rotation matrix
E=[0.25*pi 0 0]; %Euler angles
[R,~]=euler2DCM(E); %The rotation matrix
Vc=(R*Vc')'; %Rotate polygon

%%
% Plotting sketch
hf1=figuremax(figColor,figColorDef);
title('The sketch profile','FontSize',fontSize);
xlabel('X','FontSize',fontSize);ylabel('Y','FontSize',fontSize); zlabel('Z','FontSize',fontSize);
hold on;

plotV(Vc,'r-','lineWidth',lineWidth1,'MarkerSize',markerSize1);

axis equal; view(3); axis tight;  grid on;  set(gca,'FontSize',fontSize);
drawnow;

%%

% Extruding model
cPar.pointSpacing=0.5;
cPar.depth=7; 
cPar.patchType='tri_slash'; 
cPar.dir=0;
cPar.closeLoopOpt=1; 
[F,V]=polyExtrude(Vc,cPar);

%% 
% Plotting meshed model
hf2=figuremax(figColor,figColorDef);
title('The extruded planar polygon normal to polygon','FontSize',fontSize);
xlabel('X','FontSize',fontSize);ylabel('Y','FontSize',fontSize); zlabel('Z','FontSize',fontSize);
hold on;

hp=patch('faces',F,'Vertices',V); set(hp,'FaceColor','g','EdgeColor','k','FaceAlpha',faceAlpha);

plotV(Vc,'r-','lineWidth',lineWidth1,'MarkerSize',markerSize1);

axis equal; view(3); axis tight;  grid on;  set(gca,'FontSize',fontSize);
camlight headlight;
drawnow;

%%
% Alternative extrusion direction direction

% Extruding model
cPar.pointSpacing=0.5;
cPar.depth=7; 
cPar.patchType='tri'; 
cPar.dir=0;
cPar.n=[0 0 1];
cPar.closeLoopOpt=1; 
[F,V]=polyExtrude(Vc,cPar);

%% 
% Plotting meshed model
hf2=figuremax(figColor,figColorDef);
title('The extruded planar polygon in z-dir','FontSize',fontSize);
xlabel('X','FontSize',fontSize);ylabel('Y','FontSize',fontSize); zlabel('Z','FontSize',fontSize);
hold on;

hp=patch('faces',F,'Vertices',V); set(hp,'FaceColor','g','EdgeColor','k','FaceAlpha',faceAlpha);

plotV(Vc,'r-','lineWidth',lineWidth1,'MarkerSize',markerSize1);

axis equal; view(3); axis tight;  grid on;  set(gca,'FontSize',fontSize);
camlight headlight;
drawnow;

%% Example: EXTRUDING A NON-PLANAR POLYGON

%Sketching profile
ns=150;
t=linspace(0,2*pi,ns);
t=t(1:end-1);
r=6+2.*sin(5*t);
[x,y] = pol2cart(t,r);
z=1/10*x.^2; 

Vc=[x(:) y(:) z(:)];

%%
% Plotting sketch
hf1=figuremax(figColor,figColorDef);
title('The sketch profile','FontSize',fontSize);
xlabel('X','FontSize',fontSize);ylabel('Y','FontSize',fontSize); zlabel('Z','FontSize',fontSize);
hold on;

plotV(Vc,'r-','lineWidth',lineWidth1,'MarkerSize',markerSize1);

axis equal; view(3); axis tight;  grid on;  set(gca,'FontSize',fontSize);
drawnow;

%%

% Extruding model
cPar.pointSpacing=0.5;
cPar.depth=7; 
cPar.patchType='tri'; 
cPar.dir=0;
cPar.closeLoopOpt=1; 
[F,V]=polyExtrude(Vc,cPar);

%% 
% Plotting meshed model
hf2=figuremax(figColor,figColorDef);
title('The extruded non-planar polygon normal to polygon','FontSize',fontSize);
xlabel('X','FontSize',fontSize);ylabel('Y','FontSize',fontSize); zlabel('Z','FontSize',fontSize);
hold on;

hp=patch('faces',F,'Vertices',V); set(hp,'FaceColor','g','EdgeColor','k','FaceAlpha',faceAlpha);

plotV(Vc,'r-','lineWidth',lineWidth1,'MarkerSize',markerSize1);

axis equal; view(3); axis tight;  grid on;  set(gca,'FontSize',fontSize);
camlight headlight;
drawnow;

%% 
%
% <<gibbVerySmall.gif>>
% 
% _*GIBBON*_ 
% <www.gibboncode.org>
% 
% _Kevin Mattheus Moerman_, <gibbon.toolbox@gmail.com>
 
%% 
% _*GIBBON footer text*_ 
% 
% License: <https://github.com/gibbonCode/GIBBON/blob/master/LICENSE>
% 
% GIBBON: The Geometry and Image-based Bioengineering add-On. A toolbox for
% image segmentation, image-based modeling, meshing, and finite element
% analysis.
% 
% Copyright (C) 2017  Kevin Mattheus Moerman
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
