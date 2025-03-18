%% 1. Del: Izločanje robov
close all;

S_x = [[1 0 -1];[2 0 2];[1 0 -1]];
S_y = [[1 2 1];[0 0 0];[-1 2 -1]];

img_rgb = imread("hotel.jpg");
img_grey = rgb2gray(img_rgb);

%filtriranje slike

grads_x = double(imfilter(img_grey, S_x, "conv"));
grads_y = double(imfilter(img_grey, S_y, "conv"));

grads = sqrt(grads_x.^2+grads_y.^2);
grads = uint8(255 * (grads / max(grads(:))));

ratio = graythresh(grads);
threshold = ratio * 255;

img_bin  =  grads > threshold;

figure;
subplot(2,2,1);
imshow(img_rgb);
title("RGB")
subplot(2,2,2);
imshow(img_grey);
title("Greyscale");
subplot(2,2,3);
imshow(grads);
title("Gradients");
subplot(2,2,4);
imshow(img_bin);
title("Thresholded");


img_canny = edge(img_grey, "canny");
figure;
subplot(1,2,1);
imshow(img_canny);
title("Canny");
subplot(1,2,2);
imshow(img_bin);
title("Sobel");

%% 2. Del: Houghova transformacija
clc;
close all;
akumulator = double(zeros(401,401)); % os y = n, os x = k
img_size = size(img_canny)
delitev = 400;
k = -2:0.01:2;
n = -200:1:200;
N = 5;

% formula: ro = x * cos(theta) + y * sin(theta), y = k * x + n

% sprehod čez sliko
for px_y = 1:img_size(1)
    for px_x = 1:img_size(2)

        px = img_canny(px_y,px_x); % vrednost trenutnega piksla (0 / 1)
        %piksel = hotelSobel(yPx,xPx); % vrednost trenutnega piksla (0 / 1)

        if px == 1 % piksel je bel
            for k_cnt = 1:delitev % vse vrednosti k-ja
                for n_cnt = 1:delitev % vse vrednosti n-ja
                    if px_y == round(k(k_cnt) * px_x + n(n_cnt)) % y = k * x + n
                        akumulator(k_cnt, n_cnt) = akumulator(k_cnt, n_cnt) + 1;
                    end
                end
            end
        end
    end
end

figure;
imshow(uint8(akumulator))

% Izriši črte na sliki
drawLines(img_rgb,akumulator,N, "Crte");

%% 3. Pridobivanje ozadja posnetka
clc;
close all;

% Preberi posnetek (predpostavimo, da imate npr. video.avi)
video_file = 'squash.avi'; % Zamenjajte z vašo datoteko
video = VideoReader(video_file);

% Nastavitve
interval = 10; % Uporabi vsako deseto sliko
n_frames = floor(video.NumFrames / interval); % Število izbranih slik
height = video.Height;
width = video.Width;

% Inicializiraj 4D matriko za slike
frames = zeros(height, width, 3, n_frames, 'uint8');

% Preberi slike
idx = 1;
for i = 1:interval:video.NumFrames
    video.CurrentTime = (i - 1) / video.FrameRate; % Premakni na ustrezen okvir
    frame = readFrame(video);
    frames(:, :, :, idx) = frame; % Shrani okvir v 4D matriko
    idx = idx + 1;
end

% Izračunaj ozadje s pomočjo mediančne slike
background = median(frames, 4); % Median vrednosti čez čas (4. dimenzija)

% Pretvori v uint8 za prikaz
background = uint8(background);

% Prikaz slike ozadja
imshow(background);
title('Slika Ozadja');

%% 4. Del: Detekcija področij in morfološke operacije

clc;
close all;

% Preberi posnetek squash (zamenjajte z vašo datoteko)
videoFile = 'squash.avi';
video = VideoReader(videoFile);

% Nastavitve
outputVideo = VideoWriter('output_with_tracking.avi'); % Izhodni video
open(outputVideo);
threshold = 50; % Prag za razliko (nastavite glede na sliko razlike)

% Predpostavljamo, da imate sliko ozadja (background) iz prejšnje naloge


% Procesiranje videa okvir po okvir
while hasFrame(video)
    frame = readFrame(video); % Preberi okvir
    frameGray = rgb2gray(frame); % Pretvori v sivinske 
    % vrednosti (za prikaz)  
    % 1. Izračunaj sliko razlike
    diffImage = sqrt(sum((double(frame) - double(background)).^2, 3)); % Evklidska razdalja
    
    % 2. Pragovna slika (binarna slika)
    binaryImage = diffImage > threshold;
    
    % 3. Morfološke operacije za odstranjevanje šuma
    binaryImage = bwmorph(binaryImage, 'close', 5); % Zapiranje za odpravo lukenj
    binaryImage = bwmorph(binaryImage, 'open', 5);  % Odstranitev majhnih elementov
    
    % 4. Lokalizacija igralcev
    labeledImage = bwlabel(binaryImage); % Oznake regij
    stats = regionprops(labeledImage, 'BoundingBox', 'Centroid', 'Area');
    
    % Najdi dve največji regiji (dva igralca)
    [~, idx] = maxk([stats.Area], 2); % Indeksi največjih regij

    % 5. Detekcija barve majic
    playerColors = zeros(2, 3); % Shranimo barvo za vsakega igralca
    for i = 1:length(idx)
        % Ekstrahiraj piksle regije
        box = round(stats(idx(i)).BoundingBox);
        regionPixels = frame(box(2):box(2)+box(4), box(1):box(1)+box(3), :);
        regionHSV = rgb2hsv(regionPixels);
    
        % Izracun HSV komponent
        meanHue = mean(regionHSV(:, :, 1), 'all');  % Hue
        meanSaturation = mean(regionHSV(:, :, 2), 'all');  % Saturation
        meanValue = mean(regionHSV(:, :, 3), 'all');  % Value
        
        % Srednje vrednosti HSV
        playerColors(i, :) = [meanHue, meanSaturation, meanValue];
    end
    
    % Klasifikacija na bazi barve majic
    playerLabels = cell(2, 1);
   
    if playerColors(1, 1) > playerColors(2,1)
        playerLabels{2}='Inter';
        playerLabels{1}='Milan';
    else
        playerLabels{1}='Inter';
        playerLabels{2}='Milan';
    end
        
    % 6. Risanje rezultatov na izvirni sliki
    figure(1);
    imshow(frame);
    
    hold on;
    for i = 1:length(idx)
        % Prikaži okvirje okoli igralcev
        rectangle('Position', stats(idx(i)).BoundingBox, 'EdgeColor', 'r', 'LineWidth', 2);
        % Prikaži težišča
        plot(stats(idx(i)).Centroid(1), stats(idx(i)).Centroid(2), 'bo', 'MarkerSize', 10, 'LineWidth', 2);
        % Dodaj oznako igralca
        text(stats(idx(i)).BoundingBox(1), stats(idx(i)).BoundingBox(2) - 10, playerLabels{i}, 'Color', 'y', 'FontSize', 12, 'FontWeight', 'bold');
    end
    hold off;
    drawnow;
    
    % Zapiši okvir v izhodni video
    frameWithTracking = getframe(gca);
    writeVideo(outputVideo, frameWithTracking.cdata);
end

% Zaključi zapisovanje videa
close(outputVideo);
