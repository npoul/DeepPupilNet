% ------------------------------------------------------------------------
%
% DeepPupil Net: Deep Residual Network for Precise Pupil Center Localization 

% This sample code tests the DeepPupilNet eye center localizer, which was 
% trained on MUCT, BioID and Gi4E face databases. This script requires the 
% Deep Learning Toolbox.
%
% Tested on Matlab 2020b
%
% Copyright @ Poulopoulos Nikoloas, npoul@ceid.upatras.gr
% Department of Computer Engineering & Informatics, University of Patras
%
% Please cite the following paper if you are using this code:
% N. Poulopoulos and E. Z. Psarakis, "DeepPupil Net: Deep Residual Network 
% for Precise Pupil Center Localization", VISAPP, vol. 5, pp. 297-304, 2022
%
% ------------------------------------------------------------------------

clear;
clc;

% Load the trained DeepPupilNet eye localization network
load('DeepPupilNet.mat');

% Find sample images
cd Images
d = dir;
d = d(3:end);
cd ..

for i=1:length(d)
    
    % Read every sample image
    cd Images
    Im = imread(d(i).name);
    cd ..
    
    % Estimate the eye center coordinates
    Coords = eye_localization(Im,net);
    
    % Display the results
    figure, imshow(Im), hold on;
    plot(Coords(1),Coords(2),'Marker','+','LineWidth',1.5);
    plot(Coords(3),Coords(4),'Marker','+','LineWidth',1.5);
    hold off;
    
end
