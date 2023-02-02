function [A, b] = generate_probabilities_system(rows)
  maze = zeros(rows);
  count = 1;
  for i = 1 : rows
    for j = 1 : i
      maze(i,j) = count;
      count++;  
    endfor
  endfor
  
  eq = (rows*(rows+1))/2;
  A = zeros(eq);
  b = zeros(eq,1);
  
  for i = 1 : rows
    b(maze(rows,i), 1) = 1;
  endfor
  
  for i = 1 : rows
    for j = 1 : rows
      
      ways = 0;
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