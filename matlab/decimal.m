% it converts a 2's complementary datum to a decimal number
% a = decimal(d, N)
% d: digital number
% a: decimal number


function a = decimal(d)

 N = size(d, 2);
 scalar = 2^(N-1)-1;

 if(d(1)=='0')
  a = bin2dec(d)/scalar;
 else
  st1 = d(2:N);
  for k=1:1:N-1
    if(st1(k)=='1')
     st1(k) = '0';
    else
     st1(k) = '1';
    end
  end

  b = bin2dec(st1) +1;
  if (b==2^(N-1))
    a= 0;
  else
    a = -b/scalar;
  end

 end
