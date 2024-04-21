% ENGI 1331H Project2-王宇涵-2220213666
function[mask_complete]=MM(red,green,blue,RT,GT,BT)
% Create Mask based on red green and blue layers
% and the appropriate threshold values out is the 3D mask
mask_2D=red<RT&green>GT&blue<BT;
mask_complete=cat(3,mask_2D,mask_2D,mask_2D);
end