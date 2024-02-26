{Actividad 5:

a- Implementar el modulo Buscar que reciba un arbol y un valor y devuelva un
puntero al nodo donde se encuentra dicho valor. En caso de no encontrarlo, debe
retornar NIL.

b- Invocar al modulo Buscar con un valor que se ingresa de teclado. Mostrar el
resultado de la busqueda.}


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

procedure Buscar (a:arbol; var p:arbol;dato: integer);
begin
     if(a=nil) then
                p:=nil
     else
         if(dato=a^.dato)then
            p:=a
         else
             if(dato<a^.dato)then
                  Buscar(a^.HI,p,dato)
             else
                  Buscar(a^.HD,p,dato);
end;


{PROGRAMA PRINCIPAL}
var
   a,p:arbol;
   dato,i:integer;
begin
 a:=nil;
 writeln('Ingrese dato');
 readln(dato);
 while(dato<>0)do begin
   insertarabb(a,dato);
   writeln('Ingrese dato');
   readln(dato);
 end;
    imprimirpornivel(a);
 writeln('ingrese el dato a buscar');
 readln(dato);
 Buscar(a,p,dato);
 if (p<>nil) then
     writeln('el dato fue encontrado')
 else
     writeln('el dato no fue encontrado');
 readln;
end.
