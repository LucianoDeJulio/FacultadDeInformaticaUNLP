program ListaRecursiva;
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

Function Comparar ( l,w: lista): boolean;
var
  ok:boolean;
Begin
 ok:=true;
 while(l <> NIL) and (ok=true) do begin
   if(l^.datos = w^.datos)then begin
     l:=l^.sig;
     w:=w^.sig;
   end
   else
     ok:=false;
 end;
 Comparar:=ok;
end;

Procedure recorridoVuelta ( pri:lista; var c:char);
Begin
 if(pri <> NIL) then  begin
   recorridoVuelta( pri^.sig, c );
   c:=pri^.datos;
 end;
end;

procedure palindrome(l:lista;var ok:boolean);
var
  w,ult:lista;
  c:char;
begin
  recorridoVuelta(l,c);
  AgregarAlFinal(w,ult,c);
  Ok:=Comparar(l,w);
end;

var
  l,ult:lista;
  c:char;
  ok:boolean;
begin
  l:=nil;
  ult:=nil;
  readln(c);
  while(c<>'.')do begin
    agregarAlFinal(l,ult,c);
    readln(c);
  end;
  palindrome(l,ok);
  if(ok=true)then
    Writeln('La palabra es palindrome.')
  else
    Writeln('La palabra no es palindrome.');
  readln;
end.


