{Actividad 12: Implementar un programa que informe si una lista de caracteres
representa una palabra palindrome.

Nota: Se lee igual de izq a der que de der a izq).}


program Palindrome;
type

  lista=^nodo;
  nodo = record
         datos:char;
         sig:lista;
         end;
procedure AgregarAlFinal (var pri, ult: lista; c: char);
var  nue : lista;

begin 
 new (nue);
 nue^.datos:= c;
 nue^.sig := NIL;
 if (pri <> Nil) then
                 ult^.sig := nue
               else 
                 pri := nue;
 ult := nue;
end;
Procedure CargarLista(var L:lista; ult:lista);
var
    letra:char;
begin

    writeln('Ingrese letra');
    readln(letra);
    while(letra<>'.')do begin
        AgregarAlfinal(L,ult, letra);
        writeln('ingrese letra');
        readln(letra);
    end;
end;


Procedure recorridoIda ( pri : lista);

Begin
 if (pri <> NIL) then begin
   writeln(pri^.datos);
   recorridoida(pri^.sig);

 end;
end;

Procedure recorridoVuelta ( pri : lista);

Begin
 if(pri <> NIL) then  begin
   recorridoVuelta( pri^.sig);
   writeln(pri^.datos);


 end;
end;

procedure palindrome(var l:lista; ult:lista;var ok:boolean);
begin

  If (ult <> nil) then begin
      Palindrome (L,ult^.sig,ok);
      If (ok) and (ult^.datos = L^.datos) then
         L:=L^.sig
      else
         ok:=false;
      end;
end;

var
  l,ult:lista;
  ok:boolean;
  n:char;
begin
  l:=nil;
  ult:=nil;
  ok:=true;
  CargarLista(l,ult);
  writeln('recorrido de ida');
  recorridoIda(l);
  writeln('recorrido de vuelta');
  recorridovuelta(l);
  ult:=l;
  palindrome(l,ult,ok);
  if(ok=true)then
    writeln('La palabra es palindrome.')
  else
    writeln('La palabra no es palindrome');
  readln;
end.
