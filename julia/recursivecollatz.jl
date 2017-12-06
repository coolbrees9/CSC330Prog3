#Program will run Collatz conjecture

#Does recursive collatz
function collatz(x)
      if(x == 1)
            return 0
      elseif (x % 2 == 1)  #When odd number
            return 1 + collatz((x * 3) + 1)
      else  #When even number
            return 1 + collatz(x / 2)
      end 
end
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
for j = 1:10
      println(numlist[j],"  ", countlist[j])
end
exit(0)
