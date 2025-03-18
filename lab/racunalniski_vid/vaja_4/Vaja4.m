%% Vaja1 - Sobel in Canny
clc;
clear all;
close all;
hotel = imread("hotel.jpg");
velikost = size(hotel);
hotelSiv = rgb2gray(hotel);
subplot(1,3,1);
imshow(hotelSiv);
title("Original");

sobelFilterX = [1 0 -1; 2 0 -2; 1 0 -1];
sobelFilterY = [1 2 1; 0 0 0; -1 -2 -1];



hotelSobelX = imfilter(hotelSiv,sobelFilterX);
hotelSobelY = imfilter(hotelSiv, sobelFilterY);

% Sobel
hotelSobelSiv = sqrt(double(hotelSobelX).^2 + double(hotelSobelY).^2); 
prag = 0.3 * max(hotelSobelSiv(:));
hotelSobel = hotelSobelSiv > prag;
subplot(1,3,2);
imshow(hotelSobel);
title("Sobel");

% Canny
hotelCanny = edge(hotelSiv,"canny");
subplot(1,3,3);
imshow(hotelCanny);
title("Canny");

%% Vaja2 - Houghova transformacija
clc;
close all;
akumulator = double(zeros(401,401)); % os y = n, os x = k
delitev = 400;
k = -2:0.01:2;
n = -200:1:200;
N_iskanih = 5;

% formula: ro = x * cos(theta) + y * sin(theta), y = k * x + n

% sprehod čez sliko
for yPx = 1:velikost(1)
    for xPx = 1:velikost(2)

        piksel = hotelCanny(yPx,xPx); % vrednost trenutnega piksla (0 / 1)
        %piksel = hotelSobel(yPx,xPx); % vrednost trenutnega piksla (0 / 1)

        if piksel == 1 % piksel je bel
            for k_cnt = 1:delitev % vse vrednosti k-ja
                for n_cnt = 1:delitev % vse vrednosti n-ja
                    if yPx == round(k(k_cnt) * xPx + n(n_cnt)) % y = k * x + n
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
drawLines(hotel,akumulator,N_iskanih, "Crte");

%% Vaja3 - Ozadje posnetka
clc;
close all;
videoRaw = VideoReader("squash.avi");
slikaVideo = read(videoRaw, 20); % Najboljši frame
video = read(videoRaw,[1 inf]);
dolzina = videoRaw.NumFrames;
dimenzije = size(slikaVideo);

frameStep = 20;

%imshow(slikaVideo);

povprecjeBarv = uint8(zeros(dimenzije(1),dimenzije(2),dimenzije(3),floor(dolzina/frameStep)));

for frame = 1:frameStep:dolzina
    trenutnaSlika = read(videoRaw, frame);
    povprecjeBarv(:,:,:,(floor(frame/frameStep)+1)) = trenutnaSlika(:,:,:);
end

ozadje = mode(povprecjeBarv,4);
imshow(uint8(ozadje));

%% Vaja4 - Detekcija področij
clc;
close all;
videoObdelan = uint8(zeros(dimenzije(1),dimenzije(2),3, dolzina));
matrikaRob = ones(dimenzije(1),dimenzije(2)); % da ostane samo igrišče
rob = 40;

% Nastavljanje roba - kar hočem da ostane je 1 ostalo je 0
matrikaRob(1:rob,:) = 0; % zgorej
matrikaRob(end-rob:end,:) = 0; % spodej
matrikaRob(:,1:rob) = 0; % levo
matrikaRob(:,end-rob:end) = 0; % desno

% Vrednost praga
prag = 15.3;

for frame = 1:dolzina
    trenutnaSlika = read(videoRaw, frame);
    
    % Evklidska razdalja - matrika
    frameEvklidski = sqrt(double((trenutnaSlika(:,:,1) - ozadje(:,:,1)).^2 + (trenutnaSlika(:,:,2) - ozadje(:,:,2)).^2 + (trenutnaSlika(:,:,3) - ozadje(:,:,3)).^2));
    
    % Brisanje okolice - množenje z matriko
    videoObrezan(:,:) = frameEvklidski .* matrikaRob;
    
    % Upragovljanje
    frameUpragovljen = videoObrezan(:,:) > prag; 

    % Čiščenje šuma
    slikaBrezSuma1 = bwmorph(frameUpragovljen,"majority",10);
    slikaBrezSuma2 = bwmorph(slikaBrezSuma1,"thicken",5); 
    slikaBrezSuma3 = bwmorph(slikaBrezSuma2,"close",5);

    % Najde področja na sliki in koordinate
    slikaZOznako = logical(slikaBrezSuma3); % bwlabel
    [koordinate] = regionprops(slikaZOznako, "BoundingBox"); % [X, Y, Width, Height]; 0,0 zgorej levo

    % Shrani podatke o obrisu
    x1 = floor(koordinate(1).BoundingBox(1));
    y1 = floor(koordinate(1).BoundingBox(2));
    sirina1 = floor(koordinate(1).BoundingBox(3));
    visina1 = floor(koordinate(1).BoundingBox(4));

    if length(koordinate) > 1
        x2 = floor(koordinate(2).BoundingBox(1));
        y2 = floor(koordinate(2).BoundingBox(2));
        sirina2 = floor(koordinate(2).BoundingBox(3));
        visina2 = floor(koordinate(2).BoundingBox(4));
    end

    % Risanje kvadrata 1
    % Zgoraj
    trenutnaSlika(y1:y1+1,x1:x1+sirina1,1) = 255;
    trenutnaSlika(y1:y1+1,x1:x1+sirina1,2) = 0;
    trenutnaSlika(y1:y1+1,x1:x1+sirina1,3) = 0;
    % Spodaj
    trenutnaSlika(y1+visina1:y1+visina1+1,x1:x1+sirina1,1) = 255;
    trenutnaSlika(y1+visina1:y1+visina1+1,x1:x1+sirina1,2) = 0;
    trenutnaSlika(y1+visina1:y1+visina1+1,x1:x1+sirina1,3) = 0;
    % Levo
    trenutnaSlika(y1:y1+visina1,x1:x1+1,1) = 255;
    trenutnaSlika(y1:y1+visina1,x1:x1+1,2) = 0;
    trenutnaSlika(y1:y1+visina1,x1:x1+1,3) = 0;
    % Desno
    trenutnaSlika(y1:y1+visina1,x1+sirina1:x1+sirina1+1,1) = 255;
    trenutnaSlika(y1:y1+visina1,x1+sirina1:x1+sirina1+1,2) = 0;
    trenutnaSlika(y1:y1+visina1,x1+sirina1:x1+sirina1+1,3) = 0;

    % Risanje kvadrata 2
    if length(koordinate) > 1
        % Zgoraj
        trenutnaSlika(y2:y2+1,x2:x2+sirina2,1) = 255;
        trenutnaSlika(y2:y2+1,x2:x2+sirina2,2) = 0;
        trenutnaSlika(y2:y2+1,x2:x2+sirina2,3) = 0;
        % Spodaj
        trenutnaSlika(y2+visina2:y2+visina2+1,x2:x2+sirina2,1) = 255;
        trenutnaSlika(y2+visina2:y2+visina2+1,x2:x2+sirina2,2) = 0;
        trenutnaSlika(y2+visina2:y2+visina2+1,x2:x2+sirina2,3) = 0;
        % Levo
        trenutnaSlika(y2:y2+visina2,x2:x2+1,1) = 255;
        trenutnaSlika(y2:y2+visina2,x2:x2+1,2) = 0;
        trenutnaSlika(y2:y2+visina2,x2:x2+1,3) = 0;
        % Desno
        trenutnaSlika(y2:y2+visina2,x2+sirina2:x2+sirina2+1,1) = 255;
        trenutnaSlika(y2:y2+visina2,x2+sirina2:x2+sirina2+1,2) = 0;
        trenutnaSlika(y2:y2+visina2,x2+sirina2:x2+sirina2+1,3) = 0;
    end

    % Shranjevanje slike za video  
    videoObdelan(:,:,1,frame) = trenutnaSlika(:,:,1);
    videoObdelan(:,:,2,frame) = trenutnaSlika(:,:,2);
    videoObdelan(:,:,3,frame) = trenutnaSlika(:,:,3);  

    % %subplot(1,2,1);
    % figure;
    % imagesc(frameUpragovljen);
    % colormap gray;
    % 
    % %subplot(1,2,2);
    % figure;
    % imagesc(slikaZOznako);
    % colormap gray;
    % stop;
end

v = VideoWriter("squashPozicije.avi");
open(v);
for i = 1:dolzina
    frame = videoObdelan(:, :, :, i); 
    writeVideo(v, frame); 
end
%writeVideo(v, videoObdelan);
close(v);

%% Vaja4 - Detekcija igralcev
clc;
close all;
videoObdelan = uint8(zeros(dimenzije(1),dimenzije(2),3, dolzina));
matrikaRob = ones(dimenzije(1),dimenzije(2)); % da ostane samo igrišče
rob = 57;
robUD = 20;

% Nastavljanje roba - kar hočem da ostane je 1 ostalo je 0
matrikaRob(1:robUD,:) = 0; % zgorej
matrikaRob(end-robUD:end,:) = 0; % spodej
matrikaRob(:,1:rob) = 0; % levo
matrikaRob(:,end-rob:end) = 0; % desno

% Vrednost praga
pragA = 15.3;
pragB = 15.3;

for frame = 1:dolzina
    % Shranjevanje slike
    trenutnaSlika = read(videoRaw, frame);
    slikaA = (trenutnaSlika(:,:,1) < 230) & (trenutnaSlika(:,:,2) <55) & (trenutnaSlika(:,:,3) < 100);
    slikaB = (trenutnaSlika(:,:,1) > 130 & trenutnaSlika(:,:,1) < 180) & (trenutnaSlika(:,:,2) > 100 & trenutnaSlika(:,:,2) < 190) & (trenutnaSlika(:,:,3) > 0);
    % imshow(slikaB);
    % stop;

    % Brisanje okolice - množenje z matriko
    videoObrezanA(:,:) = slikaA .* matrikaRob;
    videoObrezanB(:,:) = slikaB .* matrikaRob;

    % Čiščenje šuma
    slikaBrezSumaA = bwmorph(videoObrezanA,"majority",15);
    slikaBrezSumaA = bwmorph(slikaBrezSumaA,"thicken",7);
    slikaBrezSumaA = bwmorph(slikaBrezSumaA,"close",5); 
    % figure;
    % imshow(slikaBrezSumaA);

    slikaBrezSumaB = bwmorph(videoObrezanB,"majority",10);
    slikaBrezSumaB = bwmorph(slikaBrezSumaB,"thicken",7); 
    slikaBrezSumaB = bwmorph(slikaBrezSumaB,"close",5);
    % figure;
    % imshow(slikaBrezSumaB);
    % stop;

    % Najde področja na sliki in koordinate
    slikaZOznakoA = logical(slikaBrezSumaA); % bwlabel
    [koordinateA] = regionprops(slikaZOznakoA, "BoundingBox"); % [X, Y, Width, Height]; 0,0 zgorej levo

    slikaZOznakoB = logical(slikaBrezSumaB); % bwlabel
    [koordinateB] = regionprops(slikaZOznakoB, "BoundingBox"); % [X, Y, Width, Height]; 0,0 zgorej levo

    % Risanje kvadrata 1
    if ~isempty(koordinateA)
        x1 = floor(koordinateA(1).BoundingBox(1));
        y1 = floor(koordinateA(1).BoundingBox(2));
        sirina1 = floor(koordinateA(1).BoundingBox(3));
        visina1 = floor(koordinateA(1).BoundingBox(4));

        % Zgoraj
        trenutnaSlika(y1:y1+1,x1:x1+sirina1,1) = 255;
        trenutnaSlika(y1:y1+1,x1:x1+sirina1,2) = 0;
        trenutnaSlika(y1:y1+1,x1:x1+sirina1,3) = 0;
        % Spodaj
        trenutnaSlika(y1+visina1:y1+visina1+1,x1:x1+sirina1,1) = 255;
        trenutnaSlika(y1+visina1:y1+visina1+1,x1:x1+sirina1,2) = 0;
        trenutnaSlika(y1+visina1:y1+visina1+1,x1:x1+sirina1,3) = 0;
        % Levo
        trenutnaSlika(y1:y1+visina1,x1:x1+1,1) = 255;
        trenutnaSlika(y1:y1+visina1,x1:x1+1,2) = 0;
        trenutnaSlika(y1:y1+visina1,x1:x1+1,3) = 0;
        % Desno
        trenutnaSlika(y1:y1+visina1,x1+sirina1:x1+sirina1+1,1) = 255;
        trenutnaSlika(y1:y1+visina1,x1+sirina1:x1+sirina1+1,2) = 0;
        trenutnaSlika(y1:y1+visina1,x1+sirina1:x1+sirina1+1,3) = 0;

        trenutnaSlika = insertText(trenutnaSlika, [(x1+sirina1/2) (y1+visina1/2)], 'A', 'FontSize', 10);
    end

    % Risanje kvadrata 2
    if ~isempty(koordinateB)
        x2 = floor(koordinateB(1).BoundingBox(1));
        y2 = floor(koordinateB(1).BoundingBox(2));
        sirina2 = floor(koordinateB(1).BoundingBox(3));
        visina2 = floor(koordinateB(1).BoundingBox(4));

        % Zgoraj
        trenutnaSlika(y2:y2+1,x2:x2+sirina2,1) = 255;
        trenutnaSlika(y2:y2+1,x2:x2+sirina2,2) = 0;
        trenutnaSlika(y2:y2+1,x2:x2+sirina2,3) = 0;
        % Spodaj
        trenutnaSlika(y2+visina2:y2+visina2+1,x2:x2+sirina2,1) = 255;
        trenutnaSlika(y2+visina2:y2+visina2+1,x2:x2+sirina2,2) = 0;
        trenutnaSlika(y2+visina2:y2+visina2+1,x2:x2+sirina2,3) = 0;
        % Levo
        trenutnaSlika(y2:y2+visina2,x2:x2+1,1) = 255;
        trenutnaSlika(y2:y2+visina2,x2:x2+1,2) = 0;
        trenutnaSlika(y2:y2+visina2,x2:x2+1,3) = 0;
        % Desno
        trenutnaSlika(y2:y2+visina2,x2+sirina2:x2+sirina2+1,1) = 255;
        trenutnaSlika(y2:y2+visina2,x2+sirina2:x2+sirina2+1,2) = 0;
        trenutnaSlika(y2:y2+visina2,x2+sirina2:x2+sirina2+1,3) = 0;
        trenutnaSlika = insertText(trenutnaSlika, [(x2+sirina2/2) (y2+visina2/2)], 'B', 'FontSize', 10);
    end

    % Shranjevanje slike za video  
    videoObdelan(:,:,1,frame) = trenutnaSlika(:,:,1);
    videoObdelan(:,:,2,frame) = trenutnaSlika(:,:,2);
    videoObdelan(:,:,3,frame) = trenutnaSlika(:,:,3);  

    % %subplot(1,2,1);
    % figure;
    % imagesc(frameUpragovljen);
    % colormap gray;
    % 
    % %subplot(1,2,2);
    % figure;
    % imagesc(slikaZOznako);
    % colormap gray;
    % stop;
end

v = VideoWriter("squashPozicije2.avi");
open(v);
writeVideo(v, videoObdelan);
close(v);

















