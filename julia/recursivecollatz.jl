#Program will run Collatz conjecture
maxnum= 10000
numlist = [0,0,0,0,0,0,0,0,0,0]
countlist = [0,0,0,0,0,0,0,0,0,0]
while (maxnum != 0)
      x = maxnum
      duplicate = "False"
      smallnum = 1
      smallcount = countlist[1]
      index = 1
      counter = collatz(x)
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
println();
#Sort function that sorts based on num size
#numlist.sort()
#Sort function that sorts based on sequence size
#countlist.sort()
for j = 1:10
      println(numlist[j],"  ", countlist[j])
end
function collatz(x)
      if(x <= 1)
            return
      elseif (x % 2 == 1)  #When odd number
            collatz((x * 3) + 1)
      else  #When even number
            collatz(x / 2)
      end 
end
exit(0)
