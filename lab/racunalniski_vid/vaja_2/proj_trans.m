image = imread('Image_rect4.tif')
imshow(image)
inpoints = ginput(4)
outpoints = [0, 0; 420, 0; 420, 420; 0, 420]
transform = maketform('projective', inpoints, outpoints)
%% Display corrected image and display the intersections of the checkerboard
unfucked_image = imtransform(image, transform, 'XData', [0 420], 'YData', [0 420]);
[imagePoints,boardSize] = detectCheckerboardPoints(unfucked_image);

J = insertText(unfucked_image,imagePoints,1:size(imagePoints,1));
J = insertMarker(J,imagePoints,'o','MarkerColor','red','Size',5);
imshow(J);
title(sprintf('Detected a %d x %d Checkerboard',boardSize));

%% Distorting the intersection points 
backtopoints = tforminv(transform, imagePoints)
annotated_image = insertMarker(image,backtopoints,'o','MarkerColor','red','Size',5);
annotated_image = insertMarker(annotated_image,inpoints,'star','MarkerColor','green','Size',5);
imshow(annotated_image)
title("Detected and user-selected intersections");
