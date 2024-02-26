{Actividad 10: Utilizando ProgramasVectores realice las siguientes actividades:

a- Implementar un modulo recursivo Maximo que devuelva el maximo valor del vector.

b- Implementar un modulo recursivo Suma que devuelva la suma de los valores
contenidos en el vector.

c- Utilizar los modulos implementados para mostrar el maximo y la suma.}



program Ejercicio10;

const
    dimF = 8;

type

    vector = array [1..dimF] of Integer;





Procedure CargarVector ( var vec: vector; var dimL: integer);
var
   d: integer;
begin
     Randomize;

     dimL := 0;
     d:= random(100);
     while (d <> 99)  and ( dimL < dimF ) do begin
           dimL := dimL + 1;
           vec[dimL] := d;
           d:= random(100);
     end;
End;





Procedure ImprimirVector ( var vec: vector;  dimL: integer);
var
   i: integer;
begin
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        if(vec[i] < 9)then
            write ('0');
        write(vec[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     writeln;
End;

procedure maximo(v:vector;var max:integer;diml:integer; i:integer);
begin

       if(i<=diml)then begin
              if(v[i]>max)then
                max:=v[i];
              i:=i+1;
              maximo(v,max,diml,i);

    end;

end;

procedure sumar (v:vector; diml:integer;i:integer; var suma:integer);

begin

   if (i<=diml) then begin
                suma:=suma+v[i];
                i:=i+1;
                sumar(v,diml,i,suma);
   end;
end;

{PROGRAMA PRINCIPAL}
var
   v: vector;

   i,diml,max,suma:integer;
begin
     i:=1;
     suma:=0;
     max:=-1;
     CargarVector(v,dimL);

     writeln('Nros almacenados: ');
     ImprimirVector(v, dimL);


     maximo(v,max,diml,i);
     writeln('el valor maximo del vector es: ', max);

     sumar(v,diml,i,suma);
     writeln('la suma de todos los elementos del vector :', suma);

     readln;
     readln;
end.
