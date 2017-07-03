function G = HaarGen(H,xscale,yscale,pos)
%-H is a matrix describing the shape of the Haar featue, 1 = white, 0 = black Examples: H = [0 1 0], H = [0;1]
%-pos = [x,y] giving the bottom right coordinate of the first box
%-xscale,yscale number of rows of and columns first pixel respectivley
%-G = nx3 = (number of boxes)x(coordinates + color)


rH = size(H,1); %rH and cH will give the number of entries of H, but also its orientation
cH = size(H,2);

% if rH > 1 && cH > 1 %This limits us to certain Haar features. It can't have more than one column and more than one row
%     G = 'error';
    
if rH == 1 && cH > 1
    G = zeros(cH,3);
    G(1,:) = [pos(1),pos(2),H(1)];
    for l = 2:cH
        G(l,:) = [pos(1) + xscale*(l-1),pos(2),H(l)];
    end
    
elseif rH > 1 && cH == 1
    G = zeros(rH,3);
    G(1,:) = [pos(1),pos(2),H(1)];
    for l = 2:rH
        G(l,:) = [pos(1),pos(2)+ yscale*(l-1),H(l)];
    end
    
elseif rH == 2 && cH == 2
    G = zeros(4,3);
    G(1,:) = [pos(1),pos(2),H(1,1)];
    
    G(2,:) = [pos(1) + xscale,pos(2),H(1,2)];
    
    G(3,:) = [pos(1),pos(2) + yscale,H(2,1)];
    
    G(4,:) = [pos(1) + xscale,pos(2) + yscale,H(2,2)];
    
    for l = 2:rH
        G(l + cH - 1,:) = [pos(1),pos(2)+ yscale*(l-1),H(l)];
    end
    
%%Start of a more general case, but not necissary yet.
% elseif rH == cH
%     G = zeros(rH*cH,3);
%     G(1,:) = [pos(1),pos(2),H(1)];
%     
%     for l = 2:cH
%         G(l,:) = [pos(1) + xscale*(l-1),pos(2),H(1,l)];
%     end
%     
%     for l = 2:rH
%         G(l + cH - 1,:) = [pos(1),pos(2)+ yscale*(l-1),H(l)];
%     end
    
else
%     G = [pos(1),pos(2),H(1)];
    
end


    