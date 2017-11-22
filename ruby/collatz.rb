#!/usr/bin/ruby
#This program will run Collatz conjecture
class Collatz
            max = 5000000000
            largest = 1
            largecount = 1
            for i in 2..max
                  count = 1
                  x = i
                  while (x != 1) do
                        if x % 2 == 1  #Odd number
                              x = (x * 3) + 1
                        else  #Even number
                              x = x / 2
                        end
                        count = count + 1
                  end
                  if count > largecount
                        largecount = count
                        largest = i
                        print  largest, "   ",  largecount, "\n"
                  end
            end
end
