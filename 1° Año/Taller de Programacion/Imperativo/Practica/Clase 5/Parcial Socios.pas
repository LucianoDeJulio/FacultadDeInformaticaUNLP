{Se desea procesar información de los pagos realizados en distintas actividades
por los socios de un club. De cada pago se conoce número de pago, código de
actividad, categoría de actividad, número de socio y valor.

Se pide implementar un programa que a partir del ingreso de la información
de las actividades:

A.	Genere una estructura con la información de los pagos por actividad del
club. Para cada actividad deben almacenarse el código de actividad, categoría y
los pagos efectuados por los socios, ordenados por número de socio. La
estructura de actividades deben ser eficientes para la búsqueda por el código
de actividad.

B.	Ingrese dos códigos de actividad y genere una única estructura (a partir de
los pagos efectuados por los socios a ambas actividades) ordenada por socio que
guarde número de socio y total pagado para dichas actividades.

C.	A partir de la estructura generada en A, informe la cantidad total de
actividades de la categoría 10.

D.	A partir de la estructura generada en A, informe la cantidad de actividades
cuyo código está entre dos valores que se ingresan.}



program Parcial1;
const
     dimf=2;
type
     actividad=record
                     Codigo: integer;
                     Categoria: integer;
               end;

     socio= record
                   NumP: integer;
                   NumS: integer;
                   Valor: integer;
             end;

     Lista=^nodo;
     nodo= record
                 datos:Socio;
                 sig: lista;
           end;

     Arbol=^nodoo;
     nodoo= record
                  datos: actividad;
                  Pago: lista;
                  HI: arbol;
                  HD: arbol;
            end;
     Vector= array [1..dimf] of lista;

procedure leer (var ac: actividad; var s: socio);
begin
     writeln('Ingrese el codigo de la actividad');
     readln(ac.Codigo);
     if (ac.codigo<> 0) then begin
         writeln('ingrese La categoria de la actividad');
         readln(ac.Categoria);
         writeln('ingrese el numero de pago');
         readln(s.NumP);
         writeln('ingrese el numero de socio');
         readln(s.Nums);
         writeln('ingrese el valor');
         readln(s.valor);
     end;
end;

Procedure InsertarElemento ( var pri: lista; s: socio);
var ant, nue, act: lista;
begin
  new (nue);
  nue^.datos:= s;
  act := pri;
  ant := pri;

  while (act<>NIL) and (act^.datos.NumS < S.Nums) do begin
      ant := act;
      act := act^.sig ;
  end;
  if (ant = act)  then pri := nue
                  else  ant^.sig  := nue;
  nue^.sig := act ;
end;

procedure InsertarABB(var a:arbol; ac:actividad; s:socio);
var
  aux:arbol;
begin
  if(a=nil)then begin
    new(aux);
    aux^.datos:= ac;
    aux^.HI:=nil;
    aux^.HD:=nil;
    aux^.Pago:=nil;
    InsertarElemento (aux^.Pago,s);
    a:=aux;
  end
  else
    if(a^.datos.Codigo>ac.codigo)then
      InsertarABB(a^.HI,ac,s)
    else
      if(a^.datos.Codigo<ac.Codigo)then
        InsertarABB(a^.HD,ac,s)
        else
          InsertarElemento (a^.Pago,s);
end;

procedure CargarArbol(var a:arbol);
var
  ac:Actividad;
  s:Socio;
begin
    Leer(ac,s);
    while (ac.Codigo<>0) do begin
    insertarABB(a,ac,s);
    Leer(ac,s);
 end;
end;



procedure Buscar (a:arbol; var p:lista;dato: integer);
begin
     if(a=nil) then
                p:=nil
     else
         if(dato=a^.datos.Codigo)then
            p:=a^.pago
         else
             if(dato<a^.datos.codigo)then
                  Buscar(a^.HI,p,dato)
             else
                  Buscar(a^.HD,p,dato);
end;

procedure CrearVector(var v:vector; a:arbol);
var
    p:lista;
    Cod1,i:integer;
begin
    for i:=1 to dimf do begin
        writeln('ingrese un codigo de la actividad');
        readln(Cod1);
        Buscar(a,p,Cod1);
        while(p=nil) do begin
            writeln('no se encontro el anio e ingrese nuevo anio');
            readln(Cod1);
        end;
        v[i]:=p;
    end;
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
    min:=999999;

    for i:=1 to Dimf do begin
        if (v[i]<>NIl)then
             if(v[i]^.datos.Nums<min)then begin
                    min:=v[i]^.datos.NumS;
                    pos:=i;
                    E:=v[i];
             end;

    end;
    if(min<>999999)then
        Borrar(v[pos])
    else
        E:=nil;

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

procedure Merge(var v:vector; var l1:lista);
var
    E,aux:lista;
    GastoTot: integer;
begin
    buscarmin(v,E);
    while(E<>nil) do begin
        aux:=e;
        GastoTot:=0;
        while(E<>NIl) and(E^.datos.NumS=aux^.datos.NumS) do begin
            gastotot:=gastotot+E^.datos.Valor;
            buscarmin(v,E);
        end;
        aux^.datos.Valor:=gastotot;
        aux^.sig:=nil;
        agregaratras(l1,aux);

    end;
end;

Procedure recorrido ( pri : lista);

Begin
 while (pri <> NIL) do begin
   writeln('Numero de socio: ',pri^.datos.NumS,' monto total: $', pri^.datos.Valor);
   pri:= pri^.sig ;
 end;
end;

Procedure recorrido1 ( pri : lista; a:arbol);

Begin
 writeln('Codigo de Actividad: ',a^.datos.Codigo,' Categoria: ',a^.datos.Categoria);
 recorrido(pri);
end;

procedure EnOrden(a:arbol);
begin
 if(a<>nil) then begin
    EnOrden(a^.HI);
    recorrido1(a^.Pago, a);
    EnOrden(a^.HD);
 end;
end;

procedure RecorridoAcotadoPre(a:arbol; var contador:integer);
begin
  if(a<>nil)then begin
    if(a^.datos.Categoria=10)then
        contador:=contador+1;
    RecorridoAcotadoPre(a^.HI,contador);
    RecorridoAcotadoPre(a^.HD,contador);
  end;
end;

procedure RecorridoAcotado(a:arbol; inf,sup:integer; var contador:integer);
begin
  if(a<>nil)then begin
    if(a^.datos.Codigo>=inf)then
      if( a^.datos.Codigo<=sup)then begin
        contador:=contador+1;
        RecorridoAcotado(a^.HI,inf,sup,contador);
        RecorridoAcotado(a^.HD,inf,sup,contador);
      end
      else
        RecorridoAcotado(a^.HI,inf,sup,contador)
    else
      RecorridoAcotado(a^.HD,inf,sup,contador);
  end;
end;

var
  a:arbol;
  v:vector;
  contador,inf,sup:integer;
  l1:lista;
begin
     CargarArbol(a);
     CrearVector(v,a);
     writeln('Se imprime el Arbol Generado: ');
     EnOrden(a);
     writeln;
     Merge(v,l1);
     writeln('Lista generada por el Merge.');
     recorrido (l1);
     contador:=0;
     RecorridoAcotadoPre(a,contador);
     Writeln('La cantidad de actividades con categoria 10 es: ',contador);
     writeln('ingrese el primer codigo');
     readln(inf);
     writeln('ingrese el otro codigo');
     readln(sup);
     contador:=0;
     RecorridoAcotado(a,inf,sup,contador);
     Writeln('La cantidad de actividades entre la actividad ',inf,' y la ',sup,' es ',contador);
     readln;
end.
