clear;
close all;

M = 3;

% Get discretization of unit disk with given M
[border, domain, index2row, row2length, neighbours, stepsizes] = discretize_unit_disk(M);

% Unit Disk
r = 1;
th = 0:pi/50:2*pi;
xunit = r * cos(th);
yunit = r * sin(th);

% Plotting
figure;
hold on;
grid on;

plot(xunit, yunit, 'LineWidth', 2);
s = scatter(domain(:,1), domain(:,2), 'filled');

number_gridlines = M + 2;
ax = gca;
XL = get(ax, 'XLim');
YL = get(ax, 'YLim');
xticks_at = linspace(XL(1), XL(2), number_gridlines);
yticks_at = linspace(YL(1), YL(2), number_gridlines);
set(ax, 'XTick', xticks_at, 'YTick', yticks_at);

scatter(border(:,1), border(:,2), 'filled');
hold off;