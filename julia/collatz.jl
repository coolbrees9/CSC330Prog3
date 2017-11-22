#Program will run Collatz conjecture
maxnum = 1000000000
i = Int32(2)
counter = 0
largest = 1
largecount = 1
for i = 2:maxnum
  counter = 1
  x = i
  while ( x != 1 )
      if  ((x % 2) == 1)  #Odd number
      x = x * 3 + 1;
      else  #Even number
      x = x / 2;
      end
      counter = counter + 1
  end
  if ( counter > largecount )
      largecount = counter
      largest = i
      println( largest, "  ",  largecount )
  end
end
exit(0)
