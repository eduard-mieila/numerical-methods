function [cost] = compute_cost_pc(points, centroids)
  % Vom calcula distanta unui punct fata de fiecare centroid
  % si vom adauga minimul la cost.
  cost = 0;
  for i = 1 : rows(points)
    dist = zeros(1,rows(centroids));
    for c = 1 : rows(centroids)
      dist(1,c) = eucl_dist(points(i,:), centroids(c,:));
    endfor
    cost += min(min(dist));
  endfor

endfunction

