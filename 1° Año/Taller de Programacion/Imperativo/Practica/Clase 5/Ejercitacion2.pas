Program arboles;
Type
  rango1=1..31;
  rango2=1..12;
  rango3=2000..2019;
  fech=record
              dia: rango1;
              mes: rango2;
              anio:rango3;
              end;
  cadena= string[40];
  producto=record
            tipo: cadena;
            cant_vendida:integer;
            cod: integer;
            monto_total: integer;
            fecha:fech;
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
procedure leerfecha(var f:fech);
begin
    randomize;
    writeln('ingrese el dia');
    f.dia:=random(31)+1;
    writeln('ingrese el mes');
    f.mes:=random(12)+1;
    writeln('ingrese el anio');
    f.anio:=random(20)+2000;
end;
procedure leer(var p:producto);
var
    f:fech;
begin
    randomize;
    writeln('ingrese la cantidad vendida');
    readln(p.cant_vendida);
    if(p.cant_vendida<>-1)then begin
        writeln('ingrese el tipo del producto');
        readln(p.tipo);
        writeln('ingrese el codigo');
        readln(p.cod);
        writeln('ingrese el monto total');
        readln(p.monto_total);
        writeln('ingrese la fecha');
        leerfecha(f);
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
    while(p.cant_vendida<>-1)do begin
        InsertarABB(a,p);
        leer(p);
    end;
end;



procedure RecorridoAcotadoCod(a:arbol; inf,sup:integer);
begin
  if(a<>nil)then begin
    if(a^.dato.cod>=inf)then
      if( a^.dato.cod<=sup)then begin
        writeln('El tipo es: ', a^.dato.tipo);
        RecorridoAcotadoCod(a^.HI,inf,sup);
        RecorridoAcotadoCod(a^.HD,inf,sup);
      end
      else
        RecorridoAcotadoCod(a^.HI,inf,sup)
    else
      RecorridoAcotadoCod(a^.HD,inf,sup);
  end;
end;

procedure RecorridoAcotadoPre(a:arbol; var contador:integer);
begin
  if(a<>nil)then begin
    if(a^.dato.monto_total>100)then begin
        contador:=contador+1;
        RecorridoAcotadoPre(a^.HI,contador);
        RecorridoAcotadoPre(a^.HD,contador);
      end;
  end;
end;
{PROGRAMA PRINCIPAL}
var
   a:arbol;
   inf,sup, contador:integer;

begin
 contador:=0;
 a:=nil;
 Cargar(a);
 writeln('Ingrese una cota inferior y una superior para imprimir los datos entre esos dos valores.');
 readln(inf);
 readln(sup);
 RecorridoAcotadoCod(a,inf,sup);
 RecorridoAcotadoPre(a,contador);
 writeln('la cantidad de ventas son: ', contador);
 readln;
end.
