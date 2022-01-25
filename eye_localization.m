function Coords = eye_localization(Im,net)

g = fspecial('gaussian',17,3);
Coords = zeros(1,4);

size_x=64;
size_y=96;

%Face detection using Viola and Jones algorithm
[I,bboxes{1}]=face_detect(Im);

% If the face is not detected, continue.
if I==0
    fprintf('Face not found\n'); 
else
   
    % If the face is detected
    for i=1:2
        [Eye,bboxes{i+1}]=getEye(Im,bboxes{1},i);
         
        % Resize image
        [a_x,a_y] = size(Eye,1:2);
        scale_x = a_x/size_x;
        scale_y = a_y/size_y;
        Eye = imresize(Eye,[size_x,size_y]);
        
        % Convert to grayscale
        if size(Eye,3)>1
            Eye = rgb2gray(Eye);
        end

        % Estimate heatmap
        I = predict(net,Eye);
        
        % Smooth estimated heatmap
        I=imfilter(I,g,'conv');
        
        % Find coordinates of global maximum
        [y,x]=find(I==max(I(:)),1);
        
        x = x*scale_x;
        y = y*scale_y;

        Coords(2*(i-1)+1)=x+bboxes{1+i}(1)-1;
        Coords(2*i)=y+bboxes{1+i}(2)-1;
    end
    
end


end

