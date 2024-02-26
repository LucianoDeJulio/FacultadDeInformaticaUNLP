{Actividad 7:

a- Generar un arbol de numeros enteros utilizando la lista ya creada.

b- Mostrar el contenido del arbol en forma creciente.

c- Implemente el modulo VerValoresEnRango que recibe un arbol y dos valores, que
indiquen un rango, e informe los valores del arbol que se encuentren en dicho
rango.

d- Invocar al modulo VerValoresEnRango con dos valores leidos de teclado.}


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

procedure RecorridoAcotado(a:arbol; inf,sup:integer);
begin
  if(a<>nil)then begin
    if(a^.dato>=inf)then
      if( a^.dato<=sup)then begin
        writeln('Numero: ', a^.dato);
        RecorridoAcotado(a^.HI,inf,sup);
        RecorridoAcotado(a^.HD,inf,sup);
      end
      else
        RecorridoAcotado(a^.HI,inf,sup)
    else
      RecorridoAcotado(a^.HD,inf,sup);
  end;
end;

procedure EnOrden(a:arbol);
begin
 if(a<>nil) then begin
    EnOrden(a^.HI);
    writeln(a^.dato,' ');
    EnOrden(a^.HD);
 end;
end;





{PROGRAMA PRINCIPAL}
var
   a:arbol;
   dato,inf,sup:integer;

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
 writeln('Se imprime en orden');
 EnOrden(a);
 writeln('Ingrese una cota inferior y una superior para imprimir los datos entre esos dos valores.');
 readln(inf);
 readln(sup);
 RecorridoAcotado(a,inf,sup);

 readln;
end.
