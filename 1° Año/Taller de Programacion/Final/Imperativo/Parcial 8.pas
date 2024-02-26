program EjerRemis;
type
    cadena = string[50];
    remis= record
           cod_destino: cadena;
           fecha: cadena;
           cod_remis: cadena;
           costo_viaje: real;
          end;
    arbol=^nodo;
    nodo= record
               dato: cadena;
               cant_viajes: integer;
               HD: arbol;
               HI: arbol;
           end;

{-----------------------------------------------------------------------------}

procedure leer(var r:remis);
begin
      writeln('Ingrese el codigo de la localidad de destino');
      readln(r.cod_destino);
      if(r.cod_destino <> 'zzz')then begin
          writeln('Ingrese el codigo del remis');
          readln(r.cod_remis);
          writeln('Ingrese la fecha del viaje');
          readln(r.fecha);
          writeln('Ingrese el costo del viaje');
          readln(r.costo_viaje);
      end;
end;

procedure InsertarABB(var a:arbol; dato: cadena);
var
   aux:arbol;
begin
   if(a=nil) then begin
        new(aux);
        aux^.dato:= dato;
        aux^.HI:=nil;
        aux^.HD:= nil;
        aux^.cant_viajes:= 1;
        a:= aux;
   end
   else
       if(a^.dato > dato)then
            InsertarABB(a^.HI,dato)
       else
           if(a^.dato < dato)then
               InsertarABB(a^.HD,dato)
           else
               aux^.cant_viajes:= aux^.cant_viajes + 1;
end;

procedure cargarArbol(var a: arbol);
var
   r:remis;
begin
   leer(r);
   while(r.cod_destino <> 'zzz') do begin
       InsertarABB(a,r.cod_destino);
       leer(r);
   end;
end;

{-----------------------------------------------------------------------------}

function buscarViajes(a:arbol; codigo: cadena): integer;
begin
     if(a=nil) then
          buscarViajes:= -1
     else
          if(codigo = a^.dato) then
                buscarViajes:= a^.cant_viajes
          else
                if(codigo < a^.dato) then
                          buscarViajes(a^.HI,codigo)
                else
                          buscarViajes(a^.HD,codigo);
end;

{-----------------------------------------------------------------------------}

procedure RecorridoAcotado(a: arbol; codigo:cadena);
begin
     if(a<> nil) then begin
           if(dato < a^.dato) then begin
                  writeln('Los viajes realizados al codigo de destino', a^.dato, ' ', 'son: ',a^.cant_viajes);
                  RecorridoAcotado(a^.HI,dato);
                  RecorridoAcotado(a^.HD,dato);
            end;
     end;
end;

{-----------------------------------------------------------------------------}

var
   a: arbol;
   codigo: cadena;
begin
   a:= nil;
   cargarArbol(a);
   writeln('Ingrese el codigo a buscar');
   readln(codigo);
   writeln('La cantidad de viajes realizados del codigo ingresado es: ', buscarViajes(a,codigo));
   writeln('Ingrese otro codigo');
   RecorridoAcotado(a,codigo);
   readln;
end.

