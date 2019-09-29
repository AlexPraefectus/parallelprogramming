-----------Package Data, declarations-------------------
-----------KPI, Fict, Parallel Programming course-------
-----------IV-72 academic group-------------------------
-----------Oleksandr Korienev---------------------------
generic
   n: Integer;
package data is
---Declaration of private types
   type Vector is private;
   type Matrix is private;
--Read Vector
   procedure Vector_Input(A: out Vector);
--Write vector on screen
   procedure Vector_Output(A: in Vector);

--Read matrix
   procedure Matrix_Input(A: out Matrix);

--Write matrix on screen
   procedure Matrix_Output (A: in Matrix);

--Calculation function 1
   function Func1 (MA, MD : in out Matrix; C, B: in out Vector) return Vector;

--Calculation function 2
    function Func2 (MA, MB, MZ: in out Matrix) return Matrix;

--Calculation function 3
   function Func3 (R, S: in Vector; MT, MP : in Matrix) return Vector;

--Filling matrix with ones
    procedure Matrix_Filling_Ones(A: out Matrix);
--Filling vector with ones
   procedure Vector_Filling_Ones (A: out vector);

   procedure Matrix_Filling_Number(A: out Matrix; i,j,number:Integer);
   procedure Vector_Filling_Number(A: out Vector; i,number:integer);

--Private types definition
   private
      type Vector is array (1..n) of Integer;
      type Matrix is array (1..n) of Vector;
 end Data;
