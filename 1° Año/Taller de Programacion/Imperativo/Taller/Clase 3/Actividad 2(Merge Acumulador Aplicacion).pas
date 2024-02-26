{Una perfumeria tiene 4 sucursales. Cada sucursal dispone en papel de la
informacion de sus ventas. Implementar un programa que:

a- Genere 4 listas ordenadas por codigo de producto de forma ascendente con las
ventas de cada sucursal de la perfumeria. De cada venta se lee fecha de venta,
codigo del producto y cantidad vendida. La lectura finaliza con codigo de producto
igual a -1.

b- Genere una nueva lista que totalice la cantidad de ventas de cada producto de
la perfumeria. Esta lista debe estar ordenada por codigo de producto de forma
ascendente}




program MergeAcumulador;
const
  dimf = 4;
type
  rango1= 1..31;
  rango2= 1..12;
  rango3= 2000..2018;
  fecha= record
             dia: rango1;
             mes: rango2;
             anio: rango3;

           end;
  producto = record
            cod:integer;
            cantv:integer;
            fech: fecha;
            end;
  lista = ^Nodo;
  nodo = record
         dato:producto;
         sig:lista;
         end;
  vector = array[1..dimf]of lista;

procedure leerf(var f:fecha);
begin
  writeln('ingrese el dia');
  readln(f.dia);
  writeln('ingrese el mes');
  readln(f.mes);
  writeln('ingrese el anio');
  readln(f.anio);
end;

procedure leer(var c:producto);
var
  f:fecha;
begin
  writeln('Ingrese codigo de producto y cantidad vendida.');
  readln(c.cod);
  randomize;
  c.cantv:=random (2000);
  writeln('Ingrese la fecha de la venta');
  leerf(f);
end;

Procedure InsertarOrdenado(var L:lista;p:producto);
 var ant,nue,act:lista;
 begin
      new(nue);
      nue^.dato:=p;
      act:=L;
      ant:=L;
      While (act<>nil)and(act^.dato.cod<p.cod)do begin
            ant:=act;
            act:=act^.sig;
      end;
      if(act=ant)then
                     L:=nue
      else
          ant^.sig:=nue;
      nue^.sig:=act;
end;

procedure CargarVector(var v:vector;p:producto);
var
   i:integer;
begin
     randomize;
     i:=random (4)+1;
     InsertarOrdenado(v[i],p);
end;
procedure ImprimirLista(l:lista);
begin
     while(l<>nil)do begin
            writeln('el codigo: ',l^.dato.cod,' y su cantidad vendida es: ',l^.dato.cantv);
            l:=l^.sig;
            READLN;
     end;
end;


Procedure ImprimirVector(v:vector);
var i:integer;
begin
     for i:= 1 to 4 do begin
        writeln('Los productos de la sucursal ',i,' son:' );
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
    min:integer;
    i,pos:integer;
begin
    min:=99999;

    for i:=1 to Dimf do begin
        if (v[i]<>NIl)then
             if(v[i]^.dato.cod<min)then begin
                    min:=v[i]^.dato.cod;
                    pos:=i;
                    E:=v[i];
             end;

    end;
    if(min<>99999)then
        Borrar(v[pos])
    else
        E:=nil;

end;

procedure Merge(var v:vector; var l:lista);
var
    E,aux:lista;
    total:integer;
begin
    buscarmin(v,E);
    while(E<>nil) do begin
        aux:=e;
        total:=0;
        while(E<>NIl) and(E^.dato.cod=aux^.dato.cod) do begin
            total:=total+E^.dato.cantv;
            buscarmin(v,E);
        end;
        aux^.dato.cantv:=total;
        aux^.sig:=nil;
        agregaratras(l,aux);

    end;
end;
Var
   v:vector;
   l:lista;
   p:producto;
Begin    {programa principal}
   Leer(p);
   while(p.cod<>-1)do begin
       CargarVector(v,p);
       Leer(p);
   end;
   ImprimirVector(v);
   writeln;
   Merge(v,l);
   writeln;
   writeln('Lista final.');
   imprimirlista(l);
   readln;
   readln;
End.

