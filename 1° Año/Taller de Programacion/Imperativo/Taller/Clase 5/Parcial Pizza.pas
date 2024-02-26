{Una pizzer�a tiene la informaci�n de las ventas telef�nicas realizadas a sus
clientes. De cada venta se conoce: c�digo de cliente, c�digo de pizza solicitada
y monto a abonar por la pizza.

A.	Lea informaci�n de las ventas hasta ingresar una con monto 0. A partir de
esto, genere una estructura que almacene para cada c�digo de cliente el total
abonado por �ste entre todas las ventas y los c�digos de todas las pizzas
solicitadas por �l (sin repetici�n). La estructura debe estar ordenada por
c�digo de cliente y ser eficiente para la b�squeda por dicho criterio.

A partir de la estructura generada en A realice m�dulos independientes para:

B.	Informar la cantidad de clientes con un total abonado entre $600 y $1100.

C.	Informar los c�digos de pizza solicitados por los clientes cuyo c�digo est�
entre 170 y 300. }



program parcial3;
type
    lista=^nodo;
    nodo= record
               dato:integer;
               Sig:lista;
          end;

    pizza= record

                 Monto: integer;
                 CodC: integer;
                 end;



    arbol= ^nodoA;
    nodoA = Record
            dato:pizza;
            codP:lista;
            HI: arbol;
            HD: arbol;
          End;

procedure leer(var p:pizza; var CoP:integer);
begin

    writeln('ingrese el monto');
    readln(p.monto);
    if(p.monto<>0)then begin
        writeln('ingrese el codigo del cliente');
        readln(p.CodC);
        writeln('ingrese el codigo de la pizza');
        readln(CoP);

     end;
end;

procedure Buscar(l:lista; var ok:boolean; CoP:integer);
begin
  if(l<>nil)and(ok<>true)then begin
    if(l^.dato=CoP)then
      ok:=true;
    Buscar(l^.sig,ok,CoP);
  end;
end;

Procedure AgregarAdelante(var L :lista; CoP:integer);
var Nue:lista;
begin
     new(nue);
     nue^.dato:=CoP;
     nue^.sig:=L;
     L:=nue;
end;


procedure InsertarABB(var a:arbol; p:pizza; CoP:integer);
var
  aux:arbol;
  ok:boolean;
begin
  if(a=nil)then begin
    new(aux);
    aux^.dato.CodC:=p.CodC;
    aux^.dato.monto:=p.monto;
    aux^.HI:=nil;
    aux^.HD:=nil;
    aux^.CodP:=nil;
    ok:= false;
    Buscar(aux^.CodP,ok,CoP);
    if(ok=false) then
                 AgregarAdelante(aux^.CodP, CoP);
    a:=aux;
  end
  else
    if(a^.dato.CodC>p.CodC)then
      InsertarABB(a^.HI,p,CoP)
    else
      if(a^.dato.CodC<p.CodC)then
        InsertarABB(a^.HD, p,CoP)
        else begin
          a^.dato.monto:=a^.dato.monto+ p.monto;
          Buscar(a^.CodP,ok,CoP);
          if(ok=false) then
              AgregarAdelante(a^.CodP, CoP);
        end;
end;

procedure CargarArbol(var a:arbol);
var
    p:pizza;
    Cop:integer;
begin
    leer(p,CoP);
    while (p.monto<>0) do begin
      insertarABB(a,p,CoP);
      leer(p,CoP);
    end;
end;

procedure RecorridoAcotadoCon(a:arbol; inf,sup:integer; var contador: integer);
begin
  if(a<>nil)then begin
    if(a^.dato.monto>=inf)then begin
      if( a^.dato.monto<=sup)then
        contador:=contador+1;
      RecorridoAcotadoCon(a^.HI,inf,sup, contador);
      RecorridoAcotadoCon(a^.HD,inf,sup, contador);
    end;

  end;
end;

Procedure ImprimirL (L:lista);
Begin
     while(L<>nil)do begin
                     writeln(l^.dato);
                     l:=l^.sig;
     end;
end;

procedure RecorridoAcotado(a:arbol; inf1,sup1:integer);
begin
  if(a<>nil)then begin
    if(a^.dato.CodC>=inf1)then
      if( a^.dato.CodC<=sup1)then begin
        imprimirL(a^.CodP);
        RecorridoAcotado(a^.HI,inf1,sup1);
        RecorridoAcotado(a^.HD,inf1,sup1);
      end
      else
        RecorridoAcotado(a^.HI,inf1,sup1)
    else
      RecorridoAcotado(a^.HD,inf1,sup1);
  end;
end;

var
   a:arbol;
   contador,inf,sup,inf1,sup1:integer;
begin
   a:=nil;
   contador:=0;
   CargarArbol(a);
   writeln('ingrese un monto');
   readln(inf);
   writeln('ingrese otro monto');
   readln(sup);
   RecorridoAcotadoCon(a,inf,sup,contador);
   writeln('la cantidad de clientes con un total abonado entre $600 y $1100 son: ', contador);
   writeln('ingrese un codigo');
   readln(inf1);
   writeln('ingrese otro codigo');
   readln(sup1);
   RecorridoAcotado(a,inf1,sup1);
   readln;
end.
