program ListaRecursiva;
type
  lista=^nodo;
  nodo = record
         datos:integer;
         sig:lista;
         end;

Procedure AgregarAdelante 
(var L:lista; per:integer);
Var nue:Lista;
Begin
  New(nue);
  nue^.datos:=per;
  nue^.sig:=L;
  L:=nue;
End;

Procedure recorrido ( pri : lista);

Begin
 while(pri <> NIL) do begin
   writeln(pri^.datos);
   pri:=pri^.sig;
 end;
end;

procedure Maximo(l:lista; var max:integer);
begin
  if(l<>nil)then begin
     if(l^.datos>max)then
       max:=l^.datos;
     maximo(l^.sig,max);
  end;
end;

procedure Minimo(l:lista; var min:integer);
begin
  if(l<>nil)then begin
     if(l^.datos<min)then
       min:=l^.datos;
     minimo(l^.sig,min);
  end;
end;

procedure Buscar(l:lista; var x:boolean; dato:integer);
begin
  if(l<>nil)and(x<>true)then begin
    if(l^.datos=dato)then
      x:=true;
    Buscar(l^.sig,x,dato);
  end;
end;

var
  L:lista;
  N,min,max:integer;
  x:boolean;
Begin
   l:=nil;
   max:=-1;
   min:=9999999;
   Read(N);
   While(N<>0)do begin
     AgregarAdelante(L,N);
     readln(n);
    end;
   writeln('Lista 1');
   recorrido(L);
   writeln;
   Maximo(l,max);
   writeln('Maximo: ',max);
   Minimo(l,min);
   writeln('Minimo: ',min);
   writeln('Ingrese dato a buscar en la lista.');
   readln(n);
   Buscar(l,x,n);
   if(x=true)then
     writeln('Dato encontrado.')
   else
     writeln('Dato no encotrado.');
   readln;
End.
