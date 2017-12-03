//Program that calculates the Collatz conjecture
import java.util.*;
import java.io.*;
import java.math.BigInteger;
public class collatz
{
      public class list
      {
            long num;
            long count;
      }
      public static void main(String[] args)
      {
            long max = 10000;
            collatz(max);  //Calls collatz method to do actual calculations
      }
      static void collatz(long max)
      {
            long[] numlist = new long[10];
            long[] countlist = new long[10];
            while(max != 0)
            {
                  long x = max;
                  boolean duplicate = false;
                  int smallnum = 0;
                  long smallcount = countlist[0];
                  int index = 0;
                  long count = 0;
                  //Loop to do collatz
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
                  }
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
            //System.out.println("Sequence sorted by sequence length");
            //Sort function to sort based on sequence length 
            //sort(csequence,csequence + 10,[] (list x, list y){return x.count > y.count;});
            for(int j = 0; j < 10; j++)
                  System.out.println(numlist[j] + "  " + countlist[j]);
            System.out.println();
            //System.out.println("Sequence sorted by integer size");
            //Sort function that sorts based on num size
            //sort(csequence, csequence + 10, [](list x, list y){return x.num > y.num;});
            for(int j = 0; j < 10; j++)
                  System.out.println(numlist[j] + "  " + countlist[j]);
      }
}
