{Se cuenta con la informacion (en papel) de los 15 empleados de una empresa. De
cada empleado se lee el codigo, apellido, año de ingreso a la empresa (1980..2018)
y su categoria (1..4)

El programa debe:

 a- Guardar los datos de los empleados ordenados alfabeticamente por apellido y
 agrupados por categoria.

 b- Una vez guardados, mostrar los apellidos y codigo de los empleados de cada
 categoria.}

Program VectorListas;
Type
    cadena=string[40];
    rango1=1928..2018;
    rango2=1..4;
    persona=record
                  apellido:cadena;
                  codigo:Integer;
                  anio:rango1;
                  cat:rango2;
     end;
    lista=^nodo;
    nodo=record
           dato:persona;
           sig:lista;
           end;
    vector=array[1..4]of lista;

Procedure Leer(var p:persona);
begin
     writeln('inserte el apellido');
     readln(p.apellido);
     writeln('inserte el codigo');
     readln(p.codigo);
     writeln('inserte el anio');
     readln(p.anio);
     writeln('inserte la categoria');
     readln(p.cat);
end;

Procedure InsertarOrdenado(var L:lista;p:persona);
 var ant,nue,act:lista;
 begin
      new(nue);
      nue^.dato:=p;
      act:=L;
      ant:=L;
      While (act<>nil)and(act^.dato.apellido<p.apellido)do begin
            ant:=act;
            act:=act^.sig;
      end;
      if(act=ant)then
                     L:=nue
      else
          ant^.sig:=nue;
      nue^.sig:=act;
end;

procedure CargarVector(var v:vector);
var
   p:persona;
begin
     Leer(p);
     InsertarOrdenado(v[p.cat],p);
end;
procedure ImprimirLista(l:lista);
begin
     while(l<>nil)do begin
            write('el apellido del empleado es: ',l^.dato.apellido,'y su codigo es: ',l^.dato.codigo);
            l:=l^.sig;
     end;
end;


Procedure ImprimirVector(v:vector);
var i:integer;
begin
     for i:= 1 to 4 do begin
         writeln('la categoria es', i);
         ImprimirLista(v[i]);
     end;
end;

Var
   v:vector;
   i:integer;
Begin    {programa principal}
   for i:=1 to 8 do
       CargarVector(v);
   ImprimirVector(v);
   readln;
   readln;
End.
