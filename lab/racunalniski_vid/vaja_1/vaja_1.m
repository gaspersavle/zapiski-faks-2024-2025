%% 1.1
img_1_rgb = imread('lena.tiff')
img_2_rgb = imread('baboon.tiff')
vid_1_rgb = VideoReader('Holywood2-t00427-rgb.avi')

img_1_R = img_1_rgb(:,:,1)
img_1_G = img_1_rgb(:,:,2)
img_1_B = img_1_rgb(:,:,3)

img_2_R = img_2_rgb(:,:,1)
img_2_G = img_2_rgb(:,:,2)
img_2_B = img_2_rgb(:,:,3)

img_1_gray = 0.299 * img_1_R + 0.587 * img_1_G + 0.114 * img_1_B
img_2_gray = 0.299 * img_2_R + 0.587 * img_2_G + 0.114 * img_2_B

imwrite(img_1_gray, 'img_1_togray.png', 'png')
imwrite(img_2_gray, 'img_2_togray.png', 'png')

%% 1.1 video

grey_video = VideoWriter('grey_video.avi', 'Grayscale AVI');
open(grey_video);

while hasFrame(vid_1_rgb)
    rgbframe = readFrame(vid_1_rgb)

    frame_R = rgbframe(:,:,1);
    frame_G = rgbframe(:,:,2);
    frame_B = rgbframe(:,:,3);

    grey_frame = 0.299 * frame_R + 0.587 * frame_G + 0.114 * frame_B;
    writeVideo(grey_video, grey_frame);
end

close(grey_video)


%% 1.2

%initialisation
size_1 = size(img_1_gray)
size_2 = size(img_2_gray)

img_1_backtorgb = zeros(size_1(1), size_1(2), 3, 'uint8');
img_2_backtorgb = zeros(size_2(1), size_2(2), 3, 'uint8');

green = uint8([0, 255, 0]);    % Green for Y <= 100
orange = uint8([255, 165, 0]); % Orange for 100 < Y <= 200
red = uint8([255, 0, 0]);      % Red for Y > 200

img_1_mask_green = img_1_gray <= 100
img_1_mask_orange = (img_1_gray > 100) & (img_1_gray <= 200)
img_1_mask_red = img_1_gray > 200

img_2_mask_green = img_2_gray <= 100
img_2_mask_orange = (img_2_gray > 100) & (img_2_gray <= 200)
img_2_mask_red = img_2_gray >200

function rgbimage = convert_2_rgb(grey_img)
    img_h = height(grey_img);
    img_w = width(grey_img);
    rgbimage = zeros(img_h, img_w, 3, 'uint8');

    green = uint8([0, 255, 0]);  
    orange = uint8([255, 165, 0]); 
    red = uint8([255, 0, 0]);      

    mask_green = grey_img <= 100;
    mask_orange = (grey_img > 100) & (grey_img <= 200);
    mask_red = grey_img > 200;

    rgbimage(:,:,1) = rgbimage(:,:,1) + uint8(mask_green) * green(1);
    rgbimage(:,:,2) = rgbimage(:,:,2) + uint8(mask_green) * green(2);
    rgbimage(:,:,3) = rgbimage(:,:,3) + uint8(mask_green) * green(3);

    rgbimage(:,:,1) = rgbimage(:,:,1) + uint8(mask_orange) * orange(1);
    rgbimage(:,:,2) = rgbimage(:,:,2) + uint8(mask_orange) * orange(2);
    rgbimage(:,:,3) = rgbimage(:,:,3) + uint8(mask_orange) * orange(3);

    rgbimage(:,:,1) = rgbimage(:,:,1) + uint8(mask_red) * red(1);
    rgbimage(:,:,2) = rgbimage(:,:,2) + uint8(mask_red) * red(2);
    rgbimage(:,:,3) = rgbimage(:,:,3) + uint8(mask_red) * red(3);
end

img_1_backtorgb = convert_2_rgb(img_1_gray);
img_2_backtorgb = convert_2_rgb(img_2_gray);

imwrite(img_1_backtorgb, 'img_1_backtorgb.png', 'png');
imwrite(img_2_backtorgb, 'img_2_backtorgb.png', 'png');


%% 1.2 video
vid_1_gray = VideoReader('grey_video.avi')

back_to_rgb_video = VideoWriter('back_to_rgb_video.avi', 'Motion JPEG AVI');
open(back_to_rgb_video);

while hasFrame(vid_1_gray)
    greyframe = readFrame(vid_1_gray);
    back_2_rgb_frame = convert_2_rgb(greyframe);
    writeVideo(back_to_rgb_video, back_2_rgb_frame);
    echo off
end

close(back_to_rgb_video)