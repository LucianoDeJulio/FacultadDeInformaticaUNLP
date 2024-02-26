program CalculoDePotenciaRecursiva;

Function potencia (x,n: integer): real;
begin
  if (n = 0) then 
    potencia:= 1
  else
    potencia := x * potencia(x,n);  {N nunca resta el exponente por ende nunca termina}
end;

{PROGRAMA PRINCIPAL}
var
    x,n:integer;
begin
     writeln('ingrese el valor de x');
     readln(x);
     writeln('ingrese el valor de n');
     readln(n);
     writeln('el resultado es: ',potencia(x,n):4:1);

     readln;
     readln;
end.
