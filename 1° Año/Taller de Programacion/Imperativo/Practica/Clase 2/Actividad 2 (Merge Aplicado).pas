{Actividad 2: Implementar el ProgramaMerge4Listas que:

a- Invoque al modulo CrearvectorListas que genera un vector de 4 listas de
libros, utilizando el modulo CrearListaOrdenada del ProgramaLista. Cada libro se
representa con un codigo ISBN entre 0 y 10 (usar funcion random).

b- Invoque al modulo ImprimirVectorListas que imprime en pantalla el contenido
de cada lista del vector, utilizando el modulo ImprimirLista del ProgramaListas.

c- Invoque al modulo Merge que recibe el vector generado en a) y devuelve una nueva
lista con los elementos de las 4 listas. Este Modulo requiere:

      1- Implementar el modulo BuscarMinimo que retorne el valor minimo de un vector
      de listas ordenadas de forma creciente. El valor retornado se debe quitar de
      la lista original.

      2- Implementar el Modulo AgregarAtras. Para ello revisar el modulo AgregarAtras.}



Program Ejercicio2;
const
  dimf=4;
Type
    cadena=string[40];
    rango2=1..4;
    persona=record
                  apellido:cadena;
                  codigo:Integer;
                  anio:integer;
                  cat:rango2;
     end;
    lista=^nodo;
    nodo=record
           dato:persona;
           sig:lista;
           end;
    vector=array[1..dimf]of lista;

Procedure Leer(var p:persona);
begin
     randomize;
     writeln('inserte el apellido');
     readln(p.apellido);
     writeln('inserte el codigo');
     p.codigo:=random(1000);
     writeln('inserte el anio');
     p.anio:=  random(20)+1990;
     writeln('inserte la categoria');
     p.cat:= random (4)+1;
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
            writeln('el apellido del empleado es: ',l^.dato.apellido,' y su codigo es: ',l^.dato.codigo);
            l:=l^.sig;
     end;
end;


Procedure ImprimirVector(v:vector);
var i:integer;
begin
     for i:= 1 to 4 do begin
         writeln('la categoria es ', i);
         ImprimirLista(v[i]);
     end;
end;

Procedure AgregarAtras (var L:lista; N:lista);
var nue,act:lista;
begin
     act:=L;
     nue:=N;
     nue^.sig:=nil;
     if(L<>nil)then begin
          act:=L;
          while(act^.sig<>nil)do
                                act:=act^.sig;
          act^.sig:=nue;
     end
     else
         L:=nue;
end;

procedure Borrar(var l:lista);
begin
    l:=l^.sig;
end;

procedure buscarMin(var v:vector;var E:lista);
var
    min:CADENA;
    i,pos:integer;
begin
    min:='zzzzzzzz';

    for i:=1 to Dimf do begin
        if (v[i]<>NIl)then
             if(v[i]^.dato.apellido<min)then begin
                    min:=v[i]^.dato.apellido;
                    pos:=i;
                    E:=v[i];
             end;

    end;
    if(min<>'zzzzzzzz')then
        Borrar(v[pos])
    else
        E:=nil;

end;

procedure Merge(var v:vector; var l:lista);
var
    E:lista;
begin
    buscarmin(v,E);
    while(E<>nil) do begin
        agregaratras(l,E);
        buscarmin(v,E);
    end;
end;

Var
   v:vector;
   l:lista;
   i:integer;
Begin    {programa principal}
   for i:=1 to 15 do
       CargarVector(v);
   ImprimirVector(v);
   writeln;
   Merge(v,l);
   writeln;
   writeln('Lista final.');
   imprimirlista(l);
   readln;
   readln;
End.
