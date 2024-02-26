program parcial2;
const
     inf = 100;
     sup = 110;
type
     rango1= 1..31;
     rango2= 1..12;
     rango3= 2000..2020;
     rango4= 1..5;

     fecha = record
                   dia: rango1;
                   mes: rango2;
                   anio: rango3;
             end;

     alumno = record
                   cod_alumno:integer;
                   cod_carrera: rango4;
                   cod_materia: integer;
                   fecha_examen: fecha;
                   nota_examen: integer;
               end;

     lista = ^nodo;
     nodo = record
                  datos:alumno;
                  sig: lista;
            end;

     vector = array [rango4] of lista;

     arbol = ^nodo1;
     nodo1 = record
                  dato: alumno;
                  HI: arbol;
                  HD: arbol;
             end;

{----------------------------------------------------------------------------}
procedure leerFecha(var f:fecha);
begin
     randomize;
     f.dia:= random(31)+1;
     f.mes:= random(12)+1;
     f.anio:= random(21)+2000;
end;

procedure leerAlumno(var a: alumno);
var
   f:fecha;
begin
   randomize;
   writeln('Ingrese el codigo de alumno');
   readln(a.cod_alumno);
   if(a.cod_alumno <> 0)then begin
        writeln('Ingrese el codigo de carrera');
        a.cod_carrera:= random(5)+1;
        writeln('Ingrese el codigo de la materia');
        readln(a.cod_materia);
        writeln('Ingrese la fecha del examen');
        leerFecha(f);
        writeln('Ingrese la nota del examen final');
        a.nota_examen:= random (10)+1;
   end;
end;

procedure insertarOrdenado(var l:lista; a:alumno);
var
   ant,act,nue: lista;
begin
   new(nue);
   nue^.datos := a;
   act:= l;
   ant:= l;
   while(act <> nil) and (act^.datos.cod_materia < a.cod_materia) do begin
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
   a: alumno;
   i:integer;
begin
   leerAlumno(a);
   while(a.cod_alumno <> 0) do begin
       i:= a.cod_carrera;
       insertarOrdenado(v[i],a);
       leerAlumno(a);
   end;
end;

procedure imprimirLista(l:lista);
begin
     while(l<>nil)do begin
         writeln('el codigo del alumno es: ', l^.datos.cod_alumno);
         writeln('el codigo de la materia es: ', l^.datos.cod_materia);
         writeln('La nota final es: ', l^.datos.nota_examen);
         writeln('-----------------------------');
            l:=l^.sig;

     end;
end;

procedure imprimirVector(v:vector);
var i:integer;
begin
     for i:= 1 to 5 do begin
       writeln('se imprime la lista: ', i);
       writeln('-----------------------------');
       imprimirLista(v[i]);
     end;
end;

procedure agregarAtras(var l:lista; n: lista);
var
   nue,act:lista;
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
   for i:= 1 to 5 do begin
       if(v[i] <> nil) then
           if(v[i]^.datos.cod_materia < min) then begin
                 min:= v[i]^.datos.cod_materia;
                 pos:= i;
                 e:= v[i];
           end;
   end;
   if(min <> 999) then
      borrar(v[pos])
   else
      e:= nil;
end;

procedure merge(var v:vector; var l: lista);        {Hasta aca el punto a}
var
   e: lista;
begin
   buscarMin(v,e);
   while(e <> nil) do begin
      agregarAtras(l,e);
      buscarMin(v,e);
   end;
end;

procedure insertarABB(var a:arbol; dato:alumno);
var
   aux:arbol;
begin
   if (a=nil) then begin
      new(aux);
      aux^.dato:= dato;
      aux^.HI:= nil;
      aux^.HD:= nil;
      a:= aux;
   end
   else
      if(a^.dato.cod_alumno > dato.cod_alumno)then
           insertarABB(a^.HI,dato)
      else
           insertarABB(a^.HD,dato);
end;

procedure EnOrden(a:arbol);
begin
 if(a<>nil) then begin
    EnOrden(a^.HI);
    writeln('el codigo del alumno es: ', a^.dato.cod_alumno);
    writeln('el codigo de la materia es: ', a^.dato.cod_materia);
    writeln('la nota del examen es: ', a^.dato.nota_examen);
    writeln('-----------------------------');
    EnOrden(a^.HD);
 end;
end;

procedure recorridoAcotado(a: arbol);                             {Punto B}
begin
     if(a <> nil) then begin
          if(a^.dato.cod_alumno >= inf)then
             if(a^.dato.cod_alumno <= sup)then begin
                     writeln('El codigo de alumno es: ',a^.dato.cod_alumno);
                     writeln('El codigo de materia es: ',a^.dato.cod_materia);
                     writeln('La nota del examen es: ',a^.dato.nota_examen);
                     writeln('-----------------------------');
                     recorridoAcotado(a^.HI);
                     recorridoAcotado(a^.HD);

             end
             else
                     recorridoAcotado(a^.HI)
          else
              recorridoAcotado(a^.HD);
     end;
end;

procedure recorridoContador(a:arbol; var contador: integer);       {punto C}
begin
     if(a <> nil) then begin
          contador:= contador + 1;
          recorridoContador(a^.HI,contador);
          recorridoContador(a^.HD,contador);
     end;
end;

var
   v:vector;
   l:lista;
   a:arbol;
   contador: integer;
begin
   l:= nil;
   a:= nil;
   contador:= 0;
   cargarVector(v);
   writeln('Se imprime el vector creado');
   writeln('-----------------------------');
   imprimirVector(v);
   writeln('Ahora bien, realizamos el merge');
   readln;
   merge(v,l);
   writeln('-----------------------------');
   writeln('Se imprime la lista final');
   imprimirLista(l);
   readln;
   writeln('Se crea un arbol a partir de la lista creada por el merge');
   while(l <> nil) do begin
         insertarABB (a,l^.datos);
         l:= l^.sig;
   end;
   writeln('Ahora se imprime el arbol creado');
   EnOrden(a);
   writeln('Se imprimen aquellos alumnos con codigos de alumno que esten entre 100 y 110');
   writeln('-----------------------------');
   readln;
   recorridoAcotado(a);
   readln;
   recorridoContador(a,contador);
   writeln('-----------------------------');
   writeln('La cantidad de alumnos en la Facultad son: ', contador);
   readln;
end.






