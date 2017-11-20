//This program will perform the collatz conjecture

using System;

public class CollatzConjecture
{
      static public void Main()
      {
            long max = 5000000000;
            collatz(max);  //Calls collatz method
      }
      static void collatz(long max)
      {
            long largest = 1;
            int largecount = 1;
            for(long i = 2; i < max; i++)
            {
                  int count = 0;
                  long x = i;
                  while(x != 1)
                  {
                        if(x % 2 == 1)  //If number is odd
                        {
                              x = (x * 3) + 1;
                        }
                        else  //When number is even
                        {
                              x = x / 2;
                        }
                        count++;
                  }
                  if(count > largecount)
                  {
                        largecount = count;
                        largest = i;
                        Console.WriteLine(largest + "   " + largecount);
                  }
            }
      }
}
