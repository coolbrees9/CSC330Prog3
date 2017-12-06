!This program will perform the Collatz conjecture
program main
      integer*16 :: maxnum
      integer*16, dimension(10) :: numlist
      integer*16, dimension(10) :: countlist
      integer*16 :: x, smallcount, counter, collatz
      integer*16 :: smallnum, indexnum, duplicate, temp
      external collatz
      maxnum = 10000
      !Zeroes out the 2 arrays
      do i = 1, 10
            numlist(i) = 0
            countlist(i) = 0
      end do

      do while(maxnum.ne.0)
            x = maxnum
            duplicate = 0
            smallnum = 1
            smallcount = countlist(1)
            indexnum = 1
            counter = collatz(x) !Calls function collatz
            do i = 1, 10
                  !Updates if current sequence greater than previous
                  if(smallcount > countlist(i)) then
                        smallcount = countlist(i)
                        smallnum = i
                  end if
                  !Check for duplicates 
                  if(countlist(i) == counter) then
                        duplicate = 1
                        indexnum = i
                  end if
            end do
            temp = smallnum
            !No duplicates and adds to the sequence
            if(counter > countlist(temp).and.duplicate == 0) then
                  numlist(temp) = maxnum
                  countlist(temp) = counter
            end if
            !If duplicate then add smaller number
            if(maxnum < countlist(indexnum).and.duplicate == 1) then
                  numlist(indexnum) = maxnum
            end if
            maxnum = maxnum - 1
      end do
      do j = 1,10
            print *, numlist(j), "  ", countlist(j)
      end do
end program main

recursive integer(kind=16) function collatz(x) result(rcounter)
            integer*16 :: x
            if(x == 1) then
                  rcounter = 0
                  return
            else if((mod(x,2)) == 1) then  !Odd number
                  rcounter = collatz((x * 3) + 1) + 1
            else  !Even number
                  rcounter = collatz(x / 2) + 1
            end if
end function collatz
