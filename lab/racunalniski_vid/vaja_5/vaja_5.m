%% 1. Podvzorčenje slik
video = VideoReader("Holywood.avi");
scales = [1/2, 1/4, 1/8];
for i = 1:3
    title_nn = "Hollywood_"+scales(i)+"_nn.avi";
    title_naa = "Hollywood_"+scales(i)+"_naa.avi";
    title_aa = "Hollywood_"+scales(i)+"_aa.avi";

    output_nn = VideoWriter(title_nn, "Uncompressed AVI");
    output_naa = VideoWriter(title_naa, "Uncompressed AVI");
    output_aa = VideoWriter(title_aa, "Uncompressed AVI");
    
    open(output_nn);
    open(output_naa);
    open(output_aa);

    while hasFrame(video)
        frame = readFrame(video);
        frame_nn = imresize(frame, scales(i), "nearest");
        frame_naa = imresize(frame, scales(i), "bilinear", "Antialiasing",false);
        frame_aa = imresize(frame, scales(i), "bilinear", "Antialiasing",true);
    
        writeVideo(output_nn, frame_nn);
        writeVideo(output_naa, frame_naa);
        writeVideo(output_aa, frame_aa);
    end
    video.CurrentTime=0;

    close(output_nn)
    close(output_naa)
    close(output_aa)

end

%% 2. Mere podobnosti

video = VideoReader("squash.avi");
video.CurrentTime = 0
sample_frame = readFrame(video);

videoout = VideoWriter("tracing.avi",  "Uncompressed AVI");
open(videoout);
dimensions = size(sample_frame);

figure;
imshow(sample_frame);
title("Izberi 2 točki na rdecem igralcu (majica)");
points = round(ginput(2));
points = [110,121;120,130];
close;

player_template = sample_frame(points(2) : points(4), points(1) : points(3), : ); 

template_height = points(4) - points(2); 
template_width = points(3) - points(1);

center_y = round(points(4) - template_height/2); 
center_x = round(points(3) - template_width/2);

% E-okolica in koraki iskanja
e_y = 2; % koraki za iskanje
e_x = 3; % koraki za iskanje
loc_y = 0;
loc_x = 0;

% Obdelava videa
index = 1
while hasFrame(video)
    frame = readFrame(video);

    % Iskanje lokacije na prvi sliki
    if index == 1
        loc_y = center_y;
        loc_x = center_x;
    end

    % Iskanje lokacij na ostalih slikah
    if index > 1

        player_loc_frame = zeros(e_y * 2, e_x * 2); % matrika za shranjevanje lokacij na poazezni sliki

        for shift_y = (0-e_y):(0+e_y)
            for shift_x = (0-e_x):(0+e_x)

                % zamik območja kjer se bojo primerjale slike in lokacija za shranjevanje vrednosti
                start_shift_y = loc_y + shift_y*template_height
                end_shift_y = loc_y + (shift_y+1)*template_height
  

                start_shift_x = loc_x + shift_x*template_width
                end_shift_x = loc_x + (shift_x+1)*template_width
 
    
                roi = frame(start_shift_y:end_shift_y, start_shift_x:end_shift_x,:);

                val = (double(roi) - double(player_template)).^2;
                euclidean = sqrt(sum(val(:)));
                player_loc_frame(shift_y+e_y+1,shift_x+e_x+1) = euclidean;
                % subplot(1,2,1);
                % imshow(obmocjeIskanja);
                % subplot(1,2,2);
                % imshow(slikaIgralca);
                % disp(frameEvklidski);

            end
        end

        [val, indeks] = min(player_loc_frame(:));
        [row, col] = ind2sub(size(player_loc_frame), indeks); 
        loc_y = template_height * (row-e_y-1) + floor(template_height/2) + loc_y;
        loc_x = template_width * (col-e_x-1) + floor(template_width/2) + loc_x;

    end

    y = loc_x;
    x = loc_y;

    r = 25;
    [xx, yy] = ndgrid(1:size(frame, 1), 1:size(frame, 2));
    krogZunanji = (xx - x).^2 + (yy - y).^2 <= r^2;
    krogNotranji = (xx - x).^2 + (yy - y).^2 <= (r-2)^2;
    krog = krogZunanji & ~krogNotranji;

    frame(:,:,1) = frame(:,:,1) + uint8(krog)*255; 
    frame(:,:,2) = frame(:,:,2) .* uint8(~krog);
    frame(:,:,3) = frame(:,:,3) .* uint8(~krog); 

    %imshow(trenutnaSlika);
    index = index +1;
    writeVideo(videoout,frame);

end

close(videoout);

%% 2. Mere podobnosti (histogram)
clc;
close all;
%clear all;
video = VideoReader("squash.avi");
video.CurrentTime = 0
sample_frame = readFrame(video);
dimensions = size(sample_frame);

videoout = VideoWriter("tracing_hist.avi",  "Uncompressed AVI");
open(videoout);

% poklikaj 2 točki na majici rdečega igralca
figure;
image(sample_frame);
title("Izberi 2 točki na rdecem igralcu (majica)");
points = round(ginput(2)); % [110,121;120,130]
points = [110,121;120,130];
close;

% Osnovna slika
template = sample_frame(points(2) : points(4), points(1) : points(3), : ); 
% figure;
% imshow(slikaIgralca);

% Dimezije slike - igralca
template_height = points(4) - points(2); 
template_width = points(3) - points(1);

% Center slike igralca
center_player_y = round(points(4) - template_height/2); 
center_player_x = round(points(3) - template_width/2);

% Histogram igralca in normiranje (kocka z najvišjo vrednostjo bo imela vrednost 255)
player_hist = zeros(8,8,8); % (kot v lab 3)
for i = 1:template_height
    for j = 1:template_width
        px = template(i,j,:);
        loc = floor(double(px(:)) ./ 32) + 1; 
        player_hist(loc(1),loc(2),loc(3)) = player_hist(loc(1),loc(2),loc(3)) + 1;
    end
end

template_hist_summed = sum(player_hist(:));
template_hist_norm = player_hist / template_hist_summed;

% E-okolica in koraki iskanja
e_y = 2; % koraki za iskanje
e_x = 3; % koraki za iskanje
loc_y = 0;
loc_x = 0;
index = 1;
% Obdelava videa
while hasFrame(video)
    frame = readFrame(video);

    % Iskanje lokacije na prvi sliki
    if index == 1
        loc_y = center_player_y;
        loc_x = center_player_x;
    end

    % Iskanje lokacij na ostalih slikah
    if index > 1

        loc_frame = zeros(e_y * 2, e_x * 2); % matrika za shranjevanje lokacij na poazezni sliki
        roi_hist = zeros(8,8,8); % (kot v lab 3)

        for shift_y = (0-e_y):(0+e_y)
            for shift_x = (0-e_x):(0+e_x)

                % zamik območja kjer se bojo primerjale slike in lokacija za shranjevanje vrednosti
                start_y_shift = loc_y + shift_y*template_height;
                end_y_shift = loc_y + (shift_y+1)*template_height;

                start_x_shift = loc_x + shift_x*template_width;
                end_x_shift = loc_x + (shift_x+1)*template_width;

                if (start_y_shift > 0 && start_x_shift > 0)
                    roi = frame(start_y_shift:end_y_shift, start_x_shift:end_x_shift,:);
    
                    % Histogram in normiranje
                    for i = 1:template_height
                        for j = 1:template_width
                            px = roi(i,j,:);
                            loc = floor(double(px(:)) ./ 32) + 1; 
                            roi_hist(loc(1),loc(2),loc(3)) = roi_hist(loc(1),loc(2),loc(3)) + 1;
                        end
                    end
    
                    template_hist_summed = sum(roi_hist(:));
                    roi_hist_normed = roi_hist / template_hist_summed;
        
                    % Izračun hi-kvadrat razdalje
                    sub = 0.001;
                    hi_sq = sum(((roi_hist_normed - template_hist_norm).^2) ./ (roi_hist_normed + template_hist_norm + sub));
                    loc_frame(shift_y+e_y+1,shift_x+e_x+1) = sum(hi_sq(:));
                end
            end
        end

        [val, indeks] = min(loc_frame(:));
        [row, col] = ind2sub(size(loc_frame), indeks); 
        loc_y = template_height * (row-e_y-1) + floor(template_height/2) + loc_y;
        loc_x = template_width * (col-e_x-1) + floor(template_width/2) + loc_x;

    end

    y = loc_x;
    x = loc_y;

    % Izris kroga
    r = 25;
    [xx, yy] = ndgrid(1:size(frame, 1), 1:size(frame, 2));
    krogZunanji = (xx - x).^2 + (yy - y).^2 <= r^2;
    krogNotranji = (xx - x).^2 + (yy - y).^2 <= (r-2)^2;
    krog = krogZunanji & ~krogNotranji;

    frame(:,:,1) = frame(:,:,1) + uint8(krog)*255; 
    frame(:,:,2) = frame(:,:,2) .* uint8(~krog);
    frame(:,:,3) = frame(:,:,3) .* uint8(~krog); 

    %imshow(trenutnaSlika);
    index = index + 1;
    writeVideo(videoout, frame);

end

close(videoout)

%% 3. Sprotno učenje
clc;
close all;
%clear all;
video = VideoReader("squash.avi");
video.CurrentTime = 0
sample_frame = readFrame(video);
dimensions = size(sample_frame);

videoout = VideoWriter("tracing_new_template.avi",  "Uncompressed AVI");
open(videoout);

figure;
image(sample_frame);
title("Izberi 2 točki na rdecem igralcu (majica)");
points = round(ginput(2)); % [110,121;120,130]
points = [110,121;120,130];
close;

% Osnovna slika
template = sample_frame(points(2) : points(4), points(1) : points(3), : );
% figure;
% imshow(slikaIgralca);

% Dimezije slike - igralca
template_height = points(4) - points(2); 
template_width = points(3) - points(1);

% Center slike igralca
template_center_y = round(points(4) - template_height/2); 
template_center_x = round(points(3) - template_width/2);

% E-okolica in koraki iskanja
e_y = 2; % koraki za iskanje
e_x = 3; % koraki za iskanje
loc_y = 0;
loc_x = 0;
index = 1;
% Obdelava videa
while hasFrame(video)
    frame = readFrame(video);

    % Iskanje lokacije na prvi sliki
    if index == 1
        loc_y = template_center_y;
        loc_x = template_center_x;
    end

    % Iskanje lokacij na ostalih slikah
    if index > 1

        loc_frame = zeros(e_y * 2, e_x * 2); % matrika za shranjevanje lokacij na poazezni sliki
        rois = zeros(11, 12, 3, 35);
        euclideans = zeros(1, 35);
        count = 1;
        for shift_y = (0-e_y):(0+e_y)
            for shift_x = (0-e_x):(0+e_x)
                % zamik območja kjer se bojo primerjale slike in lokacija za shranjevanje vrednosti
                start_y_shift = loc_y + shift_y*template_height;
                end_y_shift = loc_y + (shift_y+1)*template_height;

                start_x_shift = loc_x + shift_x*template_width;
                end_x_shift = loc_x + (shift_x+1)*template_width;
    
                if (start_y_shift > 0 && start_x_shift > 0)
                    roi = frame(start_y_shift:end_y_shift, start_x_shift:end_x_shift,:);
    
                    val = (double(roi) - double(template)).^2;
                    euclidean = sqrt(sum(val(:)));
                    loc_frame(shift_y+e_y+1,shift_x+e_x+1) = euclidean;
                    rois(:, :, :, count) = roi;
                    euclideans(1,count) = euclidean;
                    count = count + 1;
                    % subplot(1,2,1);
                    % imshow(obmocjeIskanja);
                    % subplot(1,2,2);
                    % imshow(slikaIgralca);
                    % disp(frameEvklidski);
                end
            end
        end
        %imshow(roi);
        [val, indeks] = min(loc_frame(:));
        [row, col] = ind2sub(size(loc_frame), indeks); 
        loc_y = template_height * (row-e_y-1) + floor(template_height/2) + loc_y;
        loc_x = template_width * (col-e_x-1) + floor(template_width/2) + loc_x;
        [neki, indmin] = min(euclideans)
        template = rois(:, :, :, indmin);
        imshow(template)

    end

    y = loc_x;
    x = loc_y;

    % Izris kroga
    r = 25;
    [xx, yy] = ndgrid(1:size(frame, 1), 1:size(frame, 2));
    krogZunanji = (xx - x).^2 + (yy - y).^2 <= r^2;
    krogNotranji = (xx - x).^2 + (yy - y).^2 <= (r-2)^2;
    krog = krogZunanji & ~krogNotranji;

    frame(:,:,1) = frame(:,:,1) + uint8(krog)*255; 
    frame(:,:,2) = frame(:,:,2) .* uint8(~krog);
    frame(:,:,3) = frame(:,:,3) .* uint8(~krog); 
    index = index +1;
    writeVideo(videoout, frame)

end

close(videoout);