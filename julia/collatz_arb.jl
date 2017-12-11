#Program will run Collatz conjecture
function bubbleSort(numlist, countlist)  #Method that does bubblesort
      for x = 1:10
            for y = 1:10-x
                  if(numlist[y] < numlist[y + 1])
                        swapNum = numlist[y]
                        numlist[y] = numlist[y + 1]
                        numlist[y + 1] = swapNum
                        swapCount = countlist[y]
                        countlist[y] = countlist[y + 1]
                        countlist[y + 1] = swapCount
                  end
            end
      end
end
maxnum= 1000000000000000
numlist = [0,0,0,0,0,0,0,0,0,0]
countlist = [0,0,0,0,0,0,0,0,0,0]
while (maxnum != 0)
      x = maxnum
      duplicate = "False"
      smallnum = 1
      smallcount = countlist[1]
      index = 1
      counter = 0
      #Loop to do collatz
      while (x != 1)
            if (x % 2 == 1)  #When odd number
                  x= (x * 3) + 1
            else  #When even number
                  x= x / 2
            end 
            counter+= 1
     end
     for i = 1:10
            #Updates if current sequence greater than previous sequence
            if(smallcount > countlist[i])
                  smallcount = countlist[i]
                  smallnum = i
            end
            #Check for duplicate sequence
            if(countlist[i] == counter)
                  duplicate = "True"
                  index = i
            end
      end
      temp = smallnum
      #No duplicates and adds in sequence if sequence greater than current
      if(counter > countlist[temp] && duplicate == "False")
            numlist[temp] = maxnum
            countlist[temp] = counter
      end
      #If duplicates adds the smaller number
      if(maxnum < countlist[index] && duplicate == "True")
            numlist[index] = maxnum
      end
      maxnum-=1
end
#Method to do bubblesort
bubbleSort(countlist, numlist)
println("Sequence sorted by sequence length")
for j = 1:10
      println(numlist[j],"  ", countlist[j])
end
println("")
#Method to do bubblesort
bubbleSort(numlist, countlist)
println("Sequence sorted by integer size")
for j = 1:10
      println(numlist[j],"  ", countlist[j])
end
exit(0)
