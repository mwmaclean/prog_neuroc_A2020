% brève description de l'interface Matlab.

% operations arithmetiques de base
1 + 1
3 - 2
2 * 3
1 / 3
3 ^2
sqrt(9)
9 ^0.5

exp(1)
log(exp(2))
log10(10 ^3)
log2(2 ^10)

% https://www.youtube.com/watch?v=593w799sBms
sind(90) % en degre
sin(90)  % en radian
pi
sin(pi/2) % maintenant même y


cosd(180) % meme chose avec cos function

cos(180)
cos(pi)

% serait plus simple d'avoir un convertisseur d'un a l'autre. On peut
% définir une variable avec une telle fonction.

% definir une variable
deg2rad = pi/180; % regle de trois (π rad = 180°; π/180=0.0175)
sin(90 * deg2rad)
cos(180 *deg2rad)

% attention tout peut etre defini
rayon = 0.5;
circonference = 2*pi*rayon
pi = 2;

circonference = 2*pi*rayon
clear pi % attribuez des noms appropries a vos variables

% e.g.: i = sqrt(-1)

% definir un vecteur ou une matrice de dimension (1,n)
alpha_deg = [0 40 80 120 160 200 240 280 320 360];
alpha_deg = [0:40:360];
alpha_deg = [1:15:360];
alpha_deg = [1:1:360];
alpha_deg = [1:360];

alpha_rad = alpha_deg * deg2rad

% representer les donnees d'un vecteur dans un diagramme de dispersion (scatter plot)
figure, subplot(1,2,1),scatter(1:length(alpha_rad),alpha_rad,'filled','k'),title('"raw" alpha radian'), xlabel('index'),ylabel('radian(deg)')
set(gcf,'Position',[100 100 1000 500], 'Color', 'w')
% repeter une operation a l'aide d'une boucle : un point a la fois. On peut
% changer la "resolution" de alpha_deg
y = 0;
ii = 0;
subplot(1,2,2),title('sin(alpha radian)'), xlabel('index'),ylabel('sin(radian)')
hold on
for alpha = alpha_rad,
   ii = ii+1;
  y(ii) = sin(alpha);
  plot(y,'LineWidth',2,'Color','k'),axis([0 length(alpha_deg) -1 1])
  pause(.01) % or .01, depending on resolution of alpha_deg
end

% ou, plus simplement, en appliquant une operation directement a un vecteur
y = sin(alpha_rad);

% on peut aussi modifier plusieurs parametre du plot..
figure, plot(alpha_deg, y, '--b')
help plot
xlabel('angle (deg)')
ylabel('sin')
title('A plot')

% On peut modifier les donnees de 2 vecteurs (la frequence ici) a
% linterieur meme dune fonction. 
f1 = 1;
f2 = 3;
y1 = sin(f1*alpha_rad); % on multiplie un scalaire avec un vecteur ici.
y2 = sin(f2*alpha_rad);
figure, plot(alpha_deg, y1, 'k', alpha_deg, y2, 'r')
xlabel('angle (deg)')
ylabel('sin')
title('A plot')
legend('freq = 1', 'freq = 3')


% definir une matrice de dimension (m*n). m = rows, n = columns
b = [[1 2 3]; [4 5 6]; [7 8 9];];
b


ones(3, 3)
zeros(3, 3)
eye(3, 3)
nan(3,3)
c = rand(3, 3)

% quelques operations matricielles
b + c
b * c    % matrix multiplication. Fonctionne seulemnent quand le nombre de columns en [b] (ici 3x3) est egal au nombre de rows dans l'autre matrice [c] (ici aussi 3x3). L'ordre de multiplication est ainsi importante (b*c ~= c*b).
b .* c   % help .* 
inv(c)   % check this out : https://www.mathsisfun.com/algebra/matrix-inverse.html
c*inv(c) % on retrouve la matrice identity 
b^2      % was c^2
b.^2     % was c.^2
sqrt(b)  % was sqrt(c). sqrt des elements de b

% extraire une portion de matrice
b(1:3,2:3)
b(:,1)
b(2,:)


d = ones(3, 3)
e = zeros(3, 3)

% on represente les 1 comme present (pale), et 0 comme absent (fonce).
figure, imshow(ones(100,100))

petit_damier = ones(6, 6);
petit_damier(1:3, 1:3) = e;
petit_damier(4:6, 4:6) = e;
petit_damier

figure, imagesc(petit_damier,[0 1]),colormap(gray),axis('square')

% un exemple de script
nn = 50;                        % la largeur d'une case
e = zeros(nn/2, nn/2);          
petit_damier = ones(nn, nn);
petit_damier(1:nn/2, 1:nn/2) = e;
petit_damier(nn/2+1:nn, nn/2+1:nn) = e;
figure, imagesc(petit_damier,[0 1]),colormap(gray),axis('square')




% Devoir : �crire un script (ou une fonction) qui dessine un grand_damier semblable au petit_damier de 2*N x 2*M cases en utilisant le petit_damier et des boucles.
