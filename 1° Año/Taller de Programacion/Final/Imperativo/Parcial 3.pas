program parcial3;
type

    lista=^nodo;
    nodo= record
                dato: integer;
                sig: lista;
           end;

    pizza= record
                 cod_cliente:integer;
                 monto: integer;
            end;

    arbol =^nodo1;
    nodo1 = record
                  datos: pizza;
                  codP: Lista;
                  HI: arbol;
                  HD: arbol;
             end;

procedure leer(var p:pizza;var codP: integer);
begin
     writeln('Ingrese el monto');
     readln(p.monto);
     if(p.monto <> 0) then begin
           writeln('Ingrese el codigo del cliente');
           readln(p.cod_cliente);
           writeln('Ingrese el codigo de la pizza');
           readln (codP);
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
    aux^.datos.cod_cliente:=p.cod_cliente;
    aux^.datos.monto:=p.monto;
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
    if(a^.datos.cod_cliente>p.cod_cliente)then
      InsertarABB(a^.HI,p,CoP)
    else
      if(a^.datos.cod_cliente<p.cod_cliente)then
        InsertarABB(a^.HD, p,CoP)
        else begin
          a^.datos.monto:=a^.datos.monto+ p.monto;
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
    if(a^.datos.monto>=inf)then begin
      if( a^.datos.monto<=sup)then
        contador:=contador+1;
      RecorridoAcotadoCon(a^.HI,inf,sup, contador);
      RecorridoAcotadoCon(a^.HD,inf,sup, contador);
    end;

  end;
end;

Procedure ImprimirL (L:lista);
Begin
     while(L<>nil)do begin
                     writeln('El codigo de pizza es:',l^.dato);
                     l:=l^.sig;
     end;
end;

procedure RecorridoAcotado(a:arbol; inf1,sup1:integer);
begin
  if(a<>nil)then begin
    if(a^.datos.cod_cliente>=inf1)then
      if( a^.datos.cod_cliente<=sup1)then begin
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
   writeln('ingrese un monto inferior');
   readln(inf);
   writeln('ingrese un monto superior');
   readln(sup);
   RecorridoAcotadoCon(a,inf,sup,contador);
   writeln('la cantidad de clientes con un total abonado entre $600 y $1100 son: ', contador);
   writeln('ingrese un codigo de cliente inferior');
   readln(inf1);
   writeln('ingrese otro codigo de cliente superior');
   readln(sup1);
   RecorridoAcotado(a,inf1,sup1);
   writeln('Presione enter para terminar');
   readln;
end.
