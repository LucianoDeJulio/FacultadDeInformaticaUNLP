program  final;
const
   dimF = 15;
type

   cadena = String [50];
   rango = 1.. dimF;
   comercio = record
              cod_comercio : integer;
              cod_rubro: rango;
              responsable_inscripto: cadena;
              cod_loc: integer;
             end;

   comercio1 = record
              cod_com : integer;
              cod_rubro: rango;
              responsable_ins: cadena;
              codLoc: integer;
              cant_comercio: integer;
             end;

   lista= ^nodo;
   nodo = record
                dato: comercio;
                sig: lista;
           end;


   lista1= ^nodo1;
   nodo1  = record
                  dato:comercio1;
                  sig:lista1;
            end;

   vector = array [rango] of lista;



procedure leerComercio(var c: comercio);
begin
   randomize;
   writeln('Ingrese el codigo de comercio');
   readln(c.cod_comercio);
   if(c.cod_comercio <> 0)then begin
        writeln('Ingrese el codigo del rubro');
        c.cod_rubro:= random(15)+1;
        writeln('Ingrese el nombre del responsable inscripto');
        readln(c.responsable_inscripto);
        writeln('Ingrese el codigo de localidad');
        readln(c.cod_loc);
   end;
end;

procedure insertarOrdenado(var l:lista; c:comercio);
var
   ant,act,nue: lista;
begin
   new(nue);
   nue^.dato := c;
   act:= l;
   ant:= l;
   while(act <> nil) and (act^.dato.cod_loc < c.cod_loc) do begin
        ant:= act;
        act:= act^.sig;
   end;
   if(ant = act) then
          l:= nue
   else
          ant^.sig:= nue;
   nue^.sig:= act;
end;

procedure cargarVector(var v:vector);
var
   c:comercio;
   i:integer;
begin
   leerComercio(c);
   while(c.cod_comercio <> 0) do begin
       i:= c.cod_rubro;
       insertarOrdenado(v[i],c);
       leerComercio(c);
   end;
end;

procedure imprimirLista(l:lista);
begin
     while(l<>nil)do begin
         writeln('el codigo del comercio es: ', l^.dato.cod_comercio);
         writeln('el responsable inscripto es: ', l^.dato.responsable_inscripto);
         writeln('el codigo de la localidad es: ', l^.dato.cod_loc);
         writeln('-----------------------------');
         l:=l^.sig;

     end;
end;

procedure imprimirVector(v:vector);
var i:integer;
begin
     for i:= 1 to 15 do begin
       writeln('se imprime la lista: ', i);
       writeln('-----------------------------');
       imprimirLista(v[i]);
     end;
end;

procedure agregarAtras(var l:lista1; n: lista1);
var
   nue,act:lista1;
begin
   act:= l;
   nue:= n;
   nue^.sig:= nil;
   if(l <> nil) then begin
        act:= l;
        while(act^.sig <> nil)do
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

procedure buscarMin(var v:vector; var e:lista);
var
   min,i,pos:integer;
begin
   min:= 999;
   for i:= 1 to 15 do begin
       if(v[i] <> nil) then
           if(v[i]^.dato.cod_loc < min) then begin
                 min:= v[i]^.dato.cod_loc;
                 pos:= i;
                 e:= v[i];
           end;
   end;
   if(min <> 999) then
      borrar(v[pos])
   else
      e:= nil;
end;

procedure mergeAcumulador(var v:vector; var l:lista1);
var
   e:lista;
   aux:lista1;
   cant_comercio: integer;
begin
     buscarmin(v,e);
     while(e<>nil) do begin
         aux^.dato.cod_com:=e^.dato.cod_comercio;
         aux^.dato.responsable_ins:= e^.dato.responsable_inscripto;
         aux^.dato.codLoc:=e^.dato.cod_loc;
         cant_comercio:=0;
         while(e<>NIl) and(e^.dato.cod_loc=aux^.dato.codLoc) do begin
                cant_comercio:= cant_comercio+1;
                buscarmin(v,E);
         end;
         aux^.dato.cant_comercio:= cant_comercio;
         aux^.sig:=nil;
         agregaratras(l,aux);
         end;
end;

procedure imprimirListaMerge(l:lista1);
begin
     while(l<>nil)do begin
         writeln('el codigo del comercio es: ', l^.dato.cod_com);
         writeln('el responsable inscripto es: ', l^.dato.responsable_ins);
         writeln('el codigo de la localidad es: ', l^.dato.codLoc);
         writeln('la cantidad de comercio con la misma localidad es: ', l^.dato.cant_comercio);
         writeln('-----------------------------');
         l:=l^.sig;

     end;
end;

procedure locMax(l:lista1; var codMax: integer; var max: integer);
var
   max: integer;
begin
   if(l <>nil) then begin
           if(l^.dato.cant_comercio > max) then begin
                  max:= l^.dato.cant_comercio;
                  codMax:= l^.dato.codLoc;
           end;
           locMax(l^.sig; codMax);
   end;
end;


var
   v:vector;
   l:lista1;
   codMax, max: integer;
begin
   l:= nil;
   codMax:= 0;
   max:= 0;
   cargarVector(v);
   imprimirVector(v);
   readln;
   writeln('Se realiza un merge acumulando los comercios que tienen mismo codigo de localidad');
   readln;
   mergeAcumulador(v,l);
   imprimirListaMerge(l);
   locMax(l, codMax);
   readln;
   readln;

end.
