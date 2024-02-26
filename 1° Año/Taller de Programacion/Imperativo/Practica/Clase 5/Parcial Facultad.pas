{Se desea procesar informacion de alumnos de la Facultad. De cada alumno se
conoce: codigo de alumno, codigo de carrera (1..5), codigo de materia, fecha de
examen final( dia, mes y año) y nota del examen final.

a- Genere una estructura por cada carrera que contenga codigo de alumno, codigo
de materia, fecha y nota, ordenada por codigo de materia. Luego reuna en una unica
estructura la informacion de las estructuras ya generadas de las carreras, tambien
ordenada por codigo de materia.

b- Genere una estructura que permita realizar una busqueda eficiente por codigo
de alumno para informar el codigo de alumno y sus codigos de materias y notas, para
aquellos alumnos cuyo codigo esta entre 10000 y 11000.

c- A partir de la estructura generada en b, informe la cantidad total de alumnos
de la Facultad.}



Program AlumnosFacu;
const
    inf=10000;
    sup=11000;
type
    rango1=1..31;
    rango2=1..12;
    rango3=2000..2019;
    rango4=1..5;

    fecha= record
                 dia:rango1;
                 mes:rango2;
                 anio:rango3;
           end;

    alumno= record
                 CodAlum: integer;
                 CodMat: integer;
                 CodCar:rango4;
                 fech:fecha;
                 nota: integer;
            end;

    lista = ^Nodo;
    nodo = record
               dato:alumno;
               sig:lista;
           end;

    arbol= ^nodoA;
    nodoA = Record
              dato: alumno;
              HI: arbol;
              HD: arbol;
            End;

    vector = array[rango4]of lista;

procedure leerFecha(var f:fecha);
begin
  randomize;
  writeln('ingrese el dia');
  f.dia:= random(31)+1;
  writeln('ingrese el mes');
  f.mes:= random(12)+1;
  writeln('ingrese el anio');
  f.anio:= random (20)+2000;
end;

procedure leer(var a:alumno);
var
  f:fecha;
begin
  randomize;
  writeln('Ingrese el codigo del alumno');
  readln(a.CodAlum);
  if(a.CodAlum<>-1) then begin
     writeln('ingrese el codigo de codigo de la carrera');
     a.CodCar:= random(5)+1;
     writeln('ingrese el codigo de la materia');
     readln(a.CodMat);
     writeln('ingrese la fecha');
     leerFecha(f);
     writeln('ingrese la nota del examen final');
     readln(a.nota);
  end;
end;

Procedure InsertarOrdenado(var L:lista; a:alumno);
 var ant,nue,act:lista;
 begin
      new(nue);
      nue^.dato:=a;
      act:=L;
      ant:=L;
      While (act<>nil)and(act^.dato.CodMat<a.CodMat)do begin
            ant:=act;
            act:=act^.sig;
      end;
      if(act=ant)then
                     L:=nue
      else
          ant^.sig:=nue;
      nue^.sig:=act;
end;

procedure CargarVector(var v:vector);
var
   a:alumno;
   i:integer;
begin
       Leer(a);
       while(a.CodAlum<>-1)do begin
         randomize;
         i:= random (5)+1;
             InsertarOrdenado(v[i],a);
         Leer(a);
      end;
end;

procedure ImprimirLista(l:lista);
begin
     while(l<>nil)do begin
         writeln('el codigo del alumno es: ', l^.dato.CodAlum);
         writeln('el codigo de la materia es: ', l^.dato.CodMat);
         writeln('La nota final es: ', l^.dato.nota);
            l:=l^.sig;

     end;
end;

Procedure ImprimirVector(v:vector);
var i:integer;
begin
     for i:= 1 to 5 do begin
       writeln('se imprime la lista: ', i);
        ImprimirLista(v[i]);
        Readln;

     end;
end;

Procedure AgregarAtras (var l:lista; n:lista);
var nue,act:lista;
begin
     act:=L;
     nue:=N;
     nue^.sig:=nil;
     if(L<>nil)then begin
          act:=L;
          while(act^.sig<>nil)do
                                act:=act^.sig;
          act^.sig:=nue;
     end
     else
         L:=nue;
end;

procedure Borrar(var l:lista);
begin
    l:=l^.sig;
end;

procedure buscarMin(var v:vector;var e:lista);
var
    i,pos,min:integer;
begin
    min:=99999;

    for i:=1 to 5 do begin
        if (v[i]<>NIl)then
             if(v[i]^.dato.CodMat<min)then begin
                    min:=v[i]^.dato.CodMat;
                    pos:=i;
                    e:=v[i];
             end;

    end;
    if(min<>99999)then
        Borrar(v[pos])
    else
        E:=nil;

end;

procedure Merge(var v:vector; var l:lista);
var
    E:lista;
begin
    buscarmin(v,E);
    while(E<>nil) do begin
        agregaratras(l,E);
        buscarmin(v,E);
    end;
end;

procedure InsertarABB(var a:arbol; dato:alumno);
var
  aux:arbol;
begin
  if(a=nil)then begin
    new(aux);
    aux^.dato:=dato;
    aux^.HI:=nil;
    aux^.HD:=nil;
    a:=aux;
  end
  else
    if(a^.dato.CodAlum>dato.CodAlum)then
      InsertarABB(a^.HI, dato)
    else
      InsertarABB(a^.HD, dato);
  end;

procedure EnOrden(a:arbol);
begin
 if(a<>nil) then begin
    EnOrden(a^.HI);
    writeln('el codigo del alumno es: ', a^.dato.CodAlum);
    writeln('el codigo de la materia es: ', a^.dato.CodMat);
    writeln('la nota del examen es: ', a^.dato.nota);
    EnOrden(a^.HD);
 end;
end;

procedure RecorridoAcotado(a:arbol);
begin
  if(a<>nil)then begin
    if(a^.dato.CodAlum>=inf)then
      if( a^.dato.CodAlum<=sup)then begin
         writeln('el codigo del alumno es: ', a^.dato.CodAlum);
         writeln('el codigo de la materia es: ', a^.dato.CodMat);
         writeln('la nota del examen es: ', a^.dato.nota);
         RecorridoAcotado(a^.HI);
         RecorridoAcotado(a^.HD);
      end
      else
        RecorridoAcotado(a^.HI)
    else
      RecorridoAcotado(a^.HD);
  end;
end;

procedure RecorridoContador(a:arbol; var contador:integer);
begin
  if(a<>nil)then begin
        contador:=contador+1;
        RecorridoContador(a^.HI,contador);
        RecorridoContador(a^.HD,contador);
  end;
end;





Var
   v:vector;
   l:lista;
   a:arbol;
   contador: integer;
begin
   l:=nil;
   CargarVector(v);
   ImprimirVector(v);
   writeln('Se realiza un Merge');
   Merge(v,l);
   readln;
   writeln('Lista final');
   readln;
   ImprimirLista(l);
   readln;
   writeln('Se genera un arbol con lista creada por el merge');
   while(l<>nil)do begin
     insertarABB(a,l^.dato);
     l:=l^.sig;
   end;
   readln;
   EnOrden(a);
   readln;
   writeln('Se hace un recorrido acotado');
   RecorridoAcotado(a);
   writeln('Se va a recorrer el arbol para contar la cantidad de alumnos');
   contador:=0;
   readln;
   RecorridoContador(a,contador);
   writeln('La cantidad de alumnos de la Facultad son: ', contador);
   readln;
end.
