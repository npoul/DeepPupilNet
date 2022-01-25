function [Face, bboxes] = face_detect(Img)

faceDetector = vision.CascadeObjectDetector('FrontalFaceCART','MergeThreshold', 8);
bboxes = step(faceDetector, Img);
if isempty(bboxes)
    Face=0;
    return;
else
    if size(bboxes,1)>1
        bboxes=bboxes(size(bboxes,1),:);
    end
    
    Face=imcrop(Img,bboxes);
    
end
end