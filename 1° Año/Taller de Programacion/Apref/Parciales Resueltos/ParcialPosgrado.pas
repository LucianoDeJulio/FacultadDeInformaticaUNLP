program EjerCarreras;
const
     dimF= 10;
type
     rango1 = 1..dimF;
     cadena= string [50];
     alumno = record
                    cod_alumno: integer;
                    cod_curso:  rango1;
                    apellido: cadena;
                    nota_final: real;
              end;

     lista =^nodo;
     nodo = record
                  dato: alumno;
                  sig:lista;
             end;

     vector = array[rango1] of lista;
{------------------------------------------------------------------------------}
procedure leer(var a: alumno);
begin
     writeln('ingrese el codigo del curso');
     readln(a.cod_curso);
     if(a.cod_curso <> 0) then begin
           writeln('ingrese el codigo del alumno');
           readln(a.cod_alumno);
           writeln('ingrese el apellido del alumno');
           readln(a.apellido);
           writeln('ingrese la nota final');
           readln(a.nota_final);
     end;
end;

procedure InsertarOrdenado (var l:lista; a:alumno);
var
   nue,act,ant: lista;
begin
   new(nue);
   nue^.dato := a;
   act:= l;
   ant:= l;
   while (act <> nil) and (act^.dato.cod_alumno < a.cod_alumno) do begin
         ant:= act;
         act:= act^.sig;
   end;
   if(ant=act) then
      l:= nue
   else
       ant^.sig := nue;
   nue^.sig:= act;
end;

procedure CargarVector(var v:vector);
var
   a: alumno;
begin
   leer(a);
   while(a.cod_curso <> 0) do begin
        InsertarOrdenado(v[a.cod_curso], a);
        leer(a);
   end;
end;

procedure ImprimirLista(l:lista);
begin
     while(l <> nil)do begin
         writeln('El codigo del alumno es: ', l^.dato.cod_alumno);
         writeln('El apellido del alumno es: ', l^.dato.apellido);
         writeln('La nota final del alumno es: ',l^.dato.nota_final);
         writeln('El codigo del curso es: ', l^.dato.cod_curso);
     end;
end;

procedure ImprimirVector(v:vector);
var
   i: integer;
begin
     for i:=1 to dimF do begin
         writeln('Se imprime la lista : ', i);
         ImprimirLista(v[i]);
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
   if(l <> nil) then begin
        act:= l;
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

procedure buscarMin(var v: vector; var e:lista);
var
   min, i , pos: integer;
begin
   min:= 999999;
   for i:= 1 to dimF do begin
       if(v[i] <> nil) then
               if(v[i]^.dato.cod_alumno < min) then begin
                      min:= v[i]^.dato.cod_alumno;
                      pos:= i;
                      e:= v[i];
               end;
   end;
   if(min <> 999999) then
       borrar(v[pos])
   else
       e:= nil;
end;

procedure mergeAcumulador (var v: vector; var l: lista);
var
   e, aux: lista;
   notas, promedio: real;
   cant_curso: integer;
begin
   buscarMin(v,e);
   while(e <> nil) do begin
       aux:= e;
       promedio:= 0;
       notas:= 0;
       cant_curso:= 0;
       while(e <> nil) and (e^.dato.cod_alumno = aux^.dato.cod_alumno) do begin
               notas:= notas + e^.dato.nota_final;
               cant_curso:= cant_curso + 1;
               buscarMin(v,e);
       end;
       promedio:= (notas/cant_curso);
       aux^.dato.nota_final:= promedio;
       aux^.sig:= nil;
       agregarAtras(l,aux);
   end;
end;

{------------------------------------------------------------------------------}

procedure buscarMaximo(l: lista; var max: integer; var maxP: real; var apeMax: cadena);
begin
     if(l <> nil) then begin
          if(l^.dato.nota_final > max) then begin
                maxP:= l^.dato.nota_final;
                max:= l^.dato.cod_alumno;
                apeMax:= l^.dato.apellido;
          end;
          buscarMaximo(l^.sig,max,maxP,apeMax);
     end;
end;

{------------------------------------------------------------------------------}

var
   v:vector;
   l: lista;
   max: integer;
   maxP: real;
   apeMax: cadena;
begin
   l:= nil;
   max:= -1;
   maxP:= -1.0;
   CargarVector(v);
   ImprimirVector(v);
   writeln('Se realiza un merge acumulador');
   mergeAcumulador(v,l);
   buscarMaximo(l,max,maxP,apeMax);
   writeln('El apellido con mejor promedios es: ',apeMax,' su codigo de alumno es: ', max, 'y su promedio es: ', maxP);
   readln;
end.


