{Una caja de supermercado registra las cantidades vendidas de sus productos
en stock del lunes al viernes de una semana particular.

Implementar un programa que:

1- Genere 5 listas ordenadas por el código de producto de forma ascendente
con los productos vendidos cada uno de los días de la semana. De cada producto
se conoce código de producto, cantidad vendida y código de cliente. La lectura
finaliza cuando se lee el código de producto -1. Tener en cuenta que un producto
puede ser vendido, en distintos días de esa semana y también más de una vez en
el mismo día.

2- Genere una nueva lista que contenga para cada código de producto, la
cantidad total vendida en la semana. Esta lista debe quedar ordenada por código
de producto, en forma ascendente.

3- Invoque a un módulo recursivo que recibe la lista generada en 2 y devuelve
el código de producto que más se vendió en esa semana.}





program MergeAcumulador;
const
  dimf = 5;
type

  producto = record
            CodC:integer;
            CodP:integer;
            CantV:integer;
            end;

  lista = ^Nodo;
  nodo = record
         dato:producto;
         sig:lista;
         end;
  vector = array[1..dimf]of lista;

procedure leer(var p:producto);
begin
  writeln('Ingrese el codigo del producto');
  readln(p.CodP);
  if(p.CodP<>-1) then begin
     writeln('ingrese el codigo del cliente');
     readln(p.CodC);
     writeln('ingrese la cantida vendida');
     readln(p.CantV);
  end;
end;

Procedure InsertarOrdenado(var L:lista;p:producto);
 var ant,nue,act:lista;
 begin
      new(nue);
      nue^.dato:=p;
      act:=L;
      ant:=L;
      While (act<>nil)and(act^.dato.CodP<p.CodP)do begin
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
   p:producto;
   i:integer;
begin
       Leer(p);
       while(p.CodP<>-1)do begin
         randomize;
         i:= random (5)+1;
             InsertarOrdenado(v[i],p);
         Leer(p);
      end;
end;

procedure ImprimirLista(l:lista);
begin
     while(l<>nil)do begin
         writeln('el codigo del producto es: ', l^.dato.CodP );
         writeln('el codigo del cliente es: ', l^.dato.CodC);
         writeln('La cantidad vendida es: ', l^.dato.CantV);
            l:=l^.sig;

     end;
end;

Procedure ImprimirVector(v:vector);
var i:integer;
begin
     for i:= 1 to DimF do begin
       writeln('se imprime la lista: ', i);
        ImprimirLista(v[i]);
        Readln;

     end;
end;

procedure ImprimirListaFinal(l:lista);
begin
     while(l<>nil)do begin
            writeln('El codigo del producto: ',l^.dato.CodP,' vendio en total: ',l^.dato.cantV);
            l:=l^.sig;
            READLN;
     end;
end;

Procedure AgregarAtras (var L:lista; N:lista);
var
 nue,act:lista;
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

    for i:=1 to Dimf do begin
        if (v[i]<>NIl)then
             if(v[i]^.dato.CodP<min)then begin
                    min:=v[i]^.dato.CodP;
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
    CanTot: integer;
begin
    buscarmin(v,E);
    while(E<>nil) do begin
        aux:=e;
        CanTot:=0;
        while(E<>NIl) and(E^.dato.CodP=aux^.dato.CodP) do begin
            Cantot:=Cantot+E^.dato.Cantv;
            buscarmin(v,E);
        end;
        aux^.dato.CantV:=CanTot;
        aux^.sig:=nil;
        agregaratras(l,aux);

    end;
end;

procedure Maximo(l:lista; var max:integer; Var MaxC: integer);
begin
  if(l<>nil)then begin
     if(l^.dato.CantV>max)then
       max:=l^.dato.CantV;
       maxC:=l^.dato.codP;
     maximo(l^.sig,max,MaxC);
  end;
end;

Var
   v:vector;
   l:lista;
   max, maxC: integer;
Begin    {programa principal}
   l:=nil;
   max:= -1;
   MaxC:= -1;
   CargarVector(v);
   ImprimirVector(v);
   writeln ('se realiza un Merge Acumulador');
   Merge(v,l);
   ImprimirListaFinal(l);
   Maximo(l,max, maxC);
   writeln('el codigo de producto mas vendido es: ', maxC);
   readln;
End.
