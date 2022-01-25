function [Eye,bboxes] = getEye(I,bbox,i)

out=zeros(3,4);
out(1,:) = bbox;

% Create Bounding Box for Left Eye
left=0.12;
width=0.36;
upper=0.28;
height=0.24;
out(2,:)=[out(1,1)+out(1,3)*left,out(1,2)+out(1,3)*upper,...
    out(1,3)*width,out(1,3)*height];
bboxes=out(2,:);
if i==2
    % Create Bounding Box for Right Eye
    left=0.52;
    width=0.36;
    upper=0.28;
    height=0.24;
    out(3,:)=[out(1,1)+out(1,3)*left,out(1,2)+out(1,3)*upper,...
        out(1,3)*width,out(1,3)*height];
    bboxes=out(3,:);
end

Eye=imcrop(I,bboxes);

end