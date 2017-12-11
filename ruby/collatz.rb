#!/usr/bin/ruby
#This program will run Collatz conjecture
class Collatz
      def bubbleSort(numlist, countlist)  #Method that does bubblesort
            for x in 0..9
                  for y in 0..(8-x)
                        if(numlist[y] < numlist[y + 1]) 
                              swapNum = numlist[y];
                              numlist[y] = numlist[y + 1];
                              numlist[y + 1] = swapNum;
                              swapCount = countlist[y];
                              countlist[y] = countlist[y + 1];
                              countlist[y + 1] = swapCount;
                        end
                  end
            end
      end
      maxnum= 10000
      numlist = [0,0,0,0,0,0,0,0,0,0]
      countlist = [0,0,0,0,0,0,0,0,0,0]
      while(maxnum != 0) do
            x = maxnum
            duplicate = false
            smallnum = 0
            smallcount = countlist[0]
            index = 0
            count = 0
            #Loop to do collatz
            while (x != 1) do
                  if (x % 2 == 1)  #When odd number
                        x= (x * 3) + 1
                  else  #When even number
                        x= x / 2
                  end 
                  count+= 1
            end
            for i in 0..9
                  #Updates if current sequence greater than previous sequence
                  if(smallcount > countlist[i])
                        smallcount = countlist[i]
                        smallnum = i
                  end
                  #Check for duplicate sequence
                  if(countlist[i] == count)
                        duplicate = true
                        index = i
                  end
            end
            temp = smallnum
            #No duplicates and adds in sequence if sequence greater than current
            if(count > countlist[temp] and duplicate == false)
                  numlist[temp] = maxnum
                  countlist[temp] = count
            end
            #If duplicates adds the smaller number
            if(maxnum < countlist[index] and duplicate == true)
                  numlist[index] = maxnum
            end
            maxnum-=1
      end
      Collatz.new.bubbleSort(numlist, countlist)
      print "Sequence sorted by integer size\n"
      for j in 0..9
            print numlist[j],"  ", countlist[j],"\n"
      end
end
