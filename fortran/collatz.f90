!This program will perform the Collatz conjecture
program main
      integer*8 :: maxnum
      maxnum = 1000000000
      call collatz(maxnum)  !Calls subroutine collatz
end program main

subroutine collatz(maxnum)
      integer*8 :: maxnum
      integer*8 :: largest
      integer*8 :: i
      integer*8 :: x
      integer :: largecount, counter
      do i = 2, maxnum
            counter = 1
            x = i
            do while(x.ne.1)
                  if((mod(x,2)) == 1) then  !Odd number
                        x = (x * 3) + 1
                  else  !Even number
                        x = x / 2
                  end if
                  counter = counter + 1
            end do
            if(counter > largecount) then
                  largecount = counter
                  largest = i
                  print *, largest, "   ", largecount
            end if
      end do
end subroutine collatz
