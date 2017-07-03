function [w1,w1test] = HaarAttempt(I,flag)

H1 = [1 0]; H2 = [0 1]; H3 = [1; 0]; H4 = [0; 1]; H5 = [0 1 0]; H6 = [1 0 1]; %base Haar featueres to be used

if flag == 1 %This is required if we are not starting with 24x24 integrated images
    I = im2double(imresize(I,[24 24])); %Resize image, and convert to double

    I = integralimage(I); %Integrate image
else 
end

% pic = im2double(imresize(I,[24 24]));

%Based on H1
w1 = [0 0 0 0 0 0 0]; % [weight,x top left corner, y top left corner, width, height]
n1 = 0;
w1test = [0 0 0 0 0 0 0];
n1test = 0;
%Here we compare a bunch of features based on H1 to the image. Useful data is stored in w1
%The x any y scale of the first box of the Haar feature are give by p and q respectivley.
%The x and y coordinates of the bottom left corner of the first box are given by j and k
%The last line adjusts x, y, p, and q, as to be more useful
for p = 2:10
    for j = (p+1):(24 - p)
        for q = 2:10
            for k = (q+1):(24)
                wnew1 = Haarweight(I,H1,p,q,[j k],1,2);
                n1test = n1test + 1;
                w1test(n1test,:) = [wnew1 (j - p + 1) (k - q + 1) (2*p) (q) j k];
                if wnew1 > 0.2
                    n1 = n1 + 1;
                    w1(n1,:) = [wnew1 (j - p + 1) (k - q + 1) (2*p) (q) j k];
                end
            end
        end
    end
end

% %Based on H2
% w2 = [0 0 0 0 0]; % [weight,x top left corner, y top left corner, width, height]
% n2 = 0;
% %like the above, but with H2
% for p = 2:10
%     for q = 2:10
%         for j = (p+1):(24 - p)
%             for k = (q+1):(24)
%                 wnew2 = Haarweight(I,H2,p,q,[j k],1,2);
%                 if wnew2 > 0.2
%                     n2 = n2 + 1;
%                     w2(n2,:) = [wnew2 (j - p) (k - q) (2*p) (q)];
%                 end
%             end
%         end
%     end
% end
% 
% %Based on H3
% w3 = [0 0 0 0 0]; % [weight,x top left corner, y top left corner, width, height]
% n3 = 0;
% %like the above, but with H2
% for p = 2:10
%     for q = 2:8
%         for j = (p+1):(24)
%             for k = (q+1):(24 - p)
%                 wnew3 = Haarweight(I,H3,p,q,[j k],1,2);
%                 if wnew3 > 0.2
%                     n3 = n3 + 1;
%                     w3(n3,:) = [wnew3 (j - p) (k - q) (2*p) (q)];
%                 end
%             end
%         end
%     end
% end
% 
% %Based on H5
% w5 = [0 0 0 0 0]; % [weight,x top left corner, y top left corner, width, height]
% n5 = 0;
% for p = 2:7
%     for q = 2:10
%         for j = (p+1):(24 - 2*p)
%             for k = (q+1):(24)
%                 wnew5 = Haarweight(I,H5,p,q,[j k],1,3);
%                 if wnew5 > 0.2
%                     n5 = n5 + 1;
%                     w5(n5,:) = [wnew5 (j - p) (k - q) (3*p) (q)];
%                 end
%             end
%         end
%     end
% end
% 
% 
% %Based on H6
% w6 = [0 0 0 0 0]; % [weight,x top left corner, y top left corner, width, height]
% n6 = 0;
% for p = 2:7
%     for q = 2:10
%         for j = (p+1):(24 - 2*p)
%             for k = (q+1):(24)
%                 wnew6 = Haarweight(I,H6,p,q,[j k],1,3);
%                 if wnew6 > 0.2
%                     n6 = n6 + 1;
%                     w6(n6,:) = [wnew6 (j - p) (k - q) (3*p) (q)];
%                 end
%             end
%         end
%     end
% end
% 
% 
% 
% 
% % set(0,'DefaultFigureVisible','off');
% % for i = 1:n
% %     pic = pixelReplace(pic,H5pic,[(w(i,2) - 1) (w(i,3)-1)]);
% % end
% % set(0,'DefaultFigureVisible','on');
% % figure
% % imshow(pic)
% 
% 
%     %Some of my origional code that has since been generalized
%         % xscale = 3; yscale = 3;
%         % 
%         % w = [0 0 0];
%         % n=0;
%         % for j = 4:24
%         %    for k = 4:18
%         %        wnew = Haarweight(int,H5,xscale,yscale,[j k],1);
%         %       if wnew > 0.2
%         %        x = j;
%         %        y = k;
%         %        n = n + 1;
%         %        w(n,:) = [wnew x y];
%         %         
%         %       end
%         %    end
%         % end
