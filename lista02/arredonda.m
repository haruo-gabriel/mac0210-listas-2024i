% Função que combina enc e dec da TP1
function x_post = arredonda(x,N)
  e = floor(log10(abs(x)))+1-N;
  m = round(x*10^(-e));
  x_post = m*10^e;
endfunction