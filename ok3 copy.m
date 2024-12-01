% Basis vectors
e1 = [1; 0; 0]; % Basis for U
e2 = [0; 1; 0]; % Offset direction (for fibers)
e3 = [0; 0; 1]; % Perpendicular direction (for fiber translations in z)

% Fiber parameters (affine lines parallel to U = span(e1))
t = linspace(-1, 1, 100); % Parameter for line generation

% Number of fibers
num_fibers = 5; 

% Generate random fiber offsets
fiber_offsets_y = 2 * rand(1, num_fibers) - 1;  % Random offsets along y ([-1, 1])
fiber_offsets_z = 2 * rand(1, num_fibers) - 1;  % Random offsets along z ([-1, 1])

% 3D Plot
figure;
hold on;

% Plot the subspace U = span(e1) (highlighted in red)
plot3(t, zeros(size(t)), zeros(size(t)), 'r-', 'LineWidth', 2, 'DisplayName', 'U = span(e1)');

% Plot multiple fibers (blue solid lines)
for i = 1:num_fibers
    % Create random translations for each fiber in y and z directions
    fiber = e1 * t + fiber_offsets_y(i) * e2 + fiber_offsets_z(i) * e3;
    
    % Plot fiber as a blue line
    plot3(fiber(1, :), fiber(2, :), fiber(3, :), 'b-', 'LineWidth', 1.5, 'DisplayName', ['Fiber ' num2str(i)]);
end

% Add arrows for axes
quiver3(0, 0, 0, 1, 0, 0, 0, 'k', 'LineWidth', 1.5, 'DisplayName', 'x-axis (e1)');
quiver3(0, 0, 0, 0, 1, 0, 0, 'k', 'LineWidth', 1.5, 'DisplayName', 'y-axis (e2)');
quiver3(0, 0, 0, 0, 0, 1, 0, 'k', 'LineWidth', 1.5, 'DisplayName', 'z-axis (e3)');

% Plot the translucent green plane in e2-e3 direction to represent V/U
% Grid for the green plane (spanning e2 and e3 directions)
[y_plane, z_plane] = meshgrid(linspace(-1, 1, 20), linspace(-1, 1, 20));  % Create grid for the plane
x_plane = zeros(size(y_plane));  % x = 0 for the plane

% Create a translucent green plane spanning the e2-e3 direction
surf(x_plane, y_plane, z_plane, 'FaceColor', 'g', 'FaceAlpha', 0.3, 'EdgeColor', 'none', 'DisplayName', 'V/U (e2-e3 plane)');

% Add labels and grid
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');
title('Subspace U = span(e1), Multiple Scattered Fibers, and V/U (Green Plane)');
legend;
axis([-1 1 -1 1 -1 1]); % Keep fibers within plot bounds
axis equal;
grid on;
view(3);
hold off;

