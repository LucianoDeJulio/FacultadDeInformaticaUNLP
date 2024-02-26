{Implementar un programa ListaConRecursion que:

a- Genere una lista de numeros enteros y muestre los valores guardados.

b- Invoque a un modulo recursivo ImprimirEnOrden que imprima los valores contenidos
en la lista en el orden en que se guardaron.

c- Invoque a un modulo recursivo ImprimirOrdenInverso que imprima los valores
contenidos en la lista desde el ultimo dato guardado al primero.}





program imprimirInversa;
type
  lista=^nodo;
  nodo = record
         datos:integer;
         sig:lista;
         end;

procedure AgregarAlFinal (var pri, ult: lista; c:integer);
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

Procedure recorrido ( pri : lista);

Begin
 while(pri <> NIL) do begin
   writeln(pri^.datos);
   pri:=pri^.sig;
 end;
end;

Procedure recorridoIda ( pri : lista);

Begin
 if (pri <> NIL) then begin
   writeln(pri^.datos);
   recorridoIda(pri^.sig);
 end;
end;

Procedure recorridoVuelta ( pri : lista);

Begin
 if(pri <> NIL) then  begin
   recorridoVuelta(pri^.sig);
   writeln(pri^.datos);

 end;
end;


var
  L1,ult:lista;N:integer;
Begin
   l1:=nil;
   ult:=nil;
   Read(N);
   While(N<>0)do begin
     AgregarAlFinal(L1,ult,n);
     readln(n);
    end;
   writeln('Lista 1');
   recorrido(L1);
   writeln;
   readln;
   recorridoida(L1);
   writeln;
   recorridovuelta(L1);
   readln;
End.
