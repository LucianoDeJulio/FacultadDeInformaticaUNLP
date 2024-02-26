program EjerEncomiendas;
type
    cadena = string [50];

    encomienda = record
               emisor: cadena;
               receptor: cadena;
               direccion: cadena;
               peso: integer;
               descripcion: cadena;
               end;

    arbol =^ nodo;
    nodo = record
                dato: encomienda;
                HD: arbol;
                HI: arbol;
           end;

{--------------------------------------------------------------------------}

procedure leer(var e: encomienda);
begin
     writeln('Ingrese el nombre del emisor');
     readln(e.emisor);
     if(e.emisor <> 'zzz') then begin
          writeln('Ingrese el nombre del receptor');
          readln(e.receptor);
          writeln('Ingrese la direccion');
          readln(e.direccion);
          writeln('Ingrese el peso del paquete');
          readln(e.peso);
          writeln('Ingrese la descripcion del paquete');
          readln(e.descripcion);
     end;
end;

procedure InsertarABB(var a: arbol; e: encomienda);
var
   aux: arbol;
begin
     if(a = nil) then begin
          new(aux);
          aux^.dato:= e;
          aux^.HD:= nil;
          aux^.HI:= nil;
          a:=aux;
     end
     else
         if(a^.dato.peso >= e.peso) then
               InsertarABB(a^.HI,e)
         else
               InsertarABB(a^.HD,e);
end;

procedure CargarArbol(var a:arbol);
var
   e:encomienda;
begin
   leer(e);
   while(e.emisor <> 'zzz')do begin
       InsertarABB(a,e);
       leer(e);
   end;
end;

{-----------------------------------------------------------------------------}

procedure RecorridoAcotado(a:arbol;inf,sup:integer);
var
   cantidad: integer;
begin
     cantidad := 0;
     if(a <> nil) then begin
          if(a^.dato.peso >= inf) then
                if(a^.dato.peso <= sup) then begin
                      cantidad := cantidad + 1;
                      RecorridoAcotado(a^.HI,inf,sup);
                      RecorridoAcotado(a^.HD,inf,sup);
                end
                else
                      RecorridoAcotado(a^.HI,inf,sup)
         else
               RecorridoAcotado(a^.HD,inf,sup);
     end;
     writeln('La cantidad de encomiendas con peso entre', ' ', inf, ' y ', ' ', sup, ' son: ', cantidad);
end;

{-----------------------------------------------------------------------------}

procedure RecorridoEnOrden(a:arbol);
var
   cant: integer;
begin
   cant:= 0;
   if(a <> nil) then begin
        RecorridoEnOrden(a^.HI);
        if(a^.dato.descripcion == 'fragil') then
              cant:= cant + 1;
        RecorrdidoEnOrden(a^.HD);
   end;
   writeln('La cantidad de paquetes fragiles son: ', cant);
end;

{-----------------------------------------------------------------------------}

var
   a:arbol;
   inf,sup: integer;
begin
   a:= nil;
   inf:= 16;
   sup:= 28;
   CargarArbol(a);
   RecorridoAcotado(a,inf,sup);
   RecorridoEnOrden(a);
   readln;
end.


