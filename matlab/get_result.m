% it reads binary data from a text file and converts data to decimal numbers
% it assumes that input data are in the format of two's complementary
% a = get_result(f, N)
% f: file name
% N: number of bits for result data

function a = get_result( f, N )

 fid = fopen(f);
 [b, count] = fscanf(fid, '%s', [1, inf]);
 fclose(fid);
 
 for k=1:1:count
  st1 = b(((k-1)*N+1):(k*N));
  a(k) = decimal(st1);
 end
