%Brute Force匹配和FLANN匹配是OpenCV二维特征点匹配常见的两种办法，分别对应BFMatcher（BruteForceMatcher）和FlannBasedMatcher。
%二者的区别在于BFMatcher总是尝试所有可能的匹配，从而使得它总能够找到最佳匹配，这也是Brute Force（暴力法）的原始含义。而FlannBasedMatcher中FLANN的含义是Fast Library forApproximate Nearest Neighbors，从字面意思可知它是一种近似法，算法更快但是找到的是最近邻近似匹配，所以当我们需要找到一个相对好的匹配但是不需要最佳匹配的时候往往使用FlannBasedMatcher。当然也可以通过调整FlannBasedMatcher的参数来提高匹配的精度或者提高算法速度，但是相应地算法速度或者算法精度会受到影响

function [pose, bestHits] = BruteMatch(gridmap, scan, pose,...
                            bruteResolution, tmax, rmax)
% Grid map information
metricMap = gridmap.metricMap;
ipixel = 1 / gridmap.pixelSize;
minX   = gridmap.topLeftCorner(1);
minY   = gridmap.topLeftCorner(2);
nCols  = size(metricMap, 2);
nRows  = size(metricMap, 1);

% Search space                               
xs = pose(1) - tmax : bruteResolution(1) : pose(1) + rmax;
ys = pose(2) - tmax : bruteResolution(2) : pose(2) + rmax;
rs = pose(3) - rmax : bruteResolution(3) : pose(3) + rmax;
nx = length(xs);    ny = length(ys);    nr = length(rs);

% Searching
pixelScan = scan * ipixel;
scores = Inf(nx, ny, nr);
bestScore = Inf;

% Rotation
for ir = 1 : nr
    
    theta = rs(ir);
    ct = cos(theta);
    st = sin(theta);
    S  = pixelScan * [ct, st; -st, ct];
    
    % Translation along x-axis
    for ix = 1 : nx
        
        tx = xs(ix);
        Sx = round(S(:,1)+(tx-minX)*ipixel) + 1;
        
        % Translate along y-axis
        for iy = 1 : ny
            
            ty = ys(iy);
            Sy = round(S(:,2)+(ty-minY)*ipixel) + 1;
            
            % Metric score
            isIn = Sx>1 & Sy>1 & Sx<nCols & Sy<nRows;
            idx  = Sy(isIn) + (Sx(isIn)-1)*nRows;
            hits = metricMap(idx);
            score = sum(hits);
            
            scores(ix, iy, ir) = score;
            
            if score < bestScore
                bestScore = score;
                bestHits = hits;
                pose = [tx; ty; theta];
            end
            
        end  
    end
end
