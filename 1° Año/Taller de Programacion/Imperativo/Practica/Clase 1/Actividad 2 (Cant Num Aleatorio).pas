{Actividad: Se propone simular un juego que consiste en contar la cantidad de veces que coinciden el valor
aleatorio (generado por la operacion random) y un valor ingresado por teclado. El Juego finaliza cuando se
ingresa por teclado el valor 5}


Program Aleatorio;
Var
  Contador,ale,n:integer;
Begin
   Writeln('ingrese un numero');
   Contador:=0;
   Readln(n);
   While(n<>5) do begin
     Randomize;
     ale:= random(11);
     if(n=ale)then
        Contador:= Contador+1;
     Readln(n);
   End;
  Writeln('La cantidad de ocurrencias fueron: ', Contador);
  readln();
End.
