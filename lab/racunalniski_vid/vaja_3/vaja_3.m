%  __                 _                         _            _ _ _          _                        _                   _                     ____    _                                 _       _           _        
% /_ |               | |                       (_)          | (_) |        (_)                      | |                 | |                   |___ \  | |                               (_)     (_)         | |       
%  | |    _ __   __ _| | __ _  __ _  __ _ _ __  _  ___   ___| |_| | _____   _ _ __    _ __  _ __ ___| |___   _____  _ __| |__   __ _  __   __   __) | | | ___   ___ ___ _ __   ___   ___ ___   ___ _ __  ___| | _____ 
%  | |   | '_ \ / _` | |/ _` |/ _` |/ _` | '_ \| |/ _ \ / __| | | |/ / _ \ | | '_ \  | '_ \| '__/ _ \ __\ \ / / _ \| '__| '_ \ / _` | \ \ / /  |__ <  | |/ _ \ / __/ _ \ '_ \ / _ \ / __| \ \ / / | '_ \/ __| |/ / _ \
%  | |_  | | | | (_| | | (_| | (_| | (_| | | | | |  __/ \__ \ | |   <  __/ | | | | | | |_) | | |  __/ |_ \ V / (_) | |  | |_) | (_| |  \ V /   ___) | | | (_) | (_|  __/ | | |  __/ \__ \ |\ V /| | | | \__ \   <  __/
%  |_(_) |_| |_|\__,_|_|\__,_|\__, |\__,_|_| |_| |\___| |___/_|_|_|\_\___| |_|_| |_| | .__/|_|  \___|\__| \_/ \___/|_|  |_.__/ \__,_|   \_/   |____/  |_|\___/ \___\___|_| |_|\___| |___/_| \_/ |_|_| |_|___/_|\_\___|
%                              __/ |          _/ |                                   | |                                                                                                                              
%                             |___/          |__/                                    |_|                                                                                                                              
%% Read images
yose = imread("yosemite_meadows.jpg");
penc = imread("coloured_pencils.jpg");

%% Convert images to HSV
yose_hsv = rgb2hsv(yose);
penc_hsv = rgb2hsv(penc);

yose_h = yose_hsv(:, :, 1);
yose_s = yose_hsv(:, :, 2);
yose_v = yose_hsv(:, :, 3);


penc_h = penc_hsv(:, :, 1);
penc_s = penc_hsv(:, :, 2);
penc_v = penc_hsv(:, :, 3);

%% Display components of yosemite_meadows
figure;

subplot(1,3,1);
imagesc(yose_h)
axis image;
colormap(gray);
title("H")

subplot(1,3,2)
imagesc(yose_s)
axis image;
colormap(gray);
title("S")

subplot(1,3,3)
imagesc(yose_v)
axis image;
colormap(gray);
title("V")

%% Display components of coloured_pencils
figure;
subplot(1,3,1);
imagesc(penc_h)
axis image;
colormap(gray);
title("H")

subplot(1,3,2)
imagesc(penc_s)
axis image;
colormap(gray);
title("S")

subplot(1,3,3)
imagesc(penc_v)
axis image;
colormap(gray);
title("V")

%% Convert images to LAB
yose_lab = rgb2lab(yose);
penc_lab = rgb2lab(penc);

yose_l = yose_lab(:, :, 1);
yose_a = yose_lab(:, :, 2);
yose_b = yose_lab(:, :, 3);

penc_l = penc_lab(:, :, 1);
penc_a = penc_lab(:, :, 2);
penc_b = penc_lab(:, :, 3);

%% Display components of yosemite_meadows
figure;
subplot(1,3,1);
imagesc(yose_l)
axis image;
colormap(gray);
title("L")

subplot(1,3,2)
imagesc(yose_a)
axis image;
colormap(gray);
title("A")

subplot(1,3,3)
imagesc(yose_b)
axis image;
colormap(gray);
title("B")

%% Display components of coloured_pencils
figure;
subplot(1,3,1);
imagesc(penc_l)
axis image;
colormap(gray);
title("L")

subplot(1,3,2)
imagesc(penc_a)
axis image;
colormap(gray);
title("A")

subplot(1,3,3)
imagesc(penc_b)
axis image;
colormap(gray);
title("B")

%%
%  ___     __      __    _ _                                                        _ _       _                                                _                            _                   _              _                         _____   _____ ____        _ _ _         
% |__ \    \ \    / /   | (_)                                                      (_) |     | |                                              | |                          | |                 | |            (_)                       |  __ \ / ____|  _ \      | (_) |        
%    ) |    \ \  / / __ | |___   __  _ __   ___  ___  __ _ _ __ ___   ___ _____ __  _| |__   | | _____  _ __ ___  _ __   ___  _ __   ___ _ __ | |_   _ __   __ _   _ __ ___| | _____  _ __  ___| |_ _ __ _   _ _ _ __ __ _ _ __   ___   | |__) | |  __| |_) |  ___| |_| | _____  
%   / /      \ \/ / '_ \| | \ \ / / | '_ \ / _ \/ __|/ _` | '_ ` _ \ / _ \_  / '_ \| | '_ \  | |/ / _ \| '_ ` _ \| '_ \ / _ \| '_ \ / _ \ '_ \| __| | '_ \ / _` | | '__/ _ \ |/ / _ \| '_ \/ __| __| '__| | | | | '__/ _` | '_ \ / _ \  |  _  /| | |_ |  _ <  / __| | | |/ / _ \ 
%  / /_ _     \  /| |_) | | |\ V /  | |_) | (_) \__ \ (_| | | | | | |  __// /| | | | | | | | |   < (_) | | | | | | |_) | (_) | | | |  __/ | | | |_  | | | | (_| | | | |  __/   < (_) | | | \__ \ |_| |  | |_| | | | | (_| | | | | (_) | | | \ \| |__| | |_) | \__ \ | |   < (_) |
% |____(_)     \/ | .__/|_|_| \_/   | .__/ \___/|___/\__,_|_| |_| |_|\___/___|_| |_|_|_| |_| |_|\_\___/|_| |_| |_| .__/ \___/|_| |_|\___|_| |_|\__| |_| |_|\__,_| |_|  \___|_|\_\___/|_| |_|___/\__|_|   \__,_|_|_|  \__,_|_| |_|\___/  |_|  \_\\_____|____/  |___/_|_|_|\_\___/ 
%                 | |               | |                                                                          | |                                                                                                                                                             
%                 |_|               |_|                                                                          |_|           
%% yosemite_meadows_HSV
yose_new_h = mean2(yose_h) * ones(size(yose_h));
yose_new_s = mean2(yose_s) * ones(size(yose_s));
yose_new_v = mean2(yose_v) * ones(size(yose_v));

yose_new_hs = cat(3, yose_h, yose_s, yose_new_v);
yose_new_hv = cat(3, yose_h, yose_new_s, yose_v);
yose_new_sv = cat(3, yose_new_h, yose_s, yose_v);

yosergb_hs = hsv2rgb(yose_new_hs);
yosergb_hv = hsv2rgb(yose_new_hv);
yosergb_sv = hsv2rgb(yose_new_sv);

%% Prikaz yosemite_meadows (HSV) z zmanjsanim vplivom posameznih komponent
figure;
subplot(1,3,1);
imshow(yosergb_hs)
title("HSv")
subplot(1,3,2);
imshow(yosergb_hv)
title("HsV")
subplot(1,3,3)
imshow(yosergb_sv)
title("hSV")

%% yosemite_meadows_LAB
yose_new_l = mean2(yose_l) * ones(size(yose_l));
yose_new_a = mean2(yose_a) * ones(size(yose_a));
yose_new_b = mean2(yose_b) * ones(size(yose_b));

yose_new_la = cat(3, yose_l, yose_a, yose_new_b);
yose_new_lb = cat(3, yose_l, yose_new_a, yose_b);
yose_new_ab = cat(3, yose_new_l, yose_a, yose_b);

yosergb_la = lab2rgb(yose_new_la);
yosergb_lb = lab2rgb(yose_new_lb);
yosergb_ab = lab2rgb(yose_new_ab);

%% Prikaz yosemite_meadows (LAB) z zmanjsanim vplivom posameznih komponent
figure;
subplot(1,3,1);
imshow(yosergb_la)
title("LAb")
subplot(1,3,2);
imshow(yosergb_lb)
title("LaB")
subplot(1,3,3)
imshow(yosergb_ab)
title("lAB")

%%
%  ____     _____                                                              _             _ _                                       _ _             _   _                          
% |___ \   |  __ \                                                            | |           (_|_)                                     | | |           (_) | |                         
%   __) |  | |__) |___   ___ _ __   __ _   ___  ___  __ _ _ __ ___   ___ _ __ | |_ __ _  ___ _ _  __ _   _ __   __ _   _ __   ___   __| | | __ _  __ _ _  | |__   __ _ _ ____   _____ 
%  |__ <   |  _  // _ \ / __| '_ \ / _` | / __|/ _ \/ _` | '_ ` _ \ / _ \ '_ \| __/ _` |/ __| | |/ _` | | '_ \ / _` | | '_ \ / _ \ / _` | |/ _` |/ _` | | | '_ \ / _` | '__\ \ / / _ \
%  ___) |  | | \ \ (_) | (__| | | | (_| | \__ \  __/ (_| | | | | | |  __/ | | | || (_| | (__| | | (_| | | | | | (_| | | |_) | (_) | (_| | | (_| | (_| | | | |_) | (_| | |   \ V /  __/
% |____(_) |_|  \_\___/ \___|_| |_|\__,_| |___/\___|\__, |_| |_| |_|\___|_| |_|\__\__,_|\___|_| |\__,_| |_| |_|\__,_| | .__/ \___/ \__,_|_|\__,_|\__, |_| |_.__/ \__,_|_|    \_/ \___|
%                                                    __/ |                                   _/ |                     | |                         __/ |                               
%                                                   |___/                                   |__/                      |_|                        |___/                                
%% Nalaganje video datoteke
vidjeyo = VideoReader("ladja.wm");
randindex = randi([1,vidjeyo.NumFrames]);
vidjeyo.CurrentTime = (randindex - 1) / vidjeyo.FrameRate
sample_frame = readFrame(vidjeyo);

%% Pridobivanje nekaj vzorcev barve morja (RGB)
imshow(sample_frame)
disp("Oznaci 2 piksla, ki definirata nasprotni ogljisci pravokotnika, ki zavzema del morja");
[locx, locy] = ginput(2);

close;

smallbox = sample_frame(round(locx(1)):round(locx(2)), round(locy(1)):round(locy(2)), :);
smallbox_hsv = rgb2hsv(smallbox);
mean_r = mean(smallbox(:, :, 1), 'all');
mean_g = mean(smallbox(:, :, 2), 'all');
mean_b = mean(smallbox(:, :, 3), 'all');

mean_h = mean(smallbox_hsv(:, :, 1), 'all');
mean_s = mean(smallbox_hsv(:, :, 2), 'all');
mean_v = mean(smallbox_hsv(:, :, 3), 'all');

toleranca_rgb = 15;
toleranca_h = 0.1;
toleranca_s = 0.1;

%% Rocna segmentacija videa (RGB)
segmented_video_rgb = VideoWriter("ladja_seg_man_rgb.avi", "Uncompressed AVI");
open(segmented_video_rgb);
vidjeyo.CurrentTime = 0;

while hasFrame(vidjeyo)
    frame = readFrame(vidjeyo);
    frame_hsv = rgb2hsv(frame);

    mask_rgb = (abs(frame(:, :, 1) - mean_r) <= toleranca_rgb) & ...
              (abs(frame(:, :, 2) - mean_g) <= toleranca_rgb) & ...
              (abs(frame(:, :, 3) - mean_b) <= toleranca_rgb);
    masked_frame_rgb = uint8(cat(3, mask_rgb * 255, mask_rgb * 255, mask_rgb * 255));

    writeVideo(segmented_video_rgb, masked_frame_rgb);

end

close(segmented_video_rgb);

%% Rocna segmentacija videa (HSV)
segmented_video_hsv = VideoWriter("ladja_seg_man_hsv.avi", "Uncompressed AVI");
open(segmented_video_hsv);
vidjeyo.CurrentTime = 0;

while hasFrame(vidjeyo)
    frame = readFrame(vidjeyo);
    frame = rgb2hsv(frame);

    mask_hs = (abs(frame(:, :, 1) - mean_h) <= toleranca_h) & ...
                (abs(frame(:, :, 2) - mean_s) <= toleranca_s);
    masked_frame_hs = uint8(cat(3, mask_hs * 255, mask_hs * 255, mask_hs * 255));

    writeVideo(segmented_video_hsv, masked_frame_hs);
end

close(segmented_video_hsv);
%%
%  _  _                  _                        _       _                                               _             _ _               _     _            
% | || |       /\       | |                      | |     | |                                             | |           (_|_)             (_)   | |           
% | || |_     /  \__   _| |_ ___  _ __ ___   __ _| |_ ___| | ____ _   ___  ___  __ _ _ __ ___   ___ _ __ | |_ __ _  ___ _ _  __ _  __   ___  __| | ___  __ _ 
% |__   _|   / /\ \ \ / / __/ _ \| '_ ` _ \ / _` | __/ __| |/ / _` | / __|/ _ \/ _` | '_ ` _ \ / _ \ '_ \| __/ _` |/ __| | |/ _` | \ \ / / |/ _` |/ _ \/ _` |
%    | |_   / ____ \ V /| || (_) | | | | | | (_| | |_\__ \   < (_| | \__ \  __/ (_| | | | | | |  __/ | | | || (_| | (__| | | (_| |  \ V /| | (_| |  __/ (_| |
%    |_(_) /_/    \_\_/  \__\___/|_| |_| |_|\__,_|\__|___/_|\_\__,_| |___/\___|\__, |_| |_| |_|\___|_| |_|\__\__,_|\___|_| |\__,_|   \_/ |_|\__,_|\___|\__,_|
%                                                                               __/ |                                   _/ |                                 
%                                                                              |___/                                   |__/                                  
%% Segmentacija videa na podlagi histograma
bini = 8;
bin_meje = linspace(0, 256, bini + 1); % Bin edges for [0, 255] values

[~, bini_r] = histc(double(smallbox(:, :, 1)), bin_meje);
[~, bini_g] = histc(double(smallbox(:, :, 2)), bin_meje);
[~, bini_b] = histc(double(smallbox(:, :, 3)), bin_meje);

histogram_3D = accumarray([bini_r(:), bini_g(:), bini_b(:)], 1, [bini, bini, bini]);

histogram_3D = histogram_3D / max(histogram_3D(:)) * 255;

segmented_video_hist = VideoWriter('ladja_seg_hist.avi');
open(segmented_video_hist);
vidjeyo.CurrentTime = 0;

while hasFrame(vidjeyo)
    frame = readFrame(vidjeyo);

    [~, bini_r] = histc(double(frame(:, :, 1)), bin_meje);
    [~, bini_g] = histc(double(frame(:, :, 2)), bin_meje);
    [~, bini_b] = histc(double(frame(:, :, 3)), bin_meje);

    bini_r(bini_r > bini) = bini;
    bini_g(bini_g > bini) = bini;
    bini_b(bini_b > bini) = bini;

    mask = bini_r > 0 & bini_g > 0 & bini_b > 0;
    indeksi = sub2ind(size(histogram_3D), bini_r(mask), bini_g(mask), bini_b(mask));
    frame_grey = zeros(size(frame, 1), size(frame, 2), 'uint8');
    frame_grey(mask) = histogram_3D(indeksi);

    writeVideo(segmented_video_hist, repmat(frame_grey, 1, 1, 3));
end

close(segmented_video_hist);

disp('Segmentation complete. Video saved as ladja_seg_man_hsv.avi');

%% Segmentacija videa na podlagi razdalje med histogrami
bini = 4; 
bin_meje = linspace(0, 256, bini + 1);
blok = 8;

[~, bini_r] = histc(double(smallbox(:, :, 1)), bin_meje);
[~, bini_g] = histc(double(smallbox(:, :, 2)), bin_meje);
[~, bini_b] = histc(double(smallbox(:, :, 3)), bin_meje);

bini_r = max(min(bini_r, bini), 1);
bini_g = max(min(bini_g, bini), 1);
bini_b = max(min(bini_b, bini), 1);

histogram = accumarray([bini_r(:), bini_g(:), bini_b(:)], 1, [bini, bini, bini]);

histogram = histogram / sum(histogram(:));

segmented_video_hist_dist = VideoWriter('ladja_seg_hist_dist.avi');
open(segmented_video_hist_dist);
vidjeyo.CurrentTime = 0;

while hasFrame(vidjeyo)
    frame = readFrame(vidjeyo);

    [rows, cols, ~] = size(frame);
    num_blocks_row = floor(rows / blok);
    num_blocks_col = floor(cols / blok);

    crop_frame = frame(1:num_blocks_row * blok, 1:num_blocks_col * blok, :);

    reshaped_frame = reshape(crop_frame, blok, num_blocks_row, blok, num_blocks_col, 3);
    reshaped_frame = permute(reshaped_frame, [1, 3, 2, 4, 5]); 
    blocks_flattened = reshape(reshaped_frame, [], num_blocks_row * num_blocks_col, 3);

    [~, bin_blocks_r] = histc(blocks_flattened(:, :, 1), bin_meje);
    [~, bin_blocks_g] = histc(blocks_flattened(:, :, 2), bin_meje);
    [~, bin_blocks_b] = histc(blocks_flattened(:, :, 3), bin_meje);

    bin_blocks_r = max(min(bin_blocks_r, bini), 1);
    bin_blocks_g = max(min(bin_blocks_g, bini), 1);
    bin_blocks_b = max(min(bin_blocks_b, bini), 1);

    st_blokov = num_blocks_row * num_blocks_col;
    blok_hist = accumarray([bin_blocks_r(:), bin_blocks_g(:), bin_blocks_b(:), repelem((1:st_blokov)', blok^2)], 1, ...
                                  [bini, bini, bini, st_blokov]);

    blok_hist = blok_hist ./ (sum(blok_hist, [1, 2, 3]) + eps);

    presecisca_vals = squeeze(sum(sum(sum(min(blok_hist, histogram), 1), 2), 3));

    presecisca_mreza = reshape(presecisca_vals, num_blocks_row, num_blocks_col);

    frame_grey = repelem(presecisca_mreza, blok, blok);
    frame_grey = uint8(frame_grey * 256); 

    writeVideo(segmented_video_hist_dist, repmat(frame_grey, 1, 1, 3));
end

close(segmented_video_hist_dist);
