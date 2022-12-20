function [A, b] = generate_probabilities_system(rows)
  % Vom genera o matrice ce va reprezenta labirintul
  % Fiecare pozitie non-zero va avea numarul intersectiei din labirint
  % Toate elementee vor fi aliniate la stanga
  maze = zeros(rows);
  count = 1;
  for i = 1 : rows
    for j = 1 : i
      maze(i,j) = count;
      count++;  
    endfor
  endfor
  
  % Numarul de ecuatii si necunoscute este eq = n(n+1)/2
  % Vom initializa Matricea A de eq linii si eq coloane
  % si vectorul coloana b cu eq elemente, toate 0. 
  eq = (rows*(rows+1))/2;
  A = zeros(eq);
  b = zeros(eq,1);
  
  % Toate ecuatiile vor fi aduse la acelasi numitor, astfel ca,
  % de fiecare data, numarul din b de pe ultimele rows linii va fi 1.
  for i = 1 : rows
    b(maze(rows,i), 1) = 1;
  endfor
  
  for i = 1 : rows
    for j = 1 : rows

      ways = 0;
      % Pentru fiecare element vom verifica daca are vecini in una din pozitiile:
      % sus, jos, stanga, dreapta, sus-stanga sau jos-dreapta.(O intersectie poate
      % avea cel mult 6 drumuri)
      % Pe pozitiile vecinilor vom pune coeficientul -1, obtinut de fiecare data
      % dupa aducerea la acelasi numitor.
      if maze(i,j) != 0
        if ((i != 1 & j != 1) && (maze(i-1, j-1) != 0))
          A(maze(i,j), maze(i-1, j-1)) = -1;
          ways++;
        endif
        if ((j != 1) && (maze(i,j-1) != 0))
          A(maze(i,j), maze(i, j-1)) = -1;
          ways++;
        endif
        if (i != 1 && maze(i-1, j) != 0)
          A(maze(i,j), maze(i-1, j)) = -1;
          ways++;
        endif
        
        if (i != rows && j!= rows & maze(i+1,j+1) != 0)
          A(maze(i,j), maze(i+1, j+1)) = -1;
          ways++;
        endif
        if (j != rows && maze(i,j+1) != 0)
          A(maze(i,j), maze(i, j+1)) = -1;
          ways++;
        endif
        if (i != rows && maze(i+1,j) != 0)
          A(maze(i,j), maze(i+1, j)) = -1;
          ways++;
        endif
       
        % La final vom verifica nunmarul de vecini al unei intersectii din matricea maze.
        % Daca avem 2 vecini, inseamna ca este in coltul labirintului si are, de fapt, 4 drumuri.
        % Daca avem 4 vecini, inseamna ca este la marginea labirintului si are, de fapt, 5 drumuri.
        % Daca avem 6 vecini, inseamna ca este in interiorul lab si are exact 6 drumuri.
        % Deci, in final, pe pozitia intersectiei, vom pune numarul de drumuri
        % care pleaca din aceasta. 
        if ways == 2
          A(maze(i,j), maze(i,j)) = 4;
        endif
        if ways == 4
          A(maze(i,j), maze(i,j)) = 5;
        endif
        if ways == 6
          A(maze(i,j), maze(i,j)) = 6;
        endif
      endif
    endfor
  endfor
endfunction