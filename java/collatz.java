//Program that calculates the Collatz conjecture
import java.util.*;
import java.io.*;
public class collatz
{
      public static void main(String[] args)
      {
            long x;
            Scanner input = new Scanner(System.in);
            System.out.println("Enter a number...");
            x = input.nextInt();  //Sets x equal to user input
            collatz(x);  //Calls collatz method to do actual calculations
      }
      static int collatz(long x)
      {
            int count = 0;
            while(x != 1)
            {
                  if(x % 2 == 1)
                  {
                        x = (x * 3) + 1;
                  }
                  else
                  {
                        x = x / 2;
                  }
                  count++;
                  System.out.println("Number: " + x + " Sequence: " + count);
            }
            return count;
      }
}
