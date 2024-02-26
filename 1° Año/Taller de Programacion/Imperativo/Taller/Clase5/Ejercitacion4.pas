program Recitales;
const
    dimf=2;
type
    cadena=string[50];
    recital=record
                nombre:cadena;
                duracion: real;
                cantent: integer;
            end;

    recital1=record
                recitales:integer;
                duracion: real;
                cantent: integer;
            end;

    lista=^nodo;
    nodo= record
            dato: recital;
            sig: lista;
           end;
    arbol=^nodo1;
    nodo1= record
               dato: lista;
               anio: integer;
               HI: arbol;
               HD: arbol;
           end;
    vector = array[1..dimf]of lista;



procedure leer(var r:recital; var anio:integer);
begin
    writeln('ingrese el anio');
    readln(anio);
    if(anio<>0) then begin
        writeln('ingrese el nombre de la banda');
        readln(r.nombre);
        Randomize;
        writeln('ingrese la duracion del recital');
        r.duracion:= random(3)+1;
        writeln('ingrese la cantidad de entradas vendidas');
        r.cantent:= random(100)+900;
    end;
end;

Procedure InsertarOrdenado(var L:lista;r:recital);
 var ant,nue,act:lista;
 begin
      new(nue);
      nue^.dato:=r;
      act:=L;
      ant:=L;
      While (act<>nil)and(act^.dato.nombre<r.nombre)do begin
            ant:=act;
            act:=act^.sig;
      end;
      if(act=ant)then
                     L:=nue
      else
          ant^.sig:=nue;
      nue^.sig:=act;
end;

procedure InsertarABB(var a:arbol; dato:recital; anio:integer);
var
  aux:arbol;
begin
  if(a=nil)then begin
    new(aux);
    aux^.dato:=nil;
    aux^.HI:=nil;
    aux^.HD:=nil;
    aux^.anio:=anio;
    InsertarOrdenado(aux^.dato,dato);
    a:=aux;
  end
  else
    if(a^.anio>anio)then
      InsertarABB(a^.HI, dato,anio)
    else
      if(a^.anio<anio)then
        InsertarABB(a^.HD, dato,anio)
        else
          InsertarOrdenado(a^.dato,dato);
end;

procedure CargarArbol(var a:arbol);
var
    r:recital;
    anio:integer;
begin
    leer(r,anio);
    while (anio<>0) do begin
      insertarABB(a,r,anio);
      leer(r,anio);
    end;
end;

procedure imprimirL(l:lista);
begin
  while(l<>nil)do begin
    writeln('Recital: ',l^.dato.nombre);
    l:=l^.sig;
  end;
end;

procedure RecorridoAcotadoAn(a:arbol; inf,sup:integer);
begin
  if(a<>nil)then begin
    if(a^.anio>=inf)then
      if( a^.anio<=sup)then begin
        imprimirL(a^.dato);
        RecorridoAcotadoAn(a^.HI,inf,sup);
        RecorridoAcotadoAn(a^.HD,inf,sup);
      end
      else
        RecorridoAcotadoAn(a^.HI,inf,sup)
    else
      RecorridoAcotadoAn(a^.HD,inf,sup);
  end;
end;


procedure Buscar (a:arbol; var p:lista;dato: integer);
begin
     if(a=nil) then
                p:=nil
     else
         if(dato=a^.anio)then
            p:=a^.dato
         else
             if(dato<a^.anio)then
                  Buscar(a^.HI,p,dato)
             else
                  Buscar(a^.HD,p,dato);
end;

procedure CrearVector(var v:vector; a:arbol);
var
    p:lista;
    anio1,i:integer;
begin
    for i:=1 to dimf do begin
        writeln('ingrese el año');
        readln(anio1);
        Buscar(a,p,anio1);
        while(p=nil) do begin
            writeln('no se encontro el anio e ingrese nuevo anio');
            readln(anio1);
        end;
        v[i]:=p;
    end;
end;

procedure Borrar(var l:lista);
begin
    l:=l^.sig;
end;
procedure buscarMin(var v:vector;var E:lista);
var
    min:cadena;
    i,pos:integer;
begin
    min:='zzz';

    for i:=1 to Dimf do begin
        if (v[i]<>NIl)then
             if(v[i]^.dato.nombre<min)then begin
                    min:=v[i]^.dato.nombre;
                    pos:=i;
                    E:=v[i];
             end;

    end;
    if(min<>'zzz')then
        Borrar(v[pos])
    else
        E:=nil;

end;

procedure Merge(var v:vector);
var
    E:lista;
    aux:recital1;
    NomAct:cadena;
    recitales, entradas:integer;
    promediod,duraciont:real;
begin
    buscarmin(v,E);
    while(E<>nil) do begin
        NomAct:=e^.dato.nombre;
        recitales:=0;
        entradas:=0;
        duraciont:=0;
        while(E<>NIl) and(E^.dato.nombre=NomAct) do begin
            recitales:=recitales+1;
            entradas:= entradas+ e^.dato.cantent;
            duraciont:=duraciont+e^.dato.duracion;
            buscarmin(v,E);
        end;
        promediod:= duraciont/recitales;
        aux.cantent:=entradas;
        aux.duracion:= promediod;
        aux.recitales:= recitales;
        writeln('Banda: ',NomAct,'vendio un total de entradas de ',aux.cantent,' la duracion promedio de los shows es ',
        aux.duracion,' la cantidad de recitales es ',aux.recitales);

    end;
end;
var
    a:arbol;
    sup,inf:integer;
    v:vector;
begin
    CargarArbol(a);
    writeln('ingrese un anio inferior y un anio superior');
    readln(inf);
    readln(sup);
    RecorridoAcotadoAn(a, inf,sup);
    CrearVector(v,a);
    Merge(v);
    readln;
end.




