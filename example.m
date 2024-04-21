% For each element of the matrix, (ignoring the first and last row and column of elements),
% if the element is still larger than the average of the four cornor elements of the matrix (that is, the elements you ignored before), 
% replace that element with the highest value of the FOUR elements around it (above, below, right, and left). 
% Ignore the diagonals around the element (only up,down and left, right)!
clc,clear,close
load('ranDATA.mat');
[row,col]=size(random_data);
point_m38=input('Enter a location [i, j]');
    
for i=2:row-1
    for j=2:col-1
        if random_data(i,j) > mean([random_data(1,1),random_data(row,1),random_data(1,col),random_data(row,col)])
            random_data(i,j)=max([random_data(i-1,j),random_data(i+1,j),random_data(i,j-1),random_data(i,j+1)]);
        end
    end
end







