m_1 = 80
m_2 = 20
g = 9.82
l = 30
f = 400

sim("shema.slx")

figure;
plot(out.time, out.pos, DisplayName="Position");
hold on;
plot(out.time, out.angle, DisplayName="Angle");
hold on;
plot(out.time, out.ang_vel, DisplayName="Angular velocity")
hold on;
plot(out.time, out.ang_acc, DisplayName="Angular acceleration");
legend%("position", "angle", "angular_velocity", "angular_acceleration");