program EjerEncomiendas;
type
    cadena = string[50];
    encomiendas = record
                  emisor: cadena;
                  receptor: cadena;
                  direccion: cadena;
                  destino: cadena;
                  peso: integer;
                  descripcion: cadena;
                 end;

    arbol = ^nodo;
    nodo = record
                 dato: encomiendas;
                 HD: arbol;
                 HI: arbol;
            end;

{----------------------------------------------------------------------------}

procedure leer (var e: encomiendas);
begin
     writeln('Ingrese el nombre del emisor');
     readln(e.emisor);
     if(e.emisor <> 'zzz') then begin
         writeln('Ingrese el nombre del receptor');
         readln(e.receptor);
         writeln('Ingrese la localidad de destino');
         readln(e.destino);
         writeln('Ingrese la direccion del envio');
         readln(e.direccion);
         writeln('Ingrese el peso del paquete');
         readln(e.peso);
         writeln('Ingrese la descripcion del paquete');
         readln(e.descripcion);
     end;
end;

procedure InsertarABB(var a:arbol; e:encomiendas);
var
   aux: arbol;
begin
   if(a <> nil) then begin
        new(aux);
        aux^.dato := e;
        aux^.HD := nil;
        aux^.HI := nil;
   end
   else
       if(a^.dato.destino >= e.destino) then
            InsertarABB(a^.HI,e)
       else
           InsertarABB(a^.HD,e);
end;

procedure CargarArbol(var a:arbol);
var
   e: encomiendas;
begin
   leer(e);
   while(e.emisor <> 'zzz') do begin
      InsertarABB(a,e);
      leer(e);
   end;
end;


{---------------------------------------------------------------------------}

procedure Recorrido(a:arbol; localidad:cadena);
var
   cant:integer;
begin
   cant:= 0;
   if(a <> nil) then begin
        if(a^.dato.destino = localidad) then
              cant:= cant + 1;
        Recorrido(a^.HI,localidad);
        Recorrido(a^.HD,localidad);
   end;
   writeln('La cantidad de paquetes enviados a la localidad  ', localidad, ' son:  ', cant);
end;

{-----------------------------------------------------------------------------}

procedure RecorridoContador(a: arbol; desc,nom: cadena);
var
   cantidad: integer;
begin
   cantidad := 0;
   if(a <> nil) then begin
        if(a^.dato.descripcion = desc) and (a^.dato.emisor = nom) then
               cantidad:= cantidad + 1;
        RecorridoContador(a^.HI,desc,nom);
        RecorridoContador(a^.HD,desc,nom);
   end;
   writeln('La cantidad de paquetes con descripcion  ', desc, ' y nombre de emisor ', nom , 'son: ', cantidad);
end;

{---------------------------------------------------------------------------}

var
   a:arbol;
   desc,nom,localidad: cadena;
begin
   a := nil;
   desc := 'acuso de recibo';
   nom :=  'unlp';
   CargarArbol(a);
   writeln('Ingrese la localidad de destino');
   readln(localidad);
   Recorrido(a,localidad);
   RecorridoContador(a,desc,nom);
   readln;
end.
