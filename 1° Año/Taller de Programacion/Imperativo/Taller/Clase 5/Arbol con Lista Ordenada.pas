{Actividad 2: Implementar un programa que invoque a:

a) Un modulo que genere una lista ordenada de numeros enteros.

b) Un modulo que genere un ABB con los elementos de la lista generada.

c) Mostrar los datos del arbol por niveles.}



Program arboles;
Type

  // Arbol de enteros
  arbol= ^nodoA;
  nodoA = Record
    dato: integer;
    HI: arbol;
    HD: arbol;
  End;

  // Lista de Arboles
  listaNivel = ^nodoN;
  nodoN = record
    info: arbol;
    sig: listaNivel;
  end;

  Lista = ^Nodo;
  Nodo = record
         Dato:Integer;
         sig:lista;
         end;
 {-----------------------------------------------------------------------------
CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }

function ContarElementos (l: listaNivel): integer;
  var c: integer;
begin
 c:= 0;
 While (l <> nil) do begin
   c:= c+1;
   l:= l^.sig;
 End;
 contarElementos := c;
end;

{-----------------------------------------------------------------------------
AGREGARATRAS - Agrega un elemento atras en l}

Procedure AgregarAtras (var l, ult: listaNivel; a:arbol);
 var nue:listaNivel;

 begin
 new (nue);
 nue^.info := a;
 nue^.sig := nil;
 if l= nil then l:= nue
           else ult^.sig:= nue;
 ult:= nue;
 end;




{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del arbol a por niveles }

Procedure imprimirpornivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
   l:= nil;
   if(a <> nil)then begin
                 nivel:= 0;
                 agregarAtras (l,ult,a);
                 while (l<> nil) do begin
                    nivel := nivel + 1;
                    cant:= contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    for i:= 1 to cant do begin
                      write (l^.info^.dato, ' - ');
                      if (l^.info^.HI <> nil) then agregarAtras (l,ult,l^.info^.HI);
                      if (l^.info^.HD <> nil) then agregarAtras (l,ult,l^.info^.HD);
                      aux:= l;
                      l:= l^.sig;
                      dispose (aux);
                     end;
                     writeln;
                 end;
               end;
end;

Procedure InsertarOrdenado(var L:lista;p:integer);
 var ant,nue,act:lista;
 begin
      new(nue);
      nue^.dato:=p;
      act:=L;
      ant:=L;
      While (act<>nil)and(act^.dato<p)do begin
            ant:=act;
            act:=act^.sig;
      end;
      if(act=ant)then
                     L:=nue
      else
          ant^.sig:=nue;
      nue^.sig:=act;
end;

procedure InsertarABB(var a:arbol; dato:integer);
var
  aux:arbol;
begin
  if(a=nil)then begin
    new(aux);
    aux^.dato:=dato;
    aux^.HI:=nil;
    aux^.HD:=nil;
    a:=aux;
  end
  else
    if(a^.dato>dato)then
      InsertarABB(a^.HI, dato)
    else
      InsertarABB(a^.HD, dato);
  end;

procedure imprimirL(l:lista);
begin
  while(l<>nil)do begin
    writeln(l^.dato);
    l:=l^.sig;
  end;
end;

Var
  l:lista;
  a:arbol;
  dato,i:integer;
begin
  l:=nil;
  Randomize;
  for i:=1 to 15 do begin
    dato:= random(200);
    InsertarOrdenado(l,dato);
  end;
  imprimirL(l);
  while(l<>nil)do begin
    insertarABB(a,l^.dato);
    l:=l^.sig;
  end;
  imprimirpornivel(a);
  readln;
end.

