{Acitividad: Realice un MERGE de 4 listas de libros}



program MergedeLista;
Const
  Dimf= 4;
type
    lista=^nodo;
    nodo= record
         datos:integer;
         sig:lista;
         end;
    vector=array[1..Dimf] of lista;
Procedure InsertarOrdenado( var pri: lista; n:integer);
var ant, nue, act: lista;
begin
  new (nue);
  nue^.datos :=n;
  act := pri;
  ant := pri;

  while (act<>NIL) and (act^.datos < n) do begin
      ant := act;
      act := act^.sig ;
  end;
  if (ant = act)  then pri := nue
                  else  ant^.sig  := nue;
  nue^.sig := act ;
end;

Procedure Cargar(var V:vector);
var
  cat,isbn:integer;
begin
     Randomize;
     cat:=Random(4)+1;
     isbn:=Random(11);
     isbn := isbn + cat;
writeln(isbn,'',cat);
readln;
     InsertarOrdenado(v[cat],isbn);
end;

procedure ImprimirLista(l:lista);
begin
     while(l<>nil)do begin
            writeln('ISBN es: ',l^.datos);
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

procedure buscarMin(var v:vector;var ISBN:lista);
var
    min,i,pos:integer;
begin
    min:=9999;

    for i:=1 to Dimf do begin
        if (v[i]<>NIl)then
             if(v[i]^.datos<min)then begin
                    min:=v[i]^.datos;
                    pos:=i;
                    ISBN:=v[i];
             end;

    end;
    if(min<>9999)then
        Borrar(v[pos])
    else
        isbn:=nil;

end;

procedure Merge(var v:vector; var l:lista);
var
    ISBN:lista;
begin
    buscarmin(v,ISBN);
    while(ISBN<>nil) do begin
        agregaratras(l,Isbn);
        buscarmin(v,Isbn);
    end;
end;

var
    v:vector;
    l:lista;
    i:integer;
begin
    L:=NIL;
    for i:=1 to 15 do
        cargar(v);
    writeln('Datos cargados correctamente.');
    ImprimirVector(v);
    writeln;
    writeln('Se realizara un merge.');
    merge(v,l);
    writeln;
    writeln('Lista final.');
    imprimirLista(l);
    readln;


end.
