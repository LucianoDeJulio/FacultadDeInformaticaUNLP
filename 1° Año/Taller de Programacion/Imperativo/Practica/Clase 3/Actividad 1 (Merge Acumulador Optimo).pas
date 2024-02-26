{Actividad 1: Crear un programa ProgramaAcumulador.

a- Generar las 2 listas que contienen los gastos ordenados por tipo de consumo.
De cada consumos se conoce el tipo de consumo, la fecha y el monto del gasto.

b- Mostrar las listas generadas.

c- Adapatar los tipos de datos utilizados por el AgregarAtras ya trabajado.

d- Adaptar los tipos de datos utilizados por el BuscarMinimo.

e- Realizar un modulo que haga un merge entre las 2 listas de consumos, acumulando
el monto total de cada consumo. Utilizar los modulos implementados en d) y c).

f- En el prog. principal invocar al modulo MergeAcumulador enviandole 2 listas
creadas previamente. Imprimir en pantalla cada tipo de consumo y su monto total
gastado.}



program MergeAcumulador;
const
  dimf = 2;
type
  cadena = String[40];
  rango1= 1..31;
  rango2= 1..12;
  rango3= 2000..2018;
  fecha= record
             dia: rango1;
             mes: rango2;
             anio: rango3;
           end;
  consumo = record
            impu:cadena;
            gastop:integer;
            fech: fecha;
            end;
  lista = ^Nodo;
  nodo = record
         dato:consumo;
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

procedure leer(var c:consumo);
var
  f:fecha;
begin
  writeln('Ingrese consumo y gasto.');
  readln(c.impu);
  randomize;
  c.gastop:=random (2000)+1;
  writeln('ingrese la fecha');
  leerf(f);
end;

Procedure InsertarOrdenado(var L:lista;p:consumo);
 var ant,nue,act:lista;
 begin
      new(nue);
      nue^.dato:=p;
      act:=L;
      ant:=L;
      While (act<>nil)and(act^.dato.impu<p.impu)do begin
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
   p:consumo;
   i:integer;
begin
     randomize;
     i:=random (2)+1;
     Leer(p);
     InsertarOrdenado(v[i],p);
end;
procedure ImprimirLista(l:lista);
begin
     while(l<>nil)do begin
            writeln('el impuesto es: ',l^.dato.impu,' y su monto es: ',l^.dato.gastop);
            l:=l^.sig;
            READLN;
     end;
end;


Procedure ImprimirVector(v:vector);
var i:integer;
begin
     for i:= 1 to 2 do begin
        if(i=1)then
            writeln('los gastos de moni son: ')
        else
            writeln('los gastos de pepe son: ');
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
    min:CADENA;
    i,pos:integer;
begin
    min:='zzzzzzzz';

    for i:=1 to Dimf do begin
        if (v[i]<>NIl)then
             if(v[i]^.dato.impu<min)then begin
                    min:=v[i]^.dato.impu;
                    pos:=i;
                    E:=v[i];
             end;

    end;
    if(min<>'zzzzzzzz')then
        Borrar(v[pos])
    else
        E:=nil;

end;

procedure Merge(var v:vector; var l:lista);
var
    E,aux:lista;
    GastoTot: integer;
begin
    buscarmin(v,E);
    while(E<>nil) do begin
        aux:=e;
        GastoTot:=0;
        while(E<>NIl) and(E^.dato.Impu=aux^.dato.impu) do begin
            gastotot:=gastotot+E^.dato.gastop;
            buscarmin(v,E);
        end;
        aux^.dato.gastop:=gastotot;
        aux^.sig:=nil;
        agregaratras(l,aux);

    end;
end;
Var
   v:vector;
   l:lista;
   i:integer;
Begin    {programa principal}
   l:=nil;
   for i:=1 to 10 do
       CargarVector(v);
   ImprimirVector(v);
   writeln;
   Merge(v,l);
   writeln;
   writeln('Lista final.');
   imprimirlista(l);
   readln;
   readln;
End.

