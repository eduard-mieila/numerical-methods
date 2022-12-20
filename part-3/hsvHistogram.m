function [sol] = hsvHistogram(path_to_image, count_bins)
  img = imread(path_to_image);
  img = RGBtoHSV(double(img));
  sol = zeros(1, 3 * count_bins);
  
  intervals = zeros(1, count_bins+1, "double");
  for i = 2 : count_bins + 1
    intervals(i) = intervals(i-1) + 1.01 / count_bins;
  endfor
  
  for lin = 1 : rows(img)
    for col = 1 : columns(img)
      H = img(lin, col, 1);
      S = img(lin, col, 2);
      V = img(lin, col, 3);
      
      % Determinare bin H
      pos = 1;
      while H > intervals(pos)
        pos++;
      endwhile
      if pos == 1
        pos = 2;
      endif
      sol(pos - 1)++;
      
      % Determinare bin S
      pos = 1;
      while S > intervals(pos)
        pos++;
      endwhile
      if pos == 1
        pos = 2;
      endif
      sol(count_bins + pos - 1)++;
       
      % Determinare bin V
      pos = 1;
      while V > intervals(pos)
        pos++;
      endwhile
      if pos == 1
        pos = 2;
      endif
      sol(2 * count_bins + pos - 1)++;
      
    endfor
  endfor
end