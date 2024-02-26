program ParcialVotacion;
type
   cadena= string [40];

   alumno= record
                 nombre: cadena;
                 VotT: integer;
           end;

   topico= record  {proyectos}
                 NomT: cadena;
                 Vt: integer;
           end;

   lista=^nodo; {de proyectos}
   nodo= record
               dato: topico;
               sig:lista;
         end;

   arbol=^nodo1;
   nodo1= record
               dato: alumno;
               top: lista;
               HI: arbol;
               HD: arbol;
          end;

//MODULOS

procedure Leer (var alum:alumno; var t: topico);
begin
     writeln('ingrese el nombre del alumno');
     readln(alum.nombre);
     if(alum.nombre<>'zzz') then begin
          alum.VotT:= 1;
          writeln('ingrese el nombre del topico');
          readln(t.NomT);
          t.Vt:=1;
     end;
end;

Procedure InsertarOrdenado ( var pri: lista; t:topico);
var ant, nue, act: lista;
begin
  new (nue);
  nue^.dato := t;
  act := pri;
  ant := pri;
{Recorro mientras no se termine la lista y no encuentro la posición correcta}
  while (act<>NIL) and (act^.dato.nomT < t.nomT) do begin
      ant := act;
      act := act^.sig ;
  end;
  if (ant = act)  then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
end;

procedure Buscar(l:lista; var ok:boolean; nom:cadena);
begin
  if(l<>nil)and(ok<>true)then begin
    if(l^.dato.nomT=nom)then
      ok:=true;
    Buscar(l^.sig,ok,nom);
  end;
end;

procedure InsertarABB(var a:arbol; alum:alumno; t:topico);
var
  aux:arbol;
  ok:boolean;
begin
  if(a=nil)then begin
    new(aux);
    aux^.dato:=alum;
    aux^.HI:=nil;
    aux^.HD:=nil;
    aux^.top:=nil;
    ok:= false;
    Buscar(aux^.top,ok,t.nomT);
    if(ok=false) then
                InsertarOrdenado(aux^.top, t);
    a:=aux;
  end
  else
    if(a^.dato.nombre > alum.nombre)then
      InsertarABB(a^.HI,alum,t)
    else
      if(a^.dato.nombre < alum.nombre)then
         InsertarABB(a^.HD,alum,t)
        else begin
          a^.dato.votT:=a^.dato.votT+ 1;
          ok:=false;
          Buscar(a^.top,ok,t.NomT);
          if(ok=false)then
            InsertarOrdenado(a^.top,t)
          else
            a^.top^.dato.vt:= a^.top^.dato.Vt + 1;
        end;
end;

procedure CargarArbol(var a:arbol);
var
    alum:alumno;
    t:topico;
begin
    leer(alum,t);
    while (alum.nombre<>'zzz') do begin
      insertarABB(a,alum,t);
      leer(alum,t);
    end;
end;

procedure MaxTopico(l:lista; var cantvMax:integer;  var topicoMax:cadena);
begin
  while(l<>nil)do begin
    if(l^.dato.Vt>cantvMax) then begin
       topicomax:= l^.dato.nomT;
       cantvMax:= l^.dato.Vt;
    end;
    l:=l^.sig;
  end;
end;

procedure Ganador(a:arbol; var Max:integer; var cantvMax:integer;var topicoMax:cadena;var NomMax:cadena);
begin
  if(a<>nil)then begin
      MaxTopico(a^.top,cantvMax,topicoMax);
      if(cantvMax>Max)then begin
        Max:=cantvMax;
        NomMax:=a^.dato.nombre;
      end;
    Ganador(a^.HI,Max,cantvMax,topicoMax,NomMax);
    Ganador(a^.Hd,Max,cantvMax,topicoMax,NomMax);
  end;
end;


procedure EnOrden(a:arbol);
begin
 if(a<>nil) then begin
    EnOrden(a^.HI);
    writeln('el nombre del alumno es: ', a^.dato.nombre,'  ','con un total de votos: ', a^.dato.votT);
    EnOrden(a^.HD);
 end;
end;

{prog.pricipal}

var
 a:arbol;
 Max, cantvMax:integer;
 topicoMax, NomMax:cadena;
begin
 a:=nil;
 CargarArbol(a);
 Max:=-1;
 cantvMax:=-1;
 Ganador(a,Max,cantvMax,topicoMax,NomMax);
 writeln('El proyecto ganador es del alumno ' , NomMax , ' perteneciente al topico ' , topicoMax , ' con un total de votos de ' , Max);
 EnOrden(a);
 readln;
end.
