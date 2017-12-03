#!/usr/bin/perl
#This program will perform the collatz conjecture

use POSIX;

$max = 10000;
$numlist = [0,0,0,0,0,0,0,0,0,0];
$countlist = [0,0,0,0,0,0,0,0,0,0];
while($max != 0)
{
      $x = $max;
      $duplicate = "false";
      $smallnum = 0;
      $smallcount = $countlist[0];
      $index = 0;
      $count = 0;
      #Loop to do collatz
      while($x != 1)
      {
            if($x % 2 == 1)
            {
                  $x = ($x * 3) + 1;
            }
            else
            {
                  $x = $x / 2;
            }
            $count++;
      }
      for($i = 0; $i < 10; $i++)
      {
            #Updates if current sequence greater than previous sequence
            if($smallcount > $countlist[$i])
            {
                  $smallcount = $countlist[$i];
                  $smallnum = $i;
            }
            #Check for duplicate sequence
            if($countlist[$i] == $count)
            {
                  $duplicate = "true";
                  $index = $i;
            }
      }
      $temp = $smallnum;
      #No duplicates and adds in sequence if sequence greater than current 
      if($count > $countlist[$temp] and $duplicate == "false")
      {
            $numlist[$temp] = $max;
            $countlist[$temp] = $count;
      }
      #If duplicates adds the smaller number
      if($max < $countlist[$index] and $duplicate == "true")
      {
                  $numlist[$index] = $max;
      }
      $max--;
}
#print("Sequence sorted by sequence length\n");
#Sort function to sort based on sequence length 
#sort(csequence,csequence + 10,[] (list x, list y){return x.count > y.count;});
for($j = 0; $j < 10; $j++)
{
      print("$numlist[$j]  $countlist[$j]\n");
}
print("\n");
#print("Sequence sorted by integer size\n");
#Sort function that sorts based on num size
#sort(csequence, csequence + 10, [](list x, list y){return x.num > y.num;});
for($j = 0; $j < 10; $j++)
{
      print("$numlist[$j]  $countlist[$j]\n");
}
