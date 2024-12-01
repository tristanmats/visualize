% Fiber parameters (affine lines parallel to U = span(e1))
t = linspace(-1, 1, 100); % Parameter for line generation (along x in W)

% Number of fibers
num_fibers = 5; 

% Generate random fiber offsets (only in the z direction, perpendicular to U)
fiber_offsets_z = 2 * rand(1, num_fibers) - 1;  % Random offsets along z ([-1, 1])

% 3D Plot
figure;
hold on;

% Plot the subspace U = span(e1) (highlighted in red)
plot3(t, zeros(size(t)), zeros(size(t)), 'r-', 'LineWidth', 2, 'DisplayName', 'U = span(e1)');

% Plot the subspace W = span(e1, e3) (highlighted in blue)
x_w = linspace(-1, 1, 20);
z_w = linspace(-1, 1, 20);
[xx, zz] = meshgrid(x_w, z_w); % Create grid for the x-z plane
yy_w = zeros(size(xx));  % y = 0 for the plane (since W lies in the x-z plane)

% Plot W as the x-z plane
surf(xx, yy_w, zz, 'FaceColor', 'b', 'FaceAlpha', 0.3, 'EdgeColor', 'none', 'DisplayName', 'W = span(e1, e3)');

% Plot multiple fibers (blue solid lines) for W (spanning the entire x-range of W)
for i = 1:num_fibers
    % Create fibers extending across the entire W-plane in the x direction
    fiber_x = linspace(-1, 1, 100); % Extend x-coordinate across the plane
    fiber_z = fiber_offsets_z(i) * ones(size(fiber_x)); % Fixed z-offset for the fiber
    fiber_y = zeros(size(fiber_x)); % y = 0 for all fibers in W
    
    % Plot fiber as a green line (within the W-plane)
    plot3(fiber_x, fiber_y, fiber_z, 'b-', 'LineWidth', 1.5, 'DisplayName', ['Fiber ' num2str(i)]);
end

% Plot the quotient space W/U as a vertical line (along the z-axis)
plot3(zeros(size(t)), zeros(size(t)), t, 'g-', 'LineWidth', 3, 'DisplayName', 'W/U (vertical line along z)');

% Add arrows for axes
quiver3(0, 0, 0, 1, 0, 0, 0, 'k', 'LineWidth', 1.5, 'DisplayName', 'x-axis (e1)');
quiver3(0, 0, 0, 0, 1, 0, 0, 'k', 'LineWidth', 1.5, 'DisplayName', 'y-axis (e2)');
quiver3(0, 0, 0, 0, 0, 1, 0, 'k', 'LineWidth', 1.5, 'DisplayName', 'z-axis (e3)');

% Add labels and grid
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');
title('Subspace U = span(e1), W = span(e1, e3), and Quotient W/U');
legend;
axis([-1 1 -1 1 -1 1]); % Keep fibers within plot bounds
axis equal;
grid on;
view(3);
hold off;

