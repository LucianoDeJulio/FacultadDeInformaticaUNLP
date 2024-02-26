{Un supermercado dispone en papel de la informacion de las ventas de sus productos.
De cada producto se conoce fecha, codigo de producto, tipo de producto, cantidad
vendida, monto total de la venta.

Se pide realizar un programa que:

a) Genere un ABB ordenado por codigo de producto, con las ventas de dicho producto
a partir de la informacion que se ingresa por teclado.El ingreso finaliza cuando
se lee la venta cuya cantidad vendida es -1.


b) Luego de generada la estructura, informar:

   i- El tipo de los productos cuyo codigo esta entre los valores 1500 y 2200.

   ii- La cantidad de ventas cuyo monto total resulto superior a 100 pesos.}


Program arboles;
uses
    sysutils;
const
     inf=1500;
     sup=2200;

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
            cod: integer;
            cantV:integer;
            montoT: integer;
            fecha:fech;
            end;
  producto1= record
                   tipo:cadena;
                   cantV:integer;
                   MontoT: integer;
                   fecha: fech;
             end;
  lista1=^nodo1;
  nodo1= record
            dato: producto1;
            sig: lista1;
          end;
  lista=^nodo;
  nodo= record
              dato: producto;
              sig: lista;

    end;
  arbol= ^nodoA;
  nodoA = Record
    CodP:integer ;
    Pro: lista1;
    HI: arbol;
    HD: arbol;
  End;


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
      writeln('ingrese la cantidad vendida');
    readln(p.cantV);
    if(p.cantV<>-1)then begin
        writeln('ingrese el tipo del producto');
        p.tipo:='nombre'+inttostr(random(990));
        writeln('ingrese el codigo');
        readln(p.cod);
        writeln('ingrese el monto total');
        readln(p.montoT);
        writeln('ingrese la fecha');
        leerfecha(f);
     end;
end;

Procedure AgregarAdelante(var L :lista; p: producto);
var Nue:lista;
begin
     new(nue);
     nue^.dato:=p;
     nue^.sig:=L;
     L:=nue;
end;

Procedure CrearLista(var L:lista);
var
     p:producto;
begin
     leer(p);
     while(p.cantv<>-1) do begin
        AgregarAdelante(L,p);
        Leer(p);
     end;
end;

Procedure CargarRegistro1(p: producto; var p1:producto1);
begin
     p1.tipo:= p.tipo;
     p1.CantV:= p.CantV;
     p1.montoT:= p.MontoT;
     p1.fecha:= p.fecha;
end;




Procedure InsertarOrdenado(var L:lista1;p1:producto1);
 var ant,nue,act:lista1;
 begin
      new(nue);
      nue^.dato:=p1;
      act:=L;
      ant:=L;
      While (act<>nil)and(act^.dato.montoT>p1.montoT)do begin
            ant:=act;
            act:=act^.sig;
      end;
      if(act=ant)then
                     L:=nue
      else
          ant^.sig:=nue;
      nue^.sig:=act;
end;

procedure InsertarABB(var a:arbol; p:producto);
var
  aux:arbol;
  p1: producto1;
begin
  if(a=nil)then
    begin
     new(aux);
     aux^.CodP:=p.cod;
     aux^.HI:=nil;
     aux^.HD:=nil;
     aux^.pro:= nil;
     a:=aux;
     CargarRegistro1(p,p1);
     InsertarOrdenado(a^.pro,p1);
    end
  else
    begin
     if(a^.codP>p.cod)then
       InsertarABB(a^.HI, p)
     else
      begin
        if(a^.codP<p.cod)then
          InsertarABB(a^.HD, p)
        else
          CargarRegistro1(p,p1);
          InsertarOrdenado(a^.pro,p1);

      end;
    end;
end;


Procedure Cargar(var a:arbol;l:lista);
begin
    while(l<>nil)do begin
        InsertarABB(a,l^.dato);
        l:= l^.sig;
    end;
end;


procedure RecorridoAcotadoCod(a:arbol);
begin
  if(a<>nil)then begin
    if(a^.codP>=inf)then
      if( a^.codP<=sup)then begin
        writeln('El tipo de producto es: ', a^.pro^.dato.tipo);
        RecorridoAcotadoCod(a^.HI);
        RecorridoAcotadoCod(a^.HD);
      end
      else
        RecorridoAcotadoCod(a^.HI)
    else
      RecorridoAcotadoCod(a^.HD);
  end;
end;


procedure RecorridoAcotadoPre(a:arbol; var contador: integer);
begin
  if(a<>nil)then
    if(a^.pro^.dato.montoT>=100)then begin
        contador:=contador+1;
        a^.pro:=a^.pro^.sig;
        RecorridoAcotadoPre(a^.HI, contador);
        RecorridoAcotadoPre(a^.HD, contador);
    end;
end;
{PROGRAMA PRINCIPAL}
var
   a:arbol;
   l:lista;
   contador: integer;
begin
 a:=nil;
 l:= nil;
 contador:=0;
 CrearLista(l);
 Cargar(a,l);
 RecorridoAcotadoCod(a);
 RecorridoAcotadoPre(a, contador);
 writeln('la cantidad de productos que superan los 100 pesos son: ', contador);
 readln;
end.
