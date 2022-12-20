function [newimg] = RGBtoHSV(img)
  % Functia RGBtoHSV transforma o matrice RGB a unei imagini
  % intr-o matrice HSV, cofrom algortimului din enuntul temei.
  for i = 1 : rows(img)
    for j = 1 : columns(img)
  
      R = double(img(i,j,1) / 255);
      G = img(i,j,2) / 255;
      B = img(i,j,3) / 255;
      
      C_max = max([R, G, B]);
      C_min = min([R, G, B]);
      delta = C_max - C_min;
      
      if delta == 0
        newimg(i,j,1) = 0;
      else
        if C_max == R
          newimg(i,j,1) = 60 * mod(((G-B)/delta), 6);
        endif
        if C_max == G
          newimg(i,j,1) = 60 * ((B-R)/delta + 2);
        endif
        if C_max == B
          newimg(i,j,1) = 60 * ((R-G)/delta + 4);
        endif
      endif
      
      newimg(i,j,1) = newimg(i,j,1) / 360;
      if C_max == 0
        newimg(i,j,2) = 0;
      else
        newimg(i,j,2) = delta / C_max;
      endif
      
      newimg(i,j,3) = C_max;
    endfor
  endfor
endfunction
