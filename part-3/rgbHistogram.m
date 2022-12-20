function [sol] = rgbHistogram(path_to_image, count_bins)
  sol = zeros(1, 3*count_bins);
  img = imread(path_to_image);
  prehist = histc(img, 0:255);
  
  % Vom aduna toate valorile la stanga, astfel, vom avea un
  % vector coloana, pe fiecare rand aflandu-se numarul de pixeli
  % ce au componenta R/G/B n-1, unde n este numarul randului.
  hist = sum(prehist, 2);
  
  
  % Generam capetele intervalelor
  intervals = zeros(1, count_bins+1);
  intervals(1) = 0.9999;
  for i = 1 : count_bins
    intervals(i+1) = intervals(i) + (256 / count_bins);
  endfor
  % Pentru a fi siguri ca nu ratam nicio valoare, vom considera ca
  % ultimul interval se termina la 257.
  intervals(count_bins+1) = 257;
  
  
  % Vom aduna pixelii pe pozitiile corespunzatoare.
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