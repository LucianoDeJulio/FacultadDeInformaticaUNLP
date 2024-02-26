{Implementar el modulo CrearVector (de entero y sin orden)
Implementar un modulo ImprimirVector que recibe el vector y su dimL y muestre
los elementos del vector}


Program Vectores;
Type
    vector=array[1..8] of integer;
Procedure  CargarVector(var v: vector; var dimL:integer);
Var  dato:integer;
Begin
     dimL:=0;
     read(dato);
     while(dato<>0)and (dimL<=8)do begin
          dimL:=dimL+1;
          v[dimL]:= dato;
          read(dato);
     end;
end;
Procedure ImprimirVector(v:vector; dimL:integer);
Var       i:integer;
Begin
     writeln('Numeros Almacenados: ');
     writeln('-----------------------');
     for i:=1 to dimL do begin
          write(v[i],'|');

     end;
     writeln;
     writeln('-----------------------');
end;
Var
    v:vector;
    dimL: integer;
Begin
    CargarVector(v,dimL);
    ImprimirVector(v,dimL);
    readln;
    readln;
end.
