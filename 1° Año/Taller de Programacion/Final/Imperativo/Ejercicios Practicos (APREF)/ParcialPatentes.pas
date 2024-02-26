program EjerAubasa;
const
     dimF= 7;
type
    rango= 1..dimF;
    cadena = string[50];
    vehiculo = record
              patente: cadena;
              importe: real;
              hora: integer;
              dia: rango;
              pasada: integer;
            end;
    lista = ^nodo;
    nodo = record
           dato: vehiculo;
           sig: lista;
           end;
    vector = array [rango] of lista;
{-----------------------------------------------------------------------------}
procedure  leer(var vh:vehiculo);
begin
     writeln('ingrese la patente');
     readln(vh.patente);
     if(vh.patente <> 'zzz') then begin
         writeln('ingrese el importe que pagó');
         readln(vh.importe);
         writeln('ingrese la hora de pasada');
         readln(vh.hora);
         writeln('ingrese el dia de pasada');
         readln(vh.dia);
         vh.pasada:=1;
     end;
end;

procedure InsertarOrdenado(var l:lista; vh:vehiculo);
var
   nue,act,ant:lista;
begin
   new(nue);
   nue^.dato:= vh;
   act:= l;
   ant:= l;
   while (act <> nil) and (act^.dato.patente < vh.patente) do begin
         ant:= act;
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
   vh:vehiculo;
begin
   leer(vh);
   while(vh.patente <> 'zzz') do begin
        InsertarOrdenado(v[vh.dia],vh);
        leer(vh);
   end;
end;

procedure ImprimirLista(l:lista);
begin
     while(l <> nil) do begin
             writeln('La patente es: ', l^.dato.patente);
             writeln('El importe pagado es: ', l^.dato.importe);
             writeln('La hora de pasada es: ', l^.dato.hora);
     end;
end;

procedure ImprimirVector(v:vector);
var
   i:integer;
begin
   for i:= 1 to dimF do begin
       writeln('Se imprime la lista de vehiculos del dia', i);
       ImprimirLista (v[i]);
   end;
end;

{------------------------------------------------------------------------------}

procedure agregarAtras(var l:lista; n:lista);
var
   nue,act:lista;
begin
   act:= l;
   nue:= n;
   nue^.sig:= nil;
   if(l<>nil) then begin
       act:=l;
       while(act^.sig <> nil) do
            act:= act^.sig;
       act^.sig:= nue;
   end
   else
       l:= nue;
end;

procedure borrar(var l:lista);
begin
     l:= l^.sig;
end;

procedure buscarMax(var v:vector; var e:lista);
var
   max: cadena;
   i,pos: integer;
begin
   max:= 'aaaaaaaaaa';
   for i:= 1 to dimF do begin
      if(v[i] <> nil) then
              if(v[i]^.dato.patente > max) then begin
                      max:= v[i]^.dato.patente;
                      pos:=i;
                      e:= v[i];
              end;
   end;
   if(max <> 'aaaaaaaaaa')then
          borrar(v[pos])
   else
          e:= nil;
end;

procedure merge(var v:vector; var l:lista);
var
   e,aux:lista;
   importeTotal: real;
   totalPasadas:integer;
begin
   buscarMax(v,e);
   while(e <> nil) do begin
      aux:=e;
      importeTotal:= 0;
      totalPasadas:= 0;
      while(e <> nil) and (e^.dato.patente = aux^.dato.patente) do begin
              importeTotal:= importeTotal + e^.dato.importe;
              totalPasadas:= totalPasadas + e^.dato.pasada;
              buscarMax (v,e);
      end;
      aux^.dato.importe:= importeTotal;
      aux^.dato.pasada:= totalPasadas;
      agregarAtras(l,aux);
  end;
end;

procedure imprimirListaM (l:lista);
begin
     while(l<> nil) do begin
          writeln('La patente es: ', l^.dato.patente);
          writeln('El importe total es: ', l^.dato.importe);
          writeln('La pasada total es: ',  l^.dato.pasada);
     end;
end;

{-----------------------------------------------------------------------------}

procedure buscarMaximo (l:lista; max: real; patenteMax: cadena);
begin
     if(l<> nil) then begin
            if(l^.dato.importe > max) then begin
                 max:= l^.dato.importe;
                 patenteMax:= l^.dato.patente;
            end;
            buscarMaximo(l^.sig,max,patenteMax);
     end;
end;

{-----------------------------------------------------------------------------}
var
   v:vector;
   l:lista;
   patenteMax: cadena;
   max: real;
begin
     l:= nil;
     max:= -1.0;
     patenteMax:= 'aaaaa';
     cargarVector(v);
     writeln('se imprime el vector creado');
     ImprimirVector(v);
     writeln('se realiza un merge');
     merge(v,l);
     writeln('se imprime la nueva lista');
     imprimirListaM(l);
     buscarMaximo(l,max,patenteMax);
     writeln('La patente que mas pago durante todo el mes es: ', patenteMax);
     readln;
end.
