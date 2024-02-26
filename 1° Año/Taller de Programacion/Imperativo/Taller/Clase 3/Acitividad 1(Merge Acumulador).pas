program MergeAcumulador;
const
  dimf = 2;
type
  cadena = String[40];
  consumo = record
            impu:cadena;
            gastop:integer;
            end;
  lista = ^Nodo;
  nodo = record
         dato:consumo;
         sig:lista;
         end;
  vector = array[1..dimf]of lista;

procedure leer(var c:consumo);
begin
  writeln('Ingrese consumo y gasto.');
  readln(c.impu);
  randomize;
  c.gastop:=random (2000)+1;
end;

Procedure InsertarOrdenado(var L:lista;p:consumo);
 var ant,nue,act:lista;
 begin
      new(nue);
      nue^.dato:=p;
      act:=L;
      ant:=L;
      While (act<>nil)and(act^.dato.impu<p.impu)do begin
            ant:=act;
            act:=act^.sig;
      end;
      if(act=ant)then
                     L:=nue
      else
          ant^.sig:=nue;
      nue^.sig:=act;
end;

procedure CargarVector(var v:vector);
var
   p:consumo;
   i:integer;
begin
     randomize;
     i:=random (2)+1;
     Leer(p);
     InsertarOrdenado(v[i],p);
end;
procedure ImprimirLista(l:lista);
begin
     while(l<>nil)do begin
            writeln('el impuesto es: ',l^.dato.impu,' y su monto es: ',l^.dato.gastop);
            l:=l^.sig;
            READLN;
     end;
end;


Procedure ImprimirVector(v:vector);
var i:integer;
begin
     for i:= 1 to 2 do begin
        if(i=1)then
            writeln('los gastos de moni son: ')
        else
            writeln('los gastos de pepe son: ');
        ImprimirLista(v[i]);
     end;
end;

Procedure AgregarAtras (var L:lista; N:lista);
var nue,act:lista;
begin
     act:=L;
     nue:=N;
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

procedure Borrar(var l:lista);
begin
    l:=l^.sig;
end;
procedure buscarMin(var v:vector;var E:lista);
var
    min:CADENA;
    i,pos:integer;
begin
    min:='zzzzzzzz';

    for i:=1 to Dimf do begin
        if (v[i]<>NIl)then
             if(v[i]^.dato.impu<min)then begin
                    min:=v[i]^.dato.impu;
                    pos:=i;
                    E:=v[i];
             end;

    end;
    if(min<>'zzzzzzzz')then
        Borrar(v[pos])
    else
        E:=nil;

end;

procedure Merge(var v:vector; var l:lista);
var
    E,aux:lista;
    ImpAct: cadena;
    GastoTot: integer;
begin
    buscarmin(v,E);
    while(E<>nil) do begin
        ImpAct:=E^.dato.impu;
        GastoTot:=0;
        while(E<>NIl) and(E^.dato.Impu=ImpAct) do begin
            GastoTot:= GastoTot+E^.dato.gastop;
            buscarmin(v,E);
        end;
        new(aux);
        aux^.dato.gastop := GastoTot;
        aux^.dato.impu:= impact;
        agregaratras(l,aux);

    end;
end;
Var
   v:vector;
   l:lista;
   i:integer;
Begin    {programa principal}
   for i:=1 to 10 do
       CargarVector(v);
   ImprimirVector(v);
   writeln;
   Merge(v,l);
   writeln;
   writeln('Lista final.');
   imprimirlista(l);
   readln;
   readln;
End.

