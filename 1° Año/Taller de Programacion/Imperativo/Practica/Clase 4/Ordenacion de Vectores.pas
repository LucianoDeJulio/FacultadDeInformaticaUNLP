{Utilizando el ProgramaVectores realice la siguiente actividad:

1- Implementar el modulo OrdenacionPorInsercion utilizando el pseudocodigo.

2- Invocar el modulo y mostrar el vector resultante.

3- Implemente el metodo de busqueda discotomica recursivo.

4- Utilizando el metodo implementado,lea un valor de teclado e imprima el resultado
de la busqueda}


program Arreglos;

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



Procedure ImprimirVector ( var vec: vector;  dimL: integer );
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


procedure ordenar(var v:vector; diml:integer);
var
    j,i,x:integer;

begin
    for i:=2 to diml do begin
        x:=v[i];
        j:=i-1;
        while(j>0) and (v[j]>x) do begin
            v[j+1]:=v[j];
            j:=j-1;
        end;
        v[j+1]:=x;
    end;
end;

Procedure BusquedaD( v:vector; ini,fin,dato:integer; var pos:integer );
var
  medio:integer;
begin
  if(fin<ini)then
    writeln('No hay elementos.')
  else begin
    medio:=(ini+fin) div 2;
    if(v[medio]=dato)then
      pos:=medio
    else
      if(v[medio]>dato)then begin
        fin:=medio-1;
        BusquedaD(v,ini,fin,dato,pos);
      end
      else begin
        ini:=medio+1;
        BusquedaD(v,ini,fin,dato,pos);
      end;
  end;
end;



{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL : integer;
   ini,fin,pos,dato:integer;

begin

     CargarVector(v,dimL);

     writeln('Nros almacenados: ');
     ImprimirVector(v, dimL);
     writeln('Se ordenara el vector');
     ordenar(v,diml);
     ImprimirVector(v,diml);
     ini:=1;
     fin:=diml;
     writeln('Ingrese dato a buscar.');
     readln(dato);
     BusquedaD(v,ini,fin,dato,pos);
     writeln('Dato encontrado en la posicion: ',pos);

     readln;
     readln;
end.
