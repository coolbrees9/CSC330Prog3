--This program will perform the collatz conjecture
with Ada.Text_IO,Ada.IO_Exceptions,Ada.Integer_Text_IO,Ada.Float_Text_IO;
use Ada.Text_IO,Ada.IO_Exceptions,Ada.Integer_Text_IO,Ada.Float_Text_IO;

procedure collatz is
maxnum : long_Integer := 10000;
numlist : array (1..10) of long_Integer; 
countlist : array (1..10) of long_Integer;
x, smallcount, counter : long_Integer;
smallnum, indexnum, duplicate, temp : Integer;
begin
      for i in 1..10 loop
            numlist(i) := 0;
            countlist(i) := 0;
      end loop;
      while(maxnum /= 0) loop
            x := maxnum;
            duplicate := 0;
            smallnum := 1;
            smallcount := countlist(1);
            indexnum := 1;
            counter := 0;
            --Loop that does collatz
            while(x /= 1) loop
                  if(x mod 2 = 1) then  --Odd number
                        x := (x * 3) + 1;
                  else  --Even number
                        x := x / 2;
                  end if;
                  counter := counter + 1;
            end loop;
            for i in 1..10 loop
                  --Updates if current sequence greater than previous
                  if(smallcount > countlist(i)) then
                        smallcount := countlist(i);
                        smallnum := i;
                  end if;
                  --Check for duplicates 
                  if(countlist(i) = counter) then
                        duplicate := 1;
                        indexnum := i;
                  end if;
            end loop;
            temp := smallnum;
            --No duplicates and adds to the sequence
            if(counter > countlist(temp) and duplicate = 0) then
                  numlist(temp) := maxnum;
                  countlist(temp) := counter;
            end if;
            --If duplicate then add smaller number
            if(maxnum < countlist(indexnum) and duplicate = 1) then
                  numlist(indexnum) := maxnum;
            end if;
            maxnum := maxnum - 1;
      end loop;
      for j in 1..10 loop
            Put(Item=> Long_Integer'Image(numlist(j)));
            Put("  ");
            Put_Line(Item=> Long_Integer'Image(countlist(j)));
      end loop;
      Put_Line("");
      for j in 1..10 loop
            Put(Item=> Long_Integer'Image(numlist(j)));
            Put("  ");
            Put_Line(Item=> Long_Integer'Image(countlist(j)));
      end loop;
end collatz;
