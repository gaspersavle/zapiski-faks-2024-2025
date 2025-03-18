%% Naloga 1 - Podvzorčenje slik
clc;
close all;
clear all;
videoRaw = VideoReader("Holywood.avi");
video = read(videoRaw,[1 inf]);
dolzina = videoRaw.NumFrames;
slikaVideo = read(videoRaw, 1);
dimenzije = size(slikaVideo);

% Nearest neighbor
% 1/2
for i = 1:dolzina
    HolywoodNN1_2(:,:,:,i) = imresize(video(:,:,:,i),0.5,"nearest");   
end

v = VideoWriter("VideoScaled\HolywoodNN1_2.avi");
open(v);
writeVideo(v, HolywoodNN1_2);
close(v);

% 1/4
for i = 1:dolzina
    HolywoodNN1_4(:,:,:,i) = imresize(video(:,:,:,i),0.25,"nearest");   
end

v = VideoWriter("VideoScaled\HolywoodNN1_4.avi");
open(v);
writeVideo(v, HolywoodNN1_4);
close(v);

% 1/8
for i = 1:dolzina
    HolywoodNN1_8(:,:,:,i) = imresize(video(:,:,:,i),0.125,"nearest");   
end

v = VideoWriter("VideoScaled\HolywoodNN1_8.avi");
open(v);
writeVideo(v, HolywoodNN1_8);
close(v);

% antialiasing: false
% 1/2
for i = 1:dolzina
    HolywoodAf1_2(:,:,:,i) = imresize(video(:,:,:,i),0.5,"Antialiasing",false);   
end

v = VideoWriter("VideoScaled\HolywoodAf1_2.avi");
open(v);
writeVideo(v, HolywoodAf1_2);
close(v);

% 1/4
for i = 1:dolzina
    HolywoodAf1_4(:,:,:,i) = imresize(video(:,:,:,i),0.25,"Antialiasing",false);   
end

v = VideoWriter("VideoScaled\HolywoodAf1_4.avi");
open(v);
writeVideo(v, HolywoodAf1_4);
close(v);

% 1/8
for i = 1:dolzina
    HolywoodAf1_8(:,:,:,i) = imresize(video(:,:,:,i),0.125,"Antialiasing",false);   
end

v = VideoWriter("VideoScaled\HolywoodAf1_8.avi");
open(v);
writeVideo(v, HolywoodAf1_8);
close(v);

% antialiasing: true
% 1/2
for i = 1:dolzina
    HolywoodAt1_2(:,:,:,i) = imresize(video(:,:,:,i),0.5,"Antialiasing",true);   
end

v = VideoWriter("VideoScaled\HolywoodAt1_2.avi");
open(v);
writeVideo(v, HolywoodAt1_2);
close(v);

% 1/4
for i = 1:dolzina
    HolywoodAt1_4(:,:,:,i) = imresize(video(:,:,:,i),0.25,"Antialiasing",true);   
end

v = VideoWriter("VideoScaled\HolywoodAt1_4.avi");
open(v);
writeVideo(v, HolywoodAt1_4);
close(v);

% 1/8
for i = 1:dolzina
    HolywoodAt1_8(:,:,:,i) = imresize(video(:,:,:,i),0.125,"Antialiasing",true);   
end

v = VideoWriter("VideoScaled\HolywoodAt1_8.avi");
open(v);
writeVideo(v, HolywoodAt1_8);
close(v);

%% Naloga 2 - Sledenje igralcu (evklidska razdalja)
clc;
close all;
%clear all;
videoRaw = VideoReader("squash.avi");
video = read(videoRaw,[1 inf]);
dolzina = videoRaw.NumFrames;
slikaVideo = read(videoRaw, 1); % prvi frame
dimenzije = size(slikaVideo);

videoObdelan = uint8(zeros(dimenzije(1),dimenzije(2),3, dolzina)); % koncni video

% poklikaj 2 točki na majici rdečega igralca
figure;
image(slikaVideo);
title("Izberi 2 točki na rdecem igralcu (majica)");
tocke = round(ginput(2)); % [110,121;120,130]
tocke = [110,121;120,130];
close;

% Osnovna slika
slikaIgralca = slikaVideo(tocke(2) : tocke(4), tocke(1) : tocke(3), : ); 
% figure;
% imshow(slikaIgralca);

% Dimezije slike - igralca
slikaIgralecVisina = tocke(4) - tocke(2); 
slikaIgralecSirina = tocke(3) - tocke(1);

% Center slike igralca
slikaIgralecYCenter = round(tocke(4) - slikaIgralecVisina/2); 
slikaIgralecXCenter = round(tocke(3) - slikaIgralecSirina/2);

% E-okolica in koraki iskanja
E_y = 2; % koraki za iskanje
E_x = 3; % koraki za iskanje
lokacijaY = 0;
lokacijaX = 0;

% Obdelava videa
for frame = 1:dolzina
    trenutnaSlika = video(:,:,:,frame);

    % Iskanje lokacije na prvi sliki
    if frame == 1
        lokacijaY = slikaIgralecYCenter;
        lokacijaX = slikaIgralecXCenter;
    end

    % Iskanje lokacij na ostalih slikah
    if frame > 1

        lokacijeIgralcaFrame = zeros(E_y * 2, E_x * 2); % matrika za shranjevanje lokacij na poazezni sliki

        for yShift = (0-E_y):(0+E_y)
            for xShift = (0-E_x):(0+E_x)

                % zamik območja kjer se bojo primerjale slike in lokacija za shranjevanje vrednosti
                yZamikStart = lokacijaY + yShift*slikaIgralecVisina;
                yZamikEnd = lokacijaY + (yShift+1)*slikaIgralecVisina;

                xZamikStart = lokacijaX + xShift*slikaIgralecSirina;
                xZamikEnd = lokacijaX + (xShift+1)*slikaIgralecSirina;
    
                obmocjeIskanja = trenutnaSlika(yZamikStart:yZamikEnd, xZamikStart:xZamikEnd,:);

                val = (double(obmocjeIskanja) - double(slikaIgralca)).^2;
                frameEvklidski = sqrt(sum(val(:)));
                lokacijeIgralcaFrame(yShift+E_y+1,xShift+E_x+1) = frameEvklidski;
                % subplot(1,2,1);
                % imshow(obmocjeIskanja);
                % subplot(1,2,2);
                % imshow(slikaIgralca);
                % disp(frameEvklidski);

            end
        end

        [val, indeks] = min(lokacijeIgralcaFrame(:));
        [row, col] = ind2sub(size(lokacijeIgralcaFrame), indeks); 
        lokacijaY = slikaIgralecVisina * (row-E_y-1) + floor(slikaIgralecVisina/2) + lokacijaY;
        lokacijaX = slikaIgralecSirina * (col-E_x-1) + floor(slikaIgralecSirina/2) + lokacijaX;

    end

    y = lokacijaX;
    x = lokacijaY;

    % Izris kroga
    r = 25;
    [xx, yy] = ndgrid(1:size(trenutnaSlika, 1), 1:size(trenutnaSlika, 2));
    krogZunanji = (xx - x).^2 + (yy - y).^2 <= r^2;
    krogNotranji = (xx - x).^2 + (yy - y).^2 <= (r-2)^2;
    krog = krogZunanji & ~krogNotranji;

    trenutnaSlika(:,:,1) = trenutnaSlika(:,:,1) + uint8(krog)*255; 
    trenutnaSlika(:,:,2) = trenutnaSlika(:,:,2) .* uint8(~krog);
    trenutnaSlika(:,:,3) = trenutnaSlika(:,:,3) .* uint8(~krog); 

    %imshow(trenutnaSlika);

    videoObdelan(:,:,:,frame) = trenutnaSlika(:,:,:);

end

v = VideoWriter("squashEvklidska.avi");
open(v);
writeVideo(v, videoObdelan);
close(v);

%% Naloga 2 - Sledenje igralcu (histogram)
clc;
close all;
%clear all;
videoRaw = VideoReader("squash.avi");
video = read(videoRaw,[1 inf]);
dolzina = videoRaw.NumFrames;
slikaVideo = read(videoRaw, 1); % prvi frame
dimenzije = size(slikaVideo);

videoObdelan = uint8(zeros(dimenzije(1),dimenzije(2),3, dolzina)); % koncni video

% poklikaj 2 točki na majici rdečega igralca
figure;
image(slikaVideo);
title("Izberi 2 točki na rdecem igralcu (majica)");
tocke = round(ginput(2)); % [110,121;120,130]
tocke = [110,121;120,130];
close;

% Osnovna slika
slikaIgralca = slikaVideo(tocke(2) : tocke(4), tocke(1) : tocke(3), : ); 
% figure;
% imshow(slikaIgralca);

% Dimezije slike - igralca
slikaIgralecVisina = tocke(4) - tocke(2); 
slikaIgralecSirina = tocke(3) - tocke(1);

% Center slike igralca
slikaIgralecYCenter = round(tocke(4) - slikaIgralecVisina/2); 
slikaIgralecXCenter = round(tocke(3) - slikaIgralecSirina/2);

% Histogram igralca in normiranje (kocka z najvišjo vrednostjo bo imela vrednost 255)
histogramIgralec = zeros(8,8,8); % (kot v lab 3)
for i = 1:slikaIgralecVisina
    for j = 1:slikaIgralecSirina
        piksel = slikaIgralca(i,j,:);
        loc = floor(double(piksel(:)) ./ 32) + 1; 
        histogramIgralec(loc(1),loc(2),loc(3)) = histogramIgralec(loc(1),loc(2),loc(3)) + 1;
    end
end

sestevek = sum(histogramIgralec(:));
histogramIgralecNorm = histogramIgralec / sestevek;

% E-okolica in koraki iskanja
E_y = 2; % koraki za iskanje
E_x = 3; % koraki za iskanje
lokacijaY = 0;
lokacijaX = 0;

% Obdelava videa
for frame = 1:dolzina
    trenutnaSlika = video(:,:,:,frame);

    % Iskanje lokacije na prvi sliki
    if frame == 1
        lokacijaY = slikaIgralecYCenter;
        lokacijaX = slikaIgralecXCenter;
    end

    % Iskanje lokacij na ostalih slikah
    if frame > 1

        lokacijeIgralcaFrame = zeros(E_y * 2, E_x * 2); % matrika za shranjevanje lokacij na poazezni sliki
        histogramObmocja = zeros(8,8,8); % (kot v lab 3)

        for yShift = (0-E_y):(0+E_y)
            for xShift = (0-E_x):(0+E_x)

                % zamik območja kjer se bojo primerjale slike in lokacija za shranjevanje vrednosti
                yZamikStart = lokacijaY + yShift*slikaIgralecVisina;
                yZamikEnd = lokacijaY + (yShift+1)*slikaIgralecVisina;

                xZamikStart = lokacijaX + xShift*slikaIgralecSirina;
                xZamikEnd = lokacijaX + (xShift+1)*slikaIgralecSirina;

                if (yZamikStart > 0 && xZamikStart > 0)
                    obmocjeIskanja = trenutnaSlika(yZamikStart:yZamikEnd, xZamikStart:xZamikEnd,:);
    
                    % Histogram in normiranje
                    for i = 1:slikaIgralecVisina
                        for j = 1:slikaIgralecSirina
                            piksel = obmocjeIskanja(i,j,:);
                            loc = floor(double(piksel(:)) ./ 32) + 1; 
                            histogramObmocja(loc(1),loc(2),loc(3)) = histogramObmocja(loc(1),loc(2),loc(3)) + 1;
                        end
                    end
    
                    sestevek = sum(histogramObmocja(:));
                    histogramObmocjaNorm = histogramObmocja / sestevek;
        
                    % Izračun hi-kvadrat razdalje
                    sub = 0.001;
                    hiKvadrat = sum(((histogramObmocjaNorm - histogramIgralecNorm).^2) ./ (histogramObmocjaNorm + histogramIgralecNorm + sub));
                    lokacijeIgralcaFrame(yShift+E_y+1,xShift+E_x+1) = sum(hiKvadrat(:));
                end
            end
        end

        [val, indeks] = min(lokacijeIgralcaFrame(:));
        [row, col] = ind2sub(size(lokacijeIgralcaFrame), indeks); 
        lokacijaY = slikaIgralecVisina * (row-E_y-1) + floor(slikaIgralecVisina/2) + lokacijaY;
        lokacijaX = slikaIgralecSirina * (col-E_x-1) + floor(slikaIgralecSirina/2) + lokacijaX;

    end

    y = lokacijaX;
    x = lokacijaY;

    % Izris kroga
    r = 25;
    [xx, yy] = ndgrid(1:size(trenutnaSlika, 1), 1:size(trenutnaSlika, 2));
    krogZunanji = (xx - x).^2 + (yy - y).^2 <= r^2;
    krogNotranji = (xx - x).^2 + (yy - y).^2 <= (r-2)^2;
    krog = krogZunanji & ~krogNotranji;

    trenutnaSlika(:,:,1) = trenutnaSlika(:,:,1) + uint8(krog)*255; 
    trenutnaSlika(:,:,2) = trenutnaSlika(:,:,2) .* uint8(~krog);
    trenutnaSlika(:,:,3) = trenutnaSlika(:,:,3) .* uint8(~krog); 

    %imshow(trenutnaSlika);

    videoObdelan(:,:,:,frame) = trenutnaSlika(:,:,:);

end

v = VideoWriter("squashHistogram.avi");
open(v);
writeVideo(v, videoObdelan);
close(v);

%% Naloga 2 - Sledenje igralcu (nova osnova)
clc;
close all;
%clear all;
videoRaw = VideoReader("squash.avi");
video = read(videoRaw,[1 inf]);
dolzina = videoRaw.NumFrames;
slikaVideo = read(videoRaw, 1); % prvi frame
dimenzije = size(slikaVideo);

videoObdelan = uint8(zeros(dimenzije(1),dimenzije(2),3, dolzina)); % koncni video

% poklikaj 2 točki na majici rdečega igralca
figure;
image(slikaVideo);
title("Izberi 2 točki na rdecem igralcu (majica)");
tocke = round(ginput(2)); % [110,121;120,130]
tocke = [110,121;120,130];
close;

% Osnovna slika
slikaIgralca = slikaVideo(tocke(2) : tocke(4), tocke(1) : tocke(3), : ); 
% figure;
% imshow(slikaIgralca);

% Dimezije slike - igralca
slikaIgralecVisina = tocke(4) - tocke(2); 
slikaIgralecSirina = tocke(3) - tocke(1);

% Center slike igralca
slikaIgralecYCenter = round(tocke(4) - slikaIgralecVisina/2); 
slikaIgralecXCenter = round(tocke(3) - slikaIgralecSirina/2);

% E-okolica in koraki iskanja
E_y = 2; % koraki za iskanje
E_x = 3; % koraki za iskanje
lokacijaY = 0;
lokacijaX = 0;

% Obdelava videa
for frame = 1:dolzina
    trenutnaSlika = video(:,:,:,frame);

    % Iskanje lokacije na prvi sliki
    if frame == 1
        lokacijaY = slikaIgralecYCenter;
        lokacijaX = slikaIgralecXCenter;
    end

    % Iskanje lokacij na ostalih slikah
    if frame > 1

        lokacijeIgralcaFrame = zeros(E_y * 2, E_x * 2); % matrika za shranjevanje lokacij na poazezni sliki

        for yShift = (0-E_y):(0+E_y)
            for xShift = (0-E_x):(0+E_x)

                % zamik območja kjer se bojo primerjale slike in lokacija za shranjevanje vrednosti
                yZamikStart = lokacijaY + yShift*slikaIgralecVisina;
                yZamikEnd = lokacijaY + (yShift+1)*slikaIgralecVisina;

                xZamikStart = lokacijaX + xShift*slikaIgralecSirina;
                xZamikEnd = lokacijaX + (xShift+1)*slikaIgralecSirina;
    
                if (yZamikStart > 0 && xZamikStart > 0)
                    obmocjeIskanja = trenutnaSlika(yZamikStart:yZamikEnd, xZamikStart:xZamikEnd,:);
    
                    val = (double(obmocjeIskanja) - double(slikaIgralca)).^2;
                    frameEvklidski = sqrt(sum(val(:)));
                    lokacijeIgralcaFrame(yShift+E_y+1,xShift+E_x+1) = frameEvklidski;
                    % subplot(1,2,1);
                    % imshow(obmocjeIskanja);
                    % subplot(1,2,2);
                    % imshow(slikaIgralca);
                    % disp(frameEvklidski);
                end
            end
        end

        [val, indeks] = min(lokacijeIgralcaFrame(:));
        [row, col] = ind2sub(size(lokacijeIgralcaFrame), indeks); 
        lokacijaY = slikaIgralecVisina * (row-E_y-1) + floor(slikaIgralecVisina/2) + lokacijaY;
        lokacijaX = slikaIgralecSirina * (col-E_x-1) + floor(slikaIgralecSirina/2) + lokacijaX;

    end

    y = lokacijaX;
    x = lokacijaY;

    % Izris kroga
    r = 25;
    [xx, yy] = ndgrid(1:size(trenutnaSlika, 1), 1:size(trenutnaSlika, 2));
    krogZunanji = (xx - x).^2 + (yy - y).^2 <= r^2;
    krogNotranji = (xx - x).^2 + (yy - y).^2 <= (r-2)^2;
    krog = krogZunanji & ~krogNotranji;

    trenutnaSlika(:,:,1) = trenutnaSlika(:,:,1) + uint8(krog)*255; 
    trenutnaSlika(:,:,2) = trenutnaSlika(:,:,2) .* uint8(~krog);
    trenutnaSlika(:,:,3) = trenutnaSlika(:,:,3) .* uint8(~krog); 

    %imshow(trenutnaSlika);

    videoObdelan(:,:,:,frame) = trenutnaSlika(:,:,:);

end

v = VideoWriter("squashNovaOsnova.avi");
open(v);
writeVideo(v, videoObdelan);
close(v);


