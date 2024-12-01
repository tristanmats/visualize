% Basis vectors
e1 = [1; 0; 0]; % Basis for U
e2 = [0; 1; 0]; % Offset direction (for fibers)
e3 = [0; 0; 1]; % Perpendicular direction (for fiber translations in z)

% Fiber parameters (affine lines parallel to e2 = span(e2))
t = linspace(-1, 1, 100); % Parameter for line generation

% Number of fibers (along the y direction)
num_fibers = 3; 

% Generate random fiber offsets along z (for the fibers along e3)
fiber_offsets_z = 2 * rand(1, num_fibers) - 1;  % Random offsets along z ([-1, 1])

% 3D Plot
figure;
hold on;

% Plot the plane in y-z direction for V/U
% Plane for V/U should lie in y-z direction (e2, e3)
[z_plane, y_plane] = meshgrid(linspace(-1, 1, 20), linspace(-1, 1, 20)); % Create a plane in y-z
x_plane = zeros(size(z_plane));  % z = 0 (since the plane lies in y-z)

% Plot the plane representing V/U (spanning e2-e3 direction)
surf(x_plane, y_plane, z_plane, 'FaceColor', 'g', 'FaceAlpha', 0.2, 'EdgeColor', 'none', 'DisplayName', 'V/U (Plane in y-z)');

% Plot the line in z direction representing W/U (z-axis)
plot3(zeros(size(t)), zeros(size(t)), t, 'r-', 'LineWidth', 3, 'DisplayName', 'W/U (Line along z)');

% Plot fibers (blue lines) along the y direction (translations along e2)
for i = 1:num_fibers
    fiber = e3 * t + fiber_offsets_z(i) * e2;  % Translating along e2 and e3
    plot3(fiber(1, :), fiber(2, :), fiber(3, :), 'b-', 'LineWidth', 1.5, 'DisplayName', ['Fiber ' num2str(i)]);
end

% Plot the quotient space (V/U)/(W/U) as a vertical line along the y-axis
plot3(zeros(size(t)), t, zeros(size(t)), 'c-', 'LineWidth', 3, 'DisplayName', '(V/U)/(W/U) (Line along y)');

% Add arrows for axes
quiver3(0, 0, 0, 1, 0, 0, 0, 'k', 'LineWidth', 1.5, 'DisplayName', 'x-axis (e1)');
quiver3(0, 0, 0, 0, 1, 0, 0, 'k', 'LineWidth', 1.5, 'DisplayName', 'y-axis (e2)');
quiver3(0, 0, 0, 0, 0, 1, 0, 'k', 'LineWidth', 1.5, 'DisplayName', 'z-axis (e3)');

% Add labels and grid
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');
title('Visualization of Quotient Spaces V/U/W/U');
legend;
axis([-1 1 -1 1 -1 1]); % Keep fibers within plot bounds
axis equal;
grid on;
view(3);
hold off;

