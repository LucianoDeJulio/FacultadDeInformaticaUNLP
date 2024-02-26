{Un telepeajo desea guardar la informacion de todos los vehiculos que pasaron por
el. De cada vehiculo se lee: Patente, Hora, fecha y precio. Genere una estructura
ordenada por Patente que contenga para cada patente la cantidad de pasos de un
vehiculo. La carga finaliza cuando se lee el monto 0.
La estructura debe ser optima para su busqueda por dicho criterio. Ademas
realice los siguientes modulos independiente:

a). Averigue cuantos vehiculos debieron pagar un total que este entre 200 y 800
de peaje.

b). Informe la informacion de los vehiculos cuyas patentes se encuentren contenidas
entre dos valores ingresados.

Nota: La informacion ingresa sin orden alguno.}


Program ParcialPatentes;
type
     Rango1=1..31;
     Rango2=1..12;
     Rango3=2000..2019;
     Rango4=1..24;

     Cadena= String [20];
     Fecha=record
              dia:Rango1;
              mes:Rango2;
              anio:Rango3;
           end;

     Vehiculo= record
                    Hora:Rango4;
                    Fech: Fecha;
                    Monto: Integer;
               end;
     Lista=^nodo;
     nodo=record
                dato: vehiculo;
                sig: lista;
          end;

     arbol=^nodo1;
     nodo1=record
                dato: lista;
                Patente: cadena;
                HI:arbol;
                HD:arbol;
            end;

procedure leerFecha(var f:fecha);
begin
   randomize;
   writeln('ingrese el dia');
   f.dia:=random(31)+1;
   writeln('ingrese el mes');
   f.mes:= random(12)+1;
   writeln('ingrese el anio');
   f.anio:= random (19)+2000;
end;

procedure leer(var v: vehiculo; var patente: cadena);
var
    f:fecha;
begin
    writeln('ingrese la monto');
    readln(v.monto);
    if(v.monto<>0) then begin
        writeln('ingrese la patente');
        readln(patente);
        writeln('ingrese la hora');
        readln(v.hora);
        writeln('ingrese la fecha');
        LeerFecha(f);
    end;
end;

Procedure AgregarAtras (var l:lista; v: vehiculo);
var nue,act:lista;
begin
     new(nue);
     nue^.dato:=v;
     nue^.sig:=nil;
     if(L<>nil)then
     begin
          act:=L;
          while(act^.sig<>nil)do
                                act:=act^.sig;
          act^.sig:=nue;
     end
     else
         l:=nue;
end;

procedure InsertarABB(var a:arbol; v:vehiculo; patente:cadena);
var
  aux:arbol;
begin
  if(a=nil)then begin
    new(aux);
    aux^.dato:=nil;
    aux^.HI:=nil;
    aux^.HD:=nil;
    aux^.patente:=patente;
    AgregarAtras(aux^.dato,v);
    a:=aux;
  end
  else
    if(a^.patente>patente)then
      InsertarABB(a^.HI,v,patente)
    else
      if(a^.patente<patente)then
        InsertarABB(a^.HD, v,patente)
        else
          AgregarAtras(a^.dato,v);
end;

procedure CargarArbol(var a:arbol);
var
    v:vehiculo;
    patente:cadena;
begin
    leer(v,patente);
    while (v.monto<>0) do begin
      insertarABB(a,v,patente);
      leer(v,patente);
    end;
end;

procedure RecorrerLista(l:lista;var montoMax:integer);
begin
     while(l<>nil) do begin
         montoMax:= montoMax+ l^.dato.monto;
         l:=l^.sig;
     end;
end;


procedure RecorridoContador(a:arbol; var contador:integer);
var
   montoMax:integer;
begin
  if(a<>nil)then begin
        montoMax:=0;
        RecorrerLista(a^.dato,montoMax);
        If(montoMax>=200)and (montoMax<=800) then
          contador:=contador+1;
        RecorridoContador(a^.HI,contador);
        RecorridoContador(a^.HD,contador);
  end;
end;

procedure ImprimirLista(l:lista);
begin
    while (l<>nil)do begin
          writeln('La hora de la pasada es: ', l^.dato.hora);
          writeln('El dia de la pasada es: ', l^.dato.fech.dia);
          writeln('El Mes de la pasada es: ', l^.dato.fech.mes);
          writeln('El año de la pasada fue: ', l^.dato.fech.anio);
          writeln('El monto pagado fue: ',l^.dato.monto);
          l:=l^.sig;
    end;
end;

procedure RecorridoAcotadoAn(a:arbol; inf,sup:cadena);
begin
  if(a<>nil)then begin
    if(a^.patente>=inf)then
      if( a^.patente<=sup)then begin
        ImprimirLista(a^.dato);
        RecorridoAcotadoAn(a^.HI,inf,sup);
        RecorridoAcotadoAn(a^.HD,inf,sup);
      end
      else
        RecorridoAcotadoAn(a^.HI,inf,sup)
    else
      RecorridoAcotadoAn(a^.HD,inf,sup);
  end;
end;



Var
   a:arbol;
   contador:integer;
   inf,sup: cadena;
Begin
   CargarArbol(a);
   RecorridoContador(a,contador);
   writeln('la cantidad de vehiculos que pagaron entre 200 y 800 son', contador);
   readln;
   writeln('ingrese la patente inferior');
   readln(inf);
   writeln('ingrese la patente superior');
   readln(sup);
   RecorridoAcotadoAn(a,inf,sup);
   readln;
end.
