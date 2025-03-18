%% Setup
addpath('calib_toolbox/')

%% 1. Kalibracija s toolboxom
calib_gui

%% 2. Projektivna transformacija
image = imread('Image_rect4.tif')
imshow(image)
inpoints = ginput(4)
outpoints = [0, 0; 420, 0; 420, 420; 0, 420]
transform = maketform('projective', inpoints, outpoints)
unfucked_image = imtransform(image, transform, 'XData', [0 420], 'YData', [0 420]);
%imshow(unfucked_image)
[imagePoints,boardSize] = detectCheckerboardPoints(unfucked_image);

J = insertMarker(unfucked_image,imagePoints,'o','MarkerColor','red','Size',5);
imshow(J);
title(sprintf('Detected a %d x %d Checkerboard',boardSize));

%% Distorting the intersection points 
backtopoints = tforminv(transform, imagePoints)
annotated_image = insertMarker(image,backtopoints,'o','MarkerColor','red','Size',5);
annotated_image = insertMarker(annotated_image,inpoints,'star','MarkerColor','green','Size',5);
imshow(annotated_image)
title("Detected and user-selected intersections");

%% 3. Radialna distorzija
radimage = imread('Image15.tif')
imshow(radimage)
hold on;
title(sprintf('Oznaci 2 stolpca po %d tock', (boardSize(1)-1)))
linepoints1 = ginput(boardSize(1)-1)
plot(linepoints1(:,1), linepoints1(:,2), 'bo')
linepoints2 = ginput(boardSize(1)-1)
plot(linepoints2(:,1), linepoints2(:,2), 'bo')

linepoints1 = transpose(linepoints1)
linepoints2 = transpose(linepoints2)

[coefs_left, dists_left] =fitline(linepoints1)
[coefs_center, dists_center] =fitline(linepoints2)

fl_x = linspace(1, size(radimage, 2), 100);
y_left = -(coefs_left(1) * fl_x + coefs_left(3)) / coefs_left(2);
y_center = -(coefs_center(1) * fl_x + coefs_center(3)) / coefs_center(2);
plot(fl_x, y_left, 'r', 'LineWidth', 2);
plot(fl_x, y_center, 'r', 'LineWidth', 2);


%% Kosamona
principal_point = [304.59057   244.25925]
cx = principal_point(1)
cy = principal_point(2)

% Izracun radialnih razdalj tock od opticnega sredisca
d_center_levo = sqrt((linepoints1(2,:) - cy).^2 + (linepoints1(1,:) - cx).^2);
d_center_center = sqrt((linepoints2(2,:) - cy).^2 + (linepoints2(1,:) - cx).^2);


radii_left = []
radii_center = []
radii_sum = []
fs = []

for f=400:20:800
    r_i_left = -(f/2)*((exp(-((2*dists_left/f)))-1)./(exp(-dists_left/f)))
    r_i_center = -(f/2)*((exp(-((2*dists_center/f)))-1)./(exp(-dists_center/f)))

    x_rob_new = cy + (linepoints1(2,:) - cy) .* (r_i_left ./ d_center_levo);
    y_rob_new = cx + (linepoints1(1,:) - cx) .* (r_i_left ./ d_center_levo);

    x_center_new = cy + (linepoints2(2,:) - cy) .* (r_i_center ./ d_center_center);
    y_center_new = cx + (linepoints2(1,:) - cx) .* (r_i_center ./ d_center_center);

    [coefs_left_new, dists_left_new] = fitline([x_rob_new; y_rob_new])
    [coefs_center_new, dists_center_new] = fitline([x_center_new; y_center_new])

    radii_left = [radii_left, norm(dists_left_new)]
    radii_center = [radii_center, norm(dists_center_new)]
    radii_sum = [radii_sum, (norm(dists_left_new)+norm(dists_center_new))]
    fs = [fs, f]
end

figure;
plot(fs, radii_left);
%hold on;
%plot(fs, radii_center);
%hold on;
%plot(fs, radii_sum);
xlabel('Goriscna razdalja "f"');
ylabel('Vsota razdalij');
title('Razdalje v odvisnosti od f:');



   
