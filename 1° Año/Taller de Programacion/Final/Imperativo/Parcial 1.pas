program parcial1;
const
   dimF = 100;
type
   alumno = record
            legajo: integer;
            cant_asistencia: integer;
            nota_examen: integer;
            end;

   lista = ^ nodo;

   nodo = record
                datos: integer;
                sig: lista;
          end;

   vector = array [1..dimF] of alumno;

{------------------------------------------------------------------------------}

procedure leer (var a: alumno);
begin
    writeln('Ingrese el numero de legajo');
    readln(a.legajo);
    if(a.legajo <> 0) then begin
        Randomize;
        writeln('Ingrese la cantidad de asistencia');
        a.cant_asistencia := random (20);
        writeln('Ingrese la nota del examen');
        a.nota_examen := random(10) +1;
    end;
end;

procedure cargarVector(var v: vector; var dimL: integer);        {punto A}
var
   a: alumno;
begin
     leer(a);
     while(a.legajo <> 0) and (dimL < dimF) do begin
         dimL:= dimL + 1;
         v[dimL] := a;
         leer(a);
     end;
end;

procedure ordenarVector(var v: vector; dimL:integer);   {Punto B}
var
   j,i: integer;
   aux: alumno;
begin
    for i:=2 to diml do begin
        aux:=v[i];
        j:=i-1;
        while(j>0) and (v[j].legajo>aux.legajo) do begin
            v[j+1]:=v[j];
            j:=j-1;
        end;
        v[j+1]:=aux;
    end;
end;


procedure BusquedaDicotomica(v:vector; inicio,fin,legajo: integer;var notaF: integer; var ok:boolean);  {Punto c}
var
   medio: integer;
begin
   if(fin < inicio) then

   else begin
        medio := (inicio + fin) div 2;
        if(v[medio].legajo = legajo) then begin
               ok:= true;
               notaF:= v[medio].nota_examen;
        end
        else
               if(v[medio].legajo>legajo)then begin
                     fin:=medio-1;
                     BusquedaDicotomica(v,inicio,fin,legajo,notaF,ok);
               end
               else begin
                     inicio:=medio+1;
                     BusquedaDicotomica(v,inicio,fin,legajo,notaf,ok);
               end;
   end;
end;

procedure AgregarAdelante(var l:lista; legajo: integer);      {Punto C}
var nue:lista;
begin
  new(nue);
  nue^.datos:= legajo;
  nue^.sig:=l;
  l:=nue;
End;

procedure Asistencia (v:vector; var l: lista; i:integer; x:integer; dimL: integer);
begin
     if (i <= diml) then begin
         if(v[i].cant_asistencia < x) then
              AgregarAdelante(l,v[i].legajo);
         Asistencia(v,l,i+1,x,diml);
    end;
end;

procedure imprimirVector(v:vector; dimL:integer);
var
   i: integer;
begin
     for i:=1 to dimL do begin
         writeln('-------------------');
         writeln('Legajo ', v[i].legajo);
         writeln('Asistencias ', v[i].cant_asistencia);
         writeln('Nota de examen ', v[i].nota_examen);
         writeln('-------------------');
     end;
end;

procedure imprimirLista(l:lista);
Begin
 while (l <> nil) do begin
   writeln('legajo ', l^.datos);
   l:= l^.sig;
 end;
end;

{------------------------------------------------------------------------------}

var
   v: vector;
   dimL, fin, inicio, i, notaF,x: integer;
   legajo: integer;
   ok: boolean;
   l: lista;
begin
   inicio:=1;
   dimL:= 0;
   ok:= false;
   l:= nil;
   i:=1;
   cargarVector(v,dimL);
   writeln('Se imprime el vector desordenado');
   imprimirVector(v,dimL);
   ordenarVector(v,dimL);
   fin:= dimL;
   writeln('Ahora se imprime el vector ordenado por legajo');
   imprimirVector(v,dimL);
   writeln('Ingrese el legajo a buscar');
   readln(legajo);
   BusquedaDicotomica(v,inicio,fin,legajo,notaF,ok);
   if(ok= true) then
         writeln('la nota del legajo buscado es: ', notaf)
   else
         writeln('el legajo no existe');
   writeln('Ingrese el numero de asistencia');
   readln(x);
   Asistencia(v,l,i,x,diml);
   imprimirLista(l);
   readln;
end.

