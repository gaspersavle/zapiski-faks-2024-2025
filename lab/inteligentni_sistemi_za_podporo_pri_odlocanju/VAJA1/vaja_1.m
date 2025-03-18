clear all;
close all;
clc;

d1 = ping_stolp_1;
d2 = ping_stolp_2;
d3 = ping_stolp_3;
d_pinged = [d1,d2,d3];

b1x = 1;
b1y = 1;
b1 = [b1x,b1y];

b2x = 10;
b2y = 5;
b2 = [b2x, b2y];

b3x = 2;
b3y = 4;
b3 = [b3x, b3y];

bases = [b1;b2;b3];

initial_guess = mean(bases);
% pos_phone = 12.*rand(1,2)
pos_phone = initial_guess;



num_iters = 500;
step = 0.01;
% step = 1;
error = 0.00001;
err = inf;

figure;
hold on;
xlabel('X');
ylabel('Y');
axis equal;

scatter(b1x, b1y,'filled', 'MarkerFaceColor',[1,0,0]);
scatter(b2x, b2y,'filled', 'MarkerFaceColor',[0,1,0]);
scatter(b3x, b3y,'filled', 'MarkerFaceColor',[0,0,1]);

viscircles([b1x,b1y], d1, Color='red', LineWidth=0.3);
viscircles([b2x,b2y], d2, Color='green',LineWidth=0.3);
viscircles([b3x,b3y], d3, Color='blue',LineWidth=0.3);

text(bases(:, 1), bases(:, 2), {'BS1', 'BS2', 'BS3'}, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');

scatter(initial_guess(1), initial_guess(2), 'd','filled', 'MarkerFaceColor',[0,0,0]);

phone_plot = scatter(pos_phone(1), pos_phone(2), 'filled', Color='black');
trail_plot = plot(pos_phone(1), pos_phone(2), LineWidth=2, Color='black'); 
pos_hist = pos_phone;


while i < num_iters && err > error
    [res,J] = get_res_and_jacobian(pos_phone, bases, d_pinged);
    
    delta = - (J' * J) \ (J' * res); 
    pos_phone = pos_phone + step * delta';
    
    pos_hist = [pos_hist; pos_phone];

    set(phone_plot, 'XData', pos_phone(1), 'YData', pos_phone(2));
    set(trail_plot, 'XData', pos_hist(:, 1), 'YData', pos_hist(:, 2));

    drawnow;
    err = norm(res)
    i = i + 1;
end


function [res, J] = get_res_and_jacobian(phone_pos, base_pos, dists)
    num_stats = length(base_pos);
    res = zeros(num_stats,1);
    J = zeros(num_stats, 2);

    for i = 1:num_stats
        dx = phone_pos(1)-base_pos(i,1);
        dy = phone_pos(2)-base_pos(i,2);
        dist = norm([dx,dy]);
        
        res(i) = dist-dists(i);

        J(i,1) = dx/dist;
        J(i,2) = dy/dist;
    end
end