function [values, colind, rowptr] = matrix_to_csr(A)
  % Transformarea unei matrici in format CSR, conform elgoritmului din enunt.
  nz = 0;
  n = length(A);
  nz = sum(sum(A!=0));
  values = zeros(1, nz);
  colind = zeros(1, nz);
  rowptr = zeros(1, n + 1);  
  rowptr(1, n + 1) = nz + 1;
  
  pnt = 1;
  for i = 1 : length(A)
    for j = 1 : length(A)
      if A(i,j) != 0
        if rowptr(1,i) == 0
          rowptr(1,i) = pnt;
        endif
        values(1, pnt) = A(i,j);
        colind(1, pnt) = j;
        pnt++;
      endif
    endfor
  endfor
endfunction