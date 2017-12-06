!This program will perform the Collatz conjecture
program main
      integer*16 :: maxnum
      integer*16, dimension(10) :: numlist
      integer*16, dimension(10) :: countlist
      integer*16 :: x, smallcount, counter
      integer*16 :: smallnum, indexnum, duplicate, temp
      maxnum = 10000
      !Zeroes out both arrays
      do i = 1,10
            numlist(i) = 0
            countlist(i) = 0
      end do

      do while(maxnum.ne.0)
            x = maxnum
            duplicate = 0
            smallnum = 1
            smallcount = countlist(1)
            indexnum = 1
            counter = 0
            do while(x.ne.1)
                  if((mod(x,2)) == 1) then  !Odd number
                        x = (x * 3) + 1
                  else  !Even number
                        x = x / 2
                  end if
                  counter = counter + 1
            end do
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
