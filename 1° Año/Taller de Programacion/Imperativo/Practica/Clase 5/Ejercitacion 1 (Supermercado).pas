{Un supermercado dispone en papel de la informacion de sus productos. De cada
producto se conoce tipo, descripcion, codigo y precio. Se pide realizar un programa
que:

a) Genere un ABB ordenado por codigo, con informacion de los productos que se
ingresan por teclado. El ingreso finaliza cuando se lee el producto con tipo igual
a ZZZ.

b) Luego de generada la estructura, informar:

   i- El tipo y la descripcion de los productos cuyo codigo esta entre los
   valores 1500 y 2200.

   ii- La cantidad de productos cuyo precio esta entre 50 y 100 pesos.}



Program arboles;
Type
  cadena= string[40];
  producto=record
            tipo: cadena;
            desc:cadena;
            cod: cadena;
            pre: integer;
    end;
  arbol= ^nodoA;
  nodoA = Record
    dato:producto ;
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
procedure leer(var p:producto);
begin
    writeln('ingrese el codigo del producto');
    readln(p.cod);
    if(p.cod<>'zzz')then begin
        writeln('ingrese la descripcion');
        readln(p.desc);
        writeln('ingrese el tipo');
        readln(p.tipo);
        writeln('ingrese el precio');
        randomize;
        p.pre:= random(100);
     end;
end;

procedure InsertarABB(var a:arbol; dato:producto);
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
    if(a^.dato.cod>dato.cod)then
      InsertarABB(a^.HI, dato)
    else
      InsertarABB(a^.HD, dato);
  end;

Procedure Cargar(var a:arbol);
var
    p:producto;
begin
    leer(p);
    while(p.cod<>'zzz')do begin
        InsertarABB(a,p);
        leer(p);
    end;
end;



procedure RecorridoAcotadoCod(a:arbol; inf,sup:cadena);
begin
  if(a<>nil)then begin
    if(a^.dato.cod>=inf)then
      if( a^.dato.cod<=sup)then begin
        writeln('El tipo es: ', a^.dato.tipo,' ','y su descripcion es: ',a^.dato.desc);
        RecorridoAcotadoCod(a^.HI,inf,sup);
        RecorridoAcotadoCod(a^.HD,inf,sup);
      end
      else
        RecorridoAcotadoCod(a^.HI,inf,sup)
    else
      RecorridoAcotadoCod(a^.HD,inf,sup);
  end;
end;

procedure RecorridoAcotadoPre(a:arbol; inf1,sup1:integer; var contador: integer);
begin
  if(a<>nil)then begin
    if(a^.dato.pre>=inf1)then
      if( a^.dato.pre<=sup1)then begin
        contador:=contador+1;
        RecorridoAcotadoPre(a^.HI,inf1,sup1,contador);
        RecorridoAcotadoPre(a^.HD,inf1,sup1,contador);
      end;
end;
end;


{PROGRAMA PRINCIPAL}
var
   a:arbol;
   inf,sup: cadena;
   contador, inf1,sup1:integer;

begin
 a:=nil;
 contador:=0;
 Cargar(a);
 writeln('Ingrese una cota inferior y una superior para imprimir los datos entre esos dos valores.');
 readln(inf);
 readln(sup);
 RecorridoAcotadoCod(a,inf,sup);
 writeln('Ingrese una cota inferior y una superior para imprimir los datos entre esos dos valores.');
 readln(inf1);
 readln(sup1);
 RecorridoAcotadoPre(a,inf1,sup1, contador);
 writeln('la cantidad de producto que tienen precios entre 50 y 100 son: ', contador);
 readln;
end.
