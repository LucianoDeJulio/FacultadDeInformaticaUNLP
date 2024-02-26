program   EjerProductos;
const
     dimF = 5;
type
    producto = record
             cod_prod: integer;
             cantidad: integer;
             cod_cliente: integer;
             end;

    lista = ^nodo;
    nodo = record
           dato: producto;
           sig: lista;
          end;

    vector = array [1..dimF] of lista;

procedure leer(var p: producto);
begin
     writeln('Ingrese el codigo del producto');
     readln(p.cod_prod);
     if (p.cod_prod <> -1) then begin
        writeln('Ingrese la cantidad de productos vendidos');
        readln(p.cantidad);
        writeln('Ingrese el codigo del cliente');
        readln(p.cod_cliente);
     end;
end;

procedure InsertarOrdenado(var l: lista; p: producto);
var
   nue, act,ant: lista;
begin
    new (nue);
    nue^.dato:= p;
    act:= l;
    ant:= l;
    while(act <> nil) and(act^.dato.cod_prod > p.cod_prod) do begin
            ant:=  act;
            act:= act^.sig;
    end;
    if(ant = act) then
           l:= nue
    else
        ant^.sig:= nue;
    nue^.sig:= act;
end;

procedure cargarVector(var v: vector);
var
   p: producto;
   i: integer;
begin
   leer(p);
   while (p.cod_prod <> -1) do begin
         randomize;
         i:= random (5) +1;
         InsertarOrdenado (v[i],p);
         leer(p);
   end;
end;

procedure ImprimirLista(l:lista);
begin
     while(l <> nil)do begin
         writeln('El codigo del producto es: ', l^.dato.cod_prod);
         writeln('La cantidad vendida es: ', l^.dato.cantidad);
         writeln('El codigo del cliente es: ', l^.dato.cod_cliente);
     end;
end;

procedure ImprimirVector(v:vector);
var
   i: integer;
begin
     for i:=1 to dimF do begin
         writeln('Se imprime la lista : ', i);
         ImprimirLista(v[i]);
     end;
end;

procedure agregarAtras (var l:lista; aux:lista);
var
   nue, act: lista;
begin
   act:= l;
   nue:= aux;
   nue^.sig:= nil;
   if(l <> nil) then begin
        act:=l;
        while(act^.sig <> nil) do
            act:= act^.sig;
        act^.sig:= nue;
   end
   else
       l:= nue;
end;

procedure borrar (var l: lista);
begin
     l:= l^.sig;
end;

procedure BuscarMin (var v: vector; var e: lista);
var
   min,i,pos: integer;
begin
     min:= 99999;
     for i:=1 to dimF  do begin
         if(v[i] <> nil) then
                 if(v[i]^.dato.cod_prod < min) then begin
                         min:= v[i]^.dato.cod_prod;
                         pos:= i;
                         e:= v[i];
                 end;
     end;
     if(min <> 99999) then
            borrar(v[pos])
     else
            e:= nil;
end;

procedure mergeAcumulador(var v:vector; var l:lista);
var
   e,aux:lista;
   total: integer;
begin
   buscarMin(v,e);
   while(e <> nil)do begin
       aux:= e;
       total:= 0;
       while(e <> nil) and (e^.dato.cod_prod = aux^.dato.cod_prod) do begin
           total:= total + e^.dato.cantidad;
           buscarMin(v,e);
       end;
       aux^.dato.cantidad:= total;
       aux^.sig := nil;
       agregarAtras(l,aux);
   end;
end;

procedure maximo(l:lista; var max:integer; var maxP:integer);
begin
     if(l <> nil) then begin
         if(l^.dato.cantidad > max) then begin
              max:= l^.dato.cantidad;
              maxP:= l^.dato.cod_prod;
         end;
         maximo (l^.sig,max,maxP);
     end;
end;

var
   v:vector;
   max, maxP: integer;
   l:lista;
begin
   max:= -1;
   maxP:= -1;
   l:= nil;
   cargarVector(v);
   ImprimirVector(v);
   writeln('se realiza el merge acumulador');
   mergeAcumulador(v,l);
   maximo(l,max,maxP);
   writeln('El codigo del producto mas vendido es: ',maxP);
   readln;
end.
