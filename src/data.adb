-----------Package Data, body---------------------------
-----------KPI, Fict, Parallel Programming course-------
-----------IV-72 academic group-------------------------
-----------Oleksandr Korienev---------------------------
with Text_IO, Ada.Integer_Text_IO;
use Text_IO, Ada.Integer_Text_IO;
package body  Data is

   --Read Vector
   procedure Vector_Input(A: out Vector) is
   begin
      for i in 1..n loop
         Get(A(i));
      end loop;
   end Vector_Input;

   --Write vector on screen
   procedure Vector_Output(A: in Vector) is
   begin
      for i in 1..n loop
         Put(A(i));
         Put(" ");
         end loop;
   end Vector_Output;

   --Read matrix
   procedure Matrix_Input(A: out Matrix) is
   begin
      for i in 1..n loop
         for j in 1..n loop
            Get(A(i)(j));
         end loop;
      end loop;
   end Matrix_Input;

   --Write matrix on screen
   procedure Matrix_Output (A: in Matrix) is
   begin
      for i in 1..n loop
         for j in 1..n loop
            Put(A(i)(j));
            Put(" ");
         end loop;
         Put_Line(" ");
      end loop;
   end Matrix_Output;

   --Multiplication of matrices
   function Matrix_Multiplication(A, B: in Matrix) return Matrix is
      P: Matrix;
      S: Integer;
   begin
      for k in 1..n loop
         for i in 1..n loop
            s := 0;
            for j in 1..n loop
            S := S + A(k)(j)*B(j)(i);
               P(k)(i) := s;
            end loop;
         end loop;
      end loop;
      return P;
   end Matrix_Multiplication;

   --Multiplication of vector and matrix
   function Vector_Matrix_Multiplication(A: in Vector; B: in Matrix) return Vector is
      P: Vector;
      s: Integer;
   begin
      for i in 1..n loop
         s := 0;
         for j in 1..n loop
            S := s + A(i)*B(j)(i);
         end loop;
         P(i) := S;
      end loop;
      return P;
   end Vector_Matrix_Multiplication;

   --Sum of vectors
   function Vector_Sum(A, B: in Vector) return Vector is
      S: Vector;
   begin
      for i in 1..n loop
         S(i) := A(i)+B(i);
      end loop;
      return S;
   end Vector_Sum;

   --Sorting of vector
   procedure Vector_Sorting(A: in out Vector)  is
      S: Integer;
   begin
      for i in 1..n loop
         for j in i..n loop
            if A(i)>A(j) then
               S:=A(j);
               A(j):=A(i);
               A(i):=S;
            end if;
         end loop;
      end loop;
   end Vector_Sorting;

   --Transposition of Matrix
   procedure Matrix_Transposition(A: in out Matrix)  is
      S: Integer;
   begin
      for i in 1..n loop
         for j in i..n loop
           S:=A(j)(i);
           A(j)(i):=A(i)(j);
           A(i)(j):=S;
         end loop;
      end loop;
   end Matrix_Transposition;

   --Filling matrix with ones
   procedure Matrix_Filling_Ones(A: out Matrix) is
   begin
      for i in 1..n loop
         for j in 1..n loop
            A(i)(j) := 1;
         end loop;
      end loop;
   end Matrix_Filling_Ones;

   --Filling vector with ones
   procedure Vector_Filling_Ones (A: out vector) is
   begin
      for i in 1..n loop
         A(i) := 1;
      end loop;
   end Vector_Filling_Ones;
   procedure Matrix_Filling_Number(A: out Matrix; i,j,number:Integer) is
   begin
      A(i)(j) := number;
   end Matrix_Filling_Number;
   procedure Vector_Filling_Number(A: out Vector; i,number:integer) is
   begin
      A(i) := number;
   end Vector_Filling_Number;

   -- Vector on Scalar Multiplication
   function Vector_Multiplication_Scalar (scalar: in Integer; v: in Vector) return Vector is
         res: Vector;
      begin
      for i in 1..n loop
         res(i) := scalar * v(i);
      end loop;
      return res;
      end Vector_Multiplication_Scalar;

-- Matrix on Scalar Multiplication
   function Matrix_Multiplication_Scalar (scalar: in Integer; m: in Matrix) return Matrix is
      res: Matrix;
   begin
      for i in 1..n loop
         res(i) := Vector_Multiplication_Scalar(scalar, m(i));
      end loop;
      return res;
   end Matrix_Multiplication_Scalar;

   -- Sum of matrices
   function Matrix_Sum(m1, m2: in Matrix) return Matrix is
      res: Matrix;
      begin
         for i in 1..n loop
            res(i) := Vector_Sum(m1(i), m2(i));
         end loop;
      return res;
      end;

--Calculation function 1 (A = B*MIN(C) *(MA*MD+MD))
   function Func1 (MA, MD : in out Matrix; C, B: in out Vector) return Vector is
      MTemp: Matrix;
      VTemp: Vector;

   begin
      Vector_Sorting(C);
      VTemp := Vector_Multiplication_Scalar(C(1), B);
      MTemp := Matrix_Multiplication(MA, MD);
      MTemp := Matrix_Sum(MTemp, MD);
      VTemp := Vector_Matrix_Multiplication(VTemp, MTemp);
      return VTemp;
   end Func1;

   --Calculation function 2 (MK = MA * (MA * MZ) + TRANS(MB))
   function Func2 (MA, MB, MZ: in out Matrix) return Matrix is
      MTemp: Matrix;
   begin
      Matrix_Transposition(MB);
      MTemp := Matrix_Multiplication(MA, MZ);
      MTemp := Matrix_Multiplication(MA, MTemp);
      MTemp := Matrix_Sum(MTemp, MB);
      return MTemp;
   end Func2;

   --Calculation function 3
   function Func3 (R, S: in Vector; MT, MP : in Matrix) return Vector is
      VTemp: Vector;
      MTemp: Matrix;
   begin
      VTemp := Vector_Sum(R, S);
      Vector_Sorting(VTemp);
      MTemp := Matrix_Multiplication(MT, MP);
      VTemp := Vector_Matrix_Multiplication(VTemp, MTemp);
      return VTemp;
   end Func3;
end Data;
