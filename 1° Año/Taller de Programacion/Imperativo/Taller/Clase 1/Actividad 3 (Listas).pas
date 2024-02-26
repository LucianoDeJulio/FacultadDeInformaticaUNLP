{ Implementar el modulo AgregarAdelante (de entero y sin orden)
Implementar el modulo AgregarAtras (de entero y sin orden)
Implementar el modulo InsertarOrdenado (de enteros ordenados de menor a mayor
Implementar el modulo ImplementarLista. El modulo debe mostrar los valores enteros
de la lista recibida por parametro.
Escriba el cuerpo del prog. principal que invoque a todos los modulos}


Program CrearListas;
type
    lista=^nodo;
    nodo=record
               dato:integer;
               sig:Lista;
    end;
Procedure AgregarAdelante(var L :lista; N:integer);
var Nue:lista;
begin
     new(nue);
     nue^.dato:=N;
     nue^.sig:=L;
     L:=nue;
end;

Procedure AgregarAtras (var L:lista; N:integer);
var nue,act:lista;
begin
     new(nue);
     nue^.dato:=N;
     nue^.sig:=nil;
     if(L<>nil)then
     begin
          act:=L;
          while(act^.sig<>nil)do
                                act:=act^.sig;
          act^.sig:=nue;
     end
     else
         L:=nue;
end;
Procedure InsertarOrdenado(var L:lista;N:integer);
 var ant,nue,act:lista;
 begin
      new(nue);
      nue^.dato:=N;
      act:=L;
      ant:=L;
      While (act<>nil)and(act^.dato<N)do begin
            ant:=act;
            act:=act^.sig;
      end;
      if(act=ant)then
                     L:=nue
      else
          ant^.sig:=nue;
      nue^.sig:=act;
end;

Procedure ImprimirLista (L:lista);
Begin
     while(L<>nil)do begin
                     writeln(l^.dato);
                     l:=l^.sig;
     end;
end;

var num:integer; L:lista; L2:lista; L3:lista;
begin
     L:=nil;
     L2:=nil;
     L3:=nil;
     writeln('Ingrese un numero');
     readln(num);
     while(num<>0)do begin
           AgregarAdelante(L,num);
           AgregarAtras(L2,num);
           InsertarOrdenado(L3,num);
           readln(num);
     end;
     writeln('Lista agregar adelante=');
     ImprimirLista(L);
     writeln('Lista agregar Atras=');
     ImprimirLista(L2);
     writeln('Lista insertar ordenado=');
     ImprimirLista(L3);
     readln;
     readln;
end.
