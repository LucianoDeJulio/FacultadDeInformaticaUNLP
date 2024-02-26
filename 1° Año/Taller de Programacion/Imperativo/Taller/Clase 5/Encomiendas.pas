{Actividad 4: El ProgramaEncomiendas genera una lista con encomiendas. Cada
encomienda tiene codigo y peso. Puede existir encomiendas de igual peso. Realice
las siguientes actividades.

a) A partir de la lista, generar un arbol donde para cada peso se tengan todos
los codigos de encomienda registrados con ese peso. El arbol debe estar ordenado
por peso.

b) Imprimir para cada peso, los codigos de encomiendas registrados para dicho peso.}


Program encomiendas;
Type

   encomienda = record
                  codigo: integer;
                  peso: integer;
                end;

  // Lista de encomiendas
  lista = ^nodoL;
  nodoL = record
    dato: encomienda;
    sig: lista;
  end;
  lista1=^nodo1;
  nodo1=record
            cod:integer;
            sig:lista1;
        end;
  arbol=^nodo;
  nodo=record
            dato:integer;
            HI:arbol;
            HD:arbol;
            Cods:Lista1;
        end;

{-----------------------------------------------------------------------------
AgregarAdelante - Agrega una encomienda adelante en l}
procedure agregarAdelante(var l: Lista; enc: encomienda);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := enc;
  aux^.sig := l;
  l:= aux;
end;


{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con datos de las encomiendas }
procedure crearLista(var l: Lista);
var
  e: encomienda;
  i: integer;
begin
 l:= nil;
 for i:= 1 to 20 do begin
   e.codigo := i;
   e.peso:= random (10);
   while (e.peso = 0) do e.peso:= random (10);
   agregarAdelante(L, e);
 End;
end;

procedure agregarAdelanteCod(var l: Lista1; cod: integer);
var
  aux: lista1;
begin
  new(aux);
  aux^.cod := cod;
  aux^.sig := l;
  l:= aux;
end;



{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   writeln('Codigo: ', l^.dato.codigo, '  Peso: ', l^.dato.peso);
   l:= l^.sig;
 End;
end;

procedure InsertarABB(var a:arbol; dato:encomienda);
var
  aux:arbol;
begin
  if(a=nil)then begin
    new(aux);
    aux^.dato:=dato.peso;
    aux^.HI:=nil;
    aux^.HD:=nil;
    aux^.Cods:=nil;
    AgregarAdelanteCod(aux^.cods,dato.codigo);
    a:=aux;
  end
  else
    if(a^.dato>dato.peso)then
      InsertarABB(a^.HI, dato)
    else
      if(a^.dato<dato.peso)then
        InsertarABB(a^.HD, dato)
        else
          AgregarAdelanteCod(a^.cods,dato.codigo);
end;

procedure CargarArbol(var a:arbol;l:lista);
begin
    while (l<>nil) do begin
    insertarABB(a,l^.dato);
    l:=l^.sig;
 end;
end;

procedure imprimirCod(l:lista1);
begin
  while(l<>nil)do begin
    writeln('.Codigo: ',l^.cod);
    l:=l^.sig;
  end;
end;

procedure EnOrden(a:arbol);
begin
 if(a<>nil) then begin
    EnOrden(a^.HI);
    writeln('Peso: ',a^.dato);
    imprimirCod(a^.cods);
    EnOrden(a^.HD);
 end;
end;

Var

 l: lista;
 a:arbol;


begin
 L:=nil;
 Randomize;
 crearLista(l);
 writeln ('Lista de encomiendas generada: ');
 imprimirLista(l);
 CargarArbol(a,l);
 writeln('Aca se imprime el arbol en orden');
 readln;
 EnOrden(a);
 readln;
end.
