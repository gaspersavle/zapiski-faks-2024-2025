k0 = 8/3;
k1 = -2/3;
k2 = -1;
sim_time = 10;
out = sim('vaja_4.slx');

%%
figure;
subplot(2,1,1);
stem(out.diskretni.Time, out.diskretni.Data(:,1));
hold on;
plot(out.zvezni.time, out.zvezni.Data(:,1));
legend("u(k)", "u_z(t)");

subplot(2,1,2);
plot(out.zvezni.Time, out.zvezni.Data(:,2));
hold on;
stem(out.diskretni.Time, out.diskretni.Data(:,2));
legend("y_z(t)", "y(k)");

%%
tocke_stabilnosti = [-2/3 -9;2   -1;-2    3];
for i=1:3
    k1 = tocke_stabilnosti(i, 1);
    k2 = tocke_stabilnosti(i, 2);
    sim_time = 10;
    out = sim('vaja_4.slx');

    figure;
    subplot(2,1,1);
    stem(out.diskretni.Time, out.diskretni.Data(:,1));
    hold on;
    plot(out.zvezni.time, out.zvezni.Data(:,1));
    title(["K_1 = ", num2str(k1), "| K_2 = ", num2str(k2)]);
    legend("u(k)", "u_z(t)");
    
    subplot(2,1,2);
    plot(out.zvezni.Time, out.zvezni.Data(:,2));
    hold on;
    stem(out.diskretni.Time, out.diskretni.Data(:,2));
    legend("y_z(t)", "y(k)");
 
end

k1 = tocke_stabilnosti(:, 1);
k2 = tocke_stabilnosti(:, 2);
    
figure;
plot([k1; k1(1)], [k2; k2(1)]);
title("Obmocje stabilnosti")
grid on;
xlabel('k1');
ylabel('k2');