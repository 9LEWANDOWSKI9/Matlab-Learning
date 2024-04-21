% ENGI 1331H Project2-王宇涵-2220213666
function[masking_complete]=AM(background,object,mask3D)
% apply 3D mask to object image and replace the background image 
% as per the 3D mask
background(mask3D)=object(mask3D);
masking_complete=background;
end