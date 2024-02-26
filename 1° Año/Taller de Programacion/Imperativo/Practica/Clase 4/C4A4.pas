program CalculoDePotenciaRecursiva;

Function potencia (x,n: integer): real;   {NO TIENE CONDICION DE CORTE} {El programa se rompe porque la pila se queda sin memoria. para los parametros}
begin
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
     writeln('el resultado es: ',potencia(x,n):4:1);

     readln;
     readln;
end.
