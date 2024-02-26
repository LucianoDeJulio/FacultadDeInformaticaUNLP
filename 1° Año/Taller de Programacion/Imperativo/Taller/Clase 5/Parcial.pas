program parcial;
type
    rango2=0..100;
    alumno=record
                 anio:integer;
                 nota:rango2;
           end;

    lista=^nodo;
    nodo=record
               dato:alumno;
               sig:lista;
         end;

    arbol=^nodo1;
    nodo1=record
                dato: alumno;
                HI:arbol;
                HD:arbol;
            end;


    vector=array[1..6] of lista;

procedure leer(var a:alumno);
begin
  writeln('Ingrese el anio del alumno');
  readln(a.anio);
  if(a.anio<>0) then begin
     writeln('ingrese la nota del alumno');
     readln(a.nota);
  end;
end;

Procedure InsertarOrdenado(var L:lista; a:alumno);
 var ant,nue,act:lista;
 begin
      new(nue);
      nue^.dato:=a;
      act:=L;
      ant:=L;
      While (act<>nil)and(act^.dato.nota<a.nota)do begin
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
   a:alumno;
   i:integer;
begin
       Leer(a);
       while(a.anio<>0)do begin
             i:= a.anio;
             InsertarOrdenado(v[i],a);
         Leer(a);
      end;
end;

procedure ImprimirLista(l:lista);
begin
     while(l<>nil)do begin
         writeln('la nota del alumno es: ', l^.dato.nota);
         l:=l^.sig;
     end;
end;

Procedure ImprimirVector(v:vector);
var i:integer;
begin
     for i:= 1 to 6 do begin
       writeln('se imprime la lista: ', i);
        ImprimirLista(v[i]);
     end;
end;

Procedure AgregarAtras (var L:lista; N:lista);
var nue,act:lista;
begin
     act:=L;
     nue:=N;
     nue^.sig:=nil;
     if(L<>nil)then
     begin
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

    i,pos,min:integer;
begin
    min:=9999;

    for i:=1 to 6 do begin
        if (v[i]<>NIl)then
             if(v[i]^.dato.nota<min)then begin
                    min:=v[i]^.dato.nota;
                    pos:=i;
                    E:=v[i];
             end;

    end;
    if(min<>9999)then
        Borrar(v[pos])
    else
        E:=nil;

end;

procedure Merge(var v:vector; var l:lista);
var
    E,aux:lista;
    IndiceX: integer;
begin
    buscarmin(v,E);
    while(E<>nil) do begin
        aux:=e;
        IndiceX:=0;
        while(E<>NIl) and(E^.dato.Nota=aux^.dato.Nota) do begin
            IndiceX:=IndiceX+1;
            buscarmin(v,E);
        end;
        aux^.dato.anio:=IndiceX;
        aux^.sig:=nil;
        agregaratras(l,aux);

    end;
end;

procedure ImprimirLista2(l:lista);
begin
     while(l<>nil)do begin
            writeln('la nota: ',l^.dato.nota,' tiene un indice: ',l^.dato.anio);
            l:=l^.sig;
            READLN;
     end;
end;


procedure InsertarABB(var a:arbol; alum:alumno);
var
  aux:arbol;
begin
  if(a=nil)then begin
    new(aux);
    aux^.dato:=alum;
    aux^.HI:=nil;
    aux^.HD:=nil;
    a:=aux;
  end
  else
    if(a^.dato.anio>alum.anio)then
      InsertarABB(a^.HI, alum)
    else
      InsertarABB(a^.HD, alum);
end;

procedure CargarArbol(var a:arbol;l:lista);

begin
    while (l<>nil) do begin
      insertarABB(a,l^.dato);
      l:=l^.sig;
    end;
end;

procedure EnOrden(a:arbol);
begin
 if(a<>nil) then begin
    EnOrden(a^.HI);
    writeln(a^.dato. anio,' ',a^.dato.nota);
    EnOrden(a^.HD);
 end;
end;

procedure RecorridoAcotado(a:arbol; inf,sup:integer);
begin
  if(a<>nil)then begin
    if(a^.dato.anio>=inf)then
      if( a^.dato.anio<=sup)then begin
        writeln('La nota es: ', a^.dato.nota);
        RecorridoAcotado(a^.HI,inf,sup);
        RecorridoAcotado(a^.HD,inf,sup);
      end
      else
        RecorridoAcotado(a^.HI,inf,sup)
    else
      RecorridoAcotado(a^.HD,inf,sup);
  end;
end;


var
   v:vector;
   l:lista;
   a:arbol;
   inf,sup:integer;
begin
   CargarVector(v);
   ImprimirVector(v);
   writeln('se realiza un merge acumulador');
   Merge(v,l);
   Writeln('La Lista Final es: ');
   ImprimirLista2(l);
   writeln('se genera un arbol ordenado por el IndiceX');
   CargarArbol(a,l);
   EnOrden(a);
   writeln('ingrese el indice inferior');
   readln(inf);
   writeln('ingrese el indice superior');
   readln(sup);
   RecorridoAcotado(a,inf,sup);
   readln;
end.
