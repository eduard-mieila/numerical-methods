function [sol] = rgbHistogram(path_to_image, count_bins)
  sol = zeros(1, 3*count_bins);
  img = imread(path_to_image);
  prehist = histc(img, 0:255);
  hist = sum(prehist, 2);
  intervals = zeros(1, count_bins+1);
  intervals(1) = 1;
  for i = 1 : count_bins
    intervals(i+1) = intervals(i) + (256 / count_bins);
  endfor
  
  for colr = 1 : 3
    start_pos = (colr-1)*count_bins;
    for int_c = 1 : count_bins  
      for i = 1 : 256
        if intervals(int_c) <= i && i < intervals(int_c + 1)
          sol(start_pos + int_c) += hist(i,1,colr);
        endif
      endfor
    endfor   
  endfor
  

end