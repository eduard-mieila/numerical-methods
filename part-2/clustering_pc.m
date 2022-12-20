function [centroids] = clustering_pc(points, NC)
  
  % Initializarea centroizilor
  [nrows ncol] = size(points);
  centroids = zeros(NC,ncol);
  
  for c = 1 : NC
    npoints = 0;
    for i = 1 : nrows
      if (c == NC && mod(i,NC) == 0)
        centroids(c,:) += points(i,:);
        npoints++;
      elseif (mod(i,NC) == c)
        centroids(c,:) += points(i,:);
        npoints++;
      endif
    endfor
    centroids(c,:) /= npoints;
  endfor
  % END Initializare(Pas1 algoritm)

  iter = 0;
  while 1
    old_centroids = centroids;
    centroids = zeros(NC,ncol);

    % Determinare distante fata de centroizi
    dist = zeros(nrows,NC);
    for i = 1 : nrows
      for c = 1 : NC
        dist(i,c) = eucl_dist(points(i,:), old_centroids(c,:));
      endfor
    endfor

    % Determinarea Clusterului pentru fiecare punct
    npoints = zeros(1,NC);
    cluster = zeros(1,ncol);
    for i = 1 : nrows
      [trash minpos] = min(dist(i,:));
      centroids(minpos,:) += points(i,:);
      npoints(1,minpos)++;
    endfor

    % Calculam noii centroizi
    for i = 1 : NC
      if npoints(1,i)
        centroids(i,:) /= npoints(1,i);
      endif
    endfor

    % Verificam daca s-au modificat centroizii
    if old_centroids == centroids 
      return
    endif
    iter++;

  endwhile
endfunction
