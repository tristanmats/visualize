% Basis vectors
e1 = [1; 0; 0]; % Basis for W (first direction)
e2 = [0; 1; 0]; % Direction for fiber translations (in y-axis)
e3 = [0; 0; 1]; % Basis for W (second direction, along z-axis)

% Fiber parameters (affine planes parallel to W = span(e1, e3))
[x, z] = meshgrid(linspace(-1, 1, 20), linspace(-1, 1, 20)); % Grid for plotting

% Number of fibers
num_fibers = 5;

% Adjust spacing between fibers: 0.4 units between planes
fiber_offsets_y = linspace(-0.4*(num_fibers-1), 0.4*(num_fibers-1), num_fibers); % Evenly spaced offsets

% 3D Plot
figure;
hold on;

% Plot the subspace W = span(e1, e3) (highlighted in red)
% Create a grid of points in the x-z plane and plot them as a surface
y = zeros(size(x)); % y = 0 for the plane W
surf(x, y, z, 'FaceColor', 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none', 'DisplayName', 'W = span(e1, e3)');

% Plot multiple fibers (blue affine planes parallel to W)
for i = 1:num_fibers
    % Plot the affine plane as a translated version of the xz-plane (W)
    % The fiber is translated along the y-axis by fiber_offsets_y(i)
    y_offset = fiber_offsets_y(i); % Translation along y-axis
    surf(x, y_offset + y, z, 'FaceColor', 'b', 'FaceAlpha', 0.5, 'EdgeColor', 'none', 'DisplayName', ['Fiber ' num2str(i)]);
end

% Plot the green line along e2 to demonstrate V/W
% The green line will be a line along the y-axis, showing how V/W behaves
y_line = linspace(-1, 1, 100);  % Range for the y-values of the green line
z_line = zeros(size(y_line));  % z-values stay constant
x_line = zeros(size(y_line));  % x-values stay constant

% Plot the green line along e2 (vertical line along the y-axis)
plot3(x_line, y_line, z_line, 'g-', 'LineWidth', 2, 'DisplayName', 'Green line (V/W)');

% Add arrows for axes
quiver3(0, 0, 0, 1, 0, 0, 0, 'k', 'LineWidth', 1.5, 'DisplayName', 'x-axis (e1)');
quiver3(0, 0, 0, 0, 1, 0, 0, 'k', 'LineWidth', 1.5, 'DisplayName', 'y-axis (e2)');
quiver3(0, 0, 0, 0, 0, 1, 0, 'k', 'LineWidth', 1.5, 'DisplayName', 'z-axis (e3)');

% Add labels and grid
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');
title('Subspace W = span(e1, e3), Affine Planes (Fibers), and V/W (Green Line)');
legend;
axis([-1 1 -1 1 -1 1]); % Adjust bounds to show fibers within plot
axis equal;
grid on;
view(3);
hold off;

