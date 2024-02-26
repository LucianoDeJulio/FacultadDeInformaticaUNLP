{Actividad 1: Completar el programa Calculo de Potencia para que lea dos valores
x y n, invoque la funcion Potencia para calcular X^n y muestre el resultado.}


program CalculoDePotencia;

Function potencia (x,n: integer): real;
begin
  if (n = 0) then 
    potencia:= 1
  else
    potencia := x * potencia(x,n-1);
end;

{PROGRAMA PRINCIPAL}
var
    x,n:integer;
begin
     writeln('ingrese el valor de x');
     readln(x);
     writeln('ingrese el valor de n');
     readln(n);
     writeln('el resultado es: ',potencia(x,n):2:1);

     readln;
     readln;
end.
