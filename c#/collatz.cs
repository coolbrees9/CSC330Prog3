//This program will perform the collatz conjecture

using System;

public class CollatzConjecture
{
      static public void Main()
      {
            Console.WriteLine("Enter a number...");
            long x = Convert.ToInt64(Console.ReadLine());  //Converts user input to int
            collatz(x);  //Calls collatz method
      }
      static int collatz(long x)
      {
            int count = 0;
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
                  Console.WriteLine("X: " + x + "    Sequence: " + count);
            }
            return count;
      }
}
