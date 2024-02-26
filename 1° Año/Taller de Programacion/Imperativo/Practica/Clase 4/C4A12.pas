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


Procedure recorridoIda ( pri : lista; var n:char);

Begin
 if (pri <> NIL) then begin
   n:=pri^.datos;
   writeln(pri^.datos);

 end;
end;

Procedure recorridoVuelta ( pri : lista ; var n:char);

Begin
 if(pri <> NIL) then  begin
   recorridoVuelta( pri^.sig,n );
   writeln(pri^.datos);
   n:=pri^.datos;

 end;
end;

procedure palindrome(l:lista;var ok:boolean);
var
  c,z:char;
begin

  if(l<>nil)then begin
    recorridoIda(l,c);
    recorridoVuelta(l,z);
    ok:=true;
    if (ok) then begin
      palindrome(l^.sig,ok);
      writeln('asd');
    end
    else ok:=false;

  end;
  if(l=nil)then
    ok:=true;
end;

var
  l,ult:lista;
  ok:boolean;
  n:char;
begin
  l:=nil;
  ult:=nil;

  readln(n);
  while(n<>'.')do begin
    agregaralFinal(l,ult,n);
    readln(n);
  end;
  palindrome(l,ok);
  if(ok=true)then
    writeln('La palabra es palindrome.')
  else
    writeln('La palabra no es palindrome');
  readln;
end.


