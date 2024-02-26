{Una cátedra cuenta con información de sus alumnos (a lo sumo 100). De cada
alumno se conoce legajo, cantidad de asistencia y nota de examen.

Implementar un programa que:

A. Genere un vector, sin orden, con a lo sumo los 100 alumnos. La lectura
finaliza cuando llega el legajo 0.

B. Ordene el vector, aplicando el método de inserción, para obtener el vector
ordenado por legajo de alumno.

C. Realice una búsqueda dicotómica que recibe el vector generado en B y un
legajo, y retorne si dicho legajo está en el vector. En el caso de encontrarlo,
se debe informar las notas de examen, y en caso contrario informar que el legajo
buscado no existe.

D.	Invoque a un módulo recursivo que recibe el vector de alumnos y un valor, y
devuelve una lista con los legajos de los alumnos cuya cantidad de asistencia
es menor al valor recibido.}


program Parcial;
const
  dimf=100;
type
  alumno = record
           legajo:integer;
           A:integer;
           examen:real;
           end;
  vector = array[1..dimf]of alumno;

  lista = ^nodo;
  nodo = record
         legajo:integer;
         sig:lista;
         end;


procedure LeerA(var a:alumno);
begin
  writeln('Ingresar legajo.');
  readln(a.legajo);
  if(a.legajo<>0)then begin
    writeln('Ingresar asistencias.');
    readln(a.A);
    writeln('Ingresar nota del examen.');
    readln(a.examen);
  end;
end;

procedure AgregarV(var v:vector; var diml:integer; a:alumno);
begin
  if(diml<=dimf)then begin
    v[diml+1]:=a;
    diml:=diml+1;
  end;
end;

procedure CargarV(var v:vector; var diml:integer);
var
  a:alumno;
begin
  LeerA(a);
  while(a.legajo<>0)do begin
    AgregarV(v,diml,a);
    LeerA(a);
  end;
end;

procedure ordenar(var v:vector; diml:integer);
var
    j,i:integer;
    x:alumno;

begin
    for i:=2 to diml do begin
        x:=v[i];
        j:=i-1;
        while(j>0) and (v[j].legajo>v[i].legajo) do begin
            v[j+1]:=v[j];
            j:=j-1;
        end;
        v[j+1]:=x;
    end;
end;

Procedure BusquedaD( v:vector; ini,fin,legajo:integer; var ok:boolean );
var
  medio:integer;
begin
  if(fin<ini)then
    ok:=false
  else begin
    medio:=(ini+fin) div 2;
    if(v[medio].legajo=legajo)then begin
      ok:=true;
    end
    else
      if(v[medio].legajo>legajo)then begin
        fin:=medio-1;
        BusquedaD(v,ini,fin,legajo,ok);
      end
      else begin
        ini:=medio+1;
        BusquedaD(v,ini,fin,legajo,ok);
      end;
  end;
end;

Procedure AgregarAdelante(var L:lista; per:integer);
Var
  nue:Lista;
Begin
  New(nue);
  nue^.legajo:=per;
  nue^.sig:=L;
  L:=nue;
End;

procedure Legajos(var l:lista; v:vector; diml:integer; x:integer; i:integer);
begin
  if(i<=diml)then begin
    if(v[i].A<x)then
      AgregarAdelante(l,v[i].legajo);
    Legajos(l,v,diml,x,i+1);
  end;
end;

procedure Imprimir(v:vector; diml:integer);
var
  i:integer;
begin
  for i :=1 to diml do
    writeln('Legajo ',v[i].legajo,' nota ',v[i].examen:2:3,' asistencias ',v[i].a);
end;

Procedure recorrido ( pri : lista);

Begin
 while (pri <> NIL) do begin
   writeln(pri^.legajo);
   pri:= pri^.sig
 end;
end;


var
  v:vector;
  diml,ini,fin,x:integer;
  l:lista;
  ok:boolean;
  i:integer;
begin
  l:=nil;
  ok:=false;
  diml:=0;
  ini:=1;

  CargarV(v,diml);

  readln;
  fin:=diml;
  Ordenar(v,diml);
  imprimir(v,diml);
  writeln('Ingrese legajo a buscar.');
  readln(x);
  BusquedaD(v,ini,fin,x,ok);
  if(ok=true)then
    writeln('Legajo encontrado.')
  else
    writeln('Legajo no encontrado.');
  writeln('Ingrese numero de asistencia para saber que alumnos no la superan.');
  readln(x);
  i:=1;
  Legajos(l,v,diml,x,i);
  recorrido(l);
  readln;
end.
