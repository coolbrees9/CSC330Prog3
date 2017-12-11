//Program that calculates the Collatz conjecture
import java.util.*;
import java.io.*;
import java.math.BigInteger;
public class recursivecollatz
{
      public class list
      {
            long num;
            long count;
      }
      public static void main(String[] args)
      {
            long max = 10000;
            long[] numlist = new long[10];
            long[] countlist = new long[10];
            while(max != 0)
            {
                  long x = max;
                  boolean duplicate = false;
                  int smallnum = 0;
                  long smallcount = countlist[0];
                  int index = 0;
                  long count = collatz(x);  //Calls collatz method to do actual calculations
                  for(int i = 0; i < 10; i++)
                  {
                        //Updates if current sequence greater than previous sequence
                        if(smallcount > countlist[i])
                        {
                              smallcount = countlist[i];
                              smallnum = i;
                        }
                        //Check for duplicate sequence
                        if(countlist[i] == count)
                        {
                              duplicate = true;
                              index = i;
                        }
                  }
                  int temp = smallnum;
                  //No duplicates and adds in sequence if sequence greater than current 
                  if(count > countlist[temp] && duplicate == false)
                  {
                        numlist[temp] = max;
                        countlist[temp] = count;
                  }
                  //If duplicates adds the smaller number
                  if(max < countlist[index] && duplicate == true)
                        numlist[index] = max;
                  max--;
            }
            bubbleSort(numlist, countlist);
            System.out.println("Sequence sorted by integer size");
            for(int j = 0; j < 10; j++)
                  System.out.println(numlist[j] + "  " + countlist[j]);
      }
      static long collatz(long x)
      {
            //Loop to do collatz
            while(x != 1)
            {
                  if(x % 2 == 1)
                  {
                        return 1 + collatz((x * 3) + 1);
                  }
                  else
                  {
                        return 1 + collatz(x / 2);
                  }
            }
            return x - 1;
      }
      static void bubbleSort(long numlist[], long countlist[])  //Method that does bubblesort
      {
            for (int x = 0; x < 10; x++) 
                  for (int y = 0; y < 9 - x; y++) 
                        if(numlist[y] < numlist[y + 1]) 
                        {
                              long swapNum = numlist[y];
                              numlist[y] = numlist[y + 1];
                              numlist[y + 1] = swapNum;
                              long swapCount = countlist[y];
                              countlist[y] = countlist[y + 1];
                              countlist[y + 1] = swapCount;
                        }
     }  
}
