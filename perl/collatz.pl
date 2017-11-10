#!/usr/bin/perl
#This program will perform the collatz conjecture

use POSIX;

print("Enter a number...\n");
my $x = <STDIN>;  #Gets user input
if($x <= 1)
{
      print("Invalid number\n");
      exit
}
$count = 0;
while($x > 1)
{
      if($x % 2 == 1)  #Odd number
      {
            $x = ($x * 3) + 1;
      }
      else  #Even number
      {
            $x = $x / 2;
      }
      $count++;
      print("X = $x   Sequence = $count\n");
}
