program Parcial;
const
     Dimf=100;
type
     alumno=record
                  legajo: integer;
                  asis: integer;
                  nota: integer;
            end;
     vector= array [1..Dimf] of alumno;
     lista=^nodo;
     nodo= record
                 datos:integer;
                 sig: lista;
           end;


procedure leer (var a: alumno);
begin
     writeln('Ingrese el numero de legajo');
     readln(a.legajo);
     if (a.legajo<> 0) then begin
         Randomize;
         writeln('ingrese la cantidad de asistencia');
         a.asis:= random(20);
         writeln('ingrese la nota del examen');
         a.nota:= random(10)+1
     end;
end;

procedure cargar (var v:vector; var diml:integer);  {Punto A Hecho}
var
   a:alumno;
begin
   leer(a);
   while(a.legajo<>0) and (diml< dimf) do begin
        diml:= diml+1;
        v[diml]:= a;
        leer(a);
   end;
end;



procedure ordenar(var v:vector; diml:integer);  {Punto B Hecho}
var
    j,i:integer;
    x: alumno;

begin
    for i:=2 to diml do begin
        x:=v[i];
        j:=i-1;
        while(j>0) and (v[j].legajo>x.legajo) do begin
            v[j+1]:=v[j];
            j:=j-1;
        end;
        v[j+1]:=x;
    end;
end;

Procedure BusquedaD( v:vector; ini,fin,dato:integer; var notaf: integer; var ok:boolean );   {Punto C Hecho}
var
  medio:integer;
begin
  if(fin<ini)then

  else begin
    medio:=(ini+fin) div 2;
    if(v[medio].legajo=dato)then begin
      ok:=true;
      notaf:=v[medio].nota;
    end
    else
      if(v[medio].legajo>dato)then begin
        fin:=medio-1;
        BusquedaD(v,ini,fin,dato,notaf,ok);
      end
      else begin
        ini:=medio+1;
        BusquedaD(v,ini,fin,dato,notaf,ok);
      end;
  end;
end;

procedure AgregarAdelante(var l:lista; legajos: integer);
Var nue:Lista;
Begin
  New(nue);
  nue^.datos:= legajos;
  nue^.sig:=L;
  L:=nue;
End;

Procedure Asistencia (v:vector; var l: lista; i:integer; x:integer; diml: integer);
begin
     if (i<= diml) then begin
         if(v[i].asis<x) then
              AgregarAdelante(l,v[i].legajo);
         Asistencia(v,l,i+1,x,diml);
    end;
end;

procedure Imprimir(v:vector; diml:integer);
var
  i:integer;
begin
  for i :=1 to diml do
    writeln('Legajo ',v[i].legajo,' nota ',v[i].nota ,' asistencias ',v[i].asis);
end;

Procedure ImprimirLista ( l : lista);

Begin
 while (l <> NIL) do begin
   writeln(l^.datos);
   l:= l^.sig
 end;
end;

var

   l:lista;
   v:vector;
   i, diml,ini,fin,dato, notaf,x:integer;
   ok:boolean;
begin
   l:= nil;
   ok:= false;
   i:= 1;
   diml:=0;
   ini:=1;
   Cargar (v,diml);
   writeln('se imprime el vector ingresado');
   Imprimir (v,diml);
   fin:= diml;
   Ordenar(v,diml);
   writeln('se imprime el vector ordenado');
   Imprimir (v,diml);
   writeln('ingrese el legajo a buscar');
   readln(dato);
   BusquedaD (v,ini,fin,dato,notaf,ok);
   if(ok= true) then
         writeln('la nota del legajo buscado es: ', notaf)
   else
         writeln('el legajo no se encontro');
   writeln(' Ingrese el numero de asistencia');
   readln(x);
   Asistencia(v,l,i,x,diml);
   writeln('Se imprime la lista creada');
   ImprimirLista(l);
   readln;
end.
