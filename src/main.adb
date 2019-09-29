-----------Main file-----------------------------------
-----------KPI, Fict, Parallel Programming course-------
-----------IV-72 academic group-------------------------
-----------Oleksandr Korienev---------------------------

with Data, Text_IO, Ada.Integer_Text_IO;
use  Text_IO, Ada.Integer_Text_IO;



procedure main is
   n: Integer  := 3 ;
   LOGLEVEL: String := "INFO";
   package data1 is new data (n);
   use data1;
   MA, MB, MD, MZ, MT, MP, f2: Matrix;
   B, C, R, S, f1, f3: Vector;
   ----task T1-----
   task T1 is
      pragma Priority(1);
      pragma Storage_Size(100000);
      pragma CPU(1);
   end T1;
   task body T1 is
   begin
      Put_Line("Task T1 started ");
      delay Duration(2.0);
      ---initilizing data----
      Matrix_Filling_Ones(MA);
      Matrix_Filling_Ones(MD);
      Vector_Filling_Ones(B);
      Vector_Filling_Ones(C);
      if LOGLEVEL = "DEBUG" then
         Put_Line("MA = ");
         Matrix_Output(MA);
         Put_Line("MD = ");
         Matrix_Output(MD);
         Put("B = ");
         Vector_Output(B);
         Put_Line("");
         Put("C = ");
         Vector_Output(C);
         Put_Line("");
      end if;
      ---calculations---
      f1 := Func1(B => B, C => C, MA => MA, MD => MD);
      Put("Func 1 result: ");
      Vector_Output(f1);
      Put_Line("");
      Put_Line("Task T1 finished ");
   end T1;
   ----task T2-------
   task T2 is
      pragma Priority(1);
      pragma Storage_Size(100000);
      pragma CPU(2);
   end T2;
   task body T2 is
   begin
      Put_Line("Task T2 started");
      delay Duration(1.0);
      Matrix_Filling_Ones(MA);
      Matrix_Filling_Ones(MZ);
      Matrix_Filling_Ones(MB);
      if LOGLEVEL = "DEBUG" then
         Put_Line("MA = ");
         Matrix_Output(MA);
         Put_Line("MZ = ");
         Matrix_Output(MZ);
         Put_Line("MB = ");
         Matrix_Output(MB);
      end if;
      Put_Line("Func 2 result");
      f2 := Func2(MA => MA, MZ => MZ, MB => MB);
      Matrix_Output(f2);
      Put_Line("Task T2 finished");
   end T2;
   ---task t3---
   task T3 is
      pragma Priority(1);
      pragma Storage_Size(100000);
      pragma CPU(3);
   end;
   task body T3 is
   begin
      Put_Line("Task T3 started");
      delay Duration(1.5);
      Matrix_Filling_Ones(MT);
      Matrix_Filling_Ones(MP);
      Vector_Filling_Ones(R);
      Vector_Filling_Ones(S);
      if LOGLEVEL = "DEBUG" then
         Put_Line("MT = ");
         Matrix_Output(MT);
         Put_Line("MP = ");
         Matrix_Output(MP);
         Put("R = ");
         Vector_Output(R);
         Put("S = ");
         Vector_Output(S);
      end if;
      Put("Func 3 result");
      f3 := Func3(MT => MT, MP => MP, R => R, S => S);
      Vector_Output(f3);
      Put_Line("Task T3 finished");
   end T3;

begin
   Put_Line("Main started");
   Put_Line("Main finished");
end main;
