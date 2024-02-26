program EjerSupermercado;
const
     dimF=5;
type
     rango = 1..dimF;
     cadena = string [50];
     producto = record
               cod: integer;
               nombre: cadena;
               stock: integer;
               precio: integer;
               rubro: rango;
              end;
     arbol = ^nodo;
     nodo = record
             dato: producto;
             HD: arbol;
             HI: arbol;
           end;

     lista = ^nodo1;
     nodo1= record
            datos: producto;
            sig: lista;
           end;

     vector = array [rango] of lista;


{------------------------------------------------------------------------}

procedure leer(var p:producto);
begin
     writeln('ingrese el codigo del producto');
     readln(p.cod);
     if(p.cod <> 0) then begin
          writeln('ingrese el nombre del producto');
          readln(p.nombre);
          writeln('ingrese el stock actual');
          readln(p.stock);
          writeln('ingrese el precio del producto');
          readln(p.precio);
          writeln('ingrese el rubro del producto');
          readln(p.rubro);
     end;
end;

procedure insertarABB(var a: arbol;p:producto);
var
   aux:arbol;
begin
   if(a = nil) then begin
        new(aux);
        aux^.dato:= p;
        aux^.HI:= nil;
        aux^.HD:= nil;
        a:= aux;
   end
   else
       if(p.cod <= a^.dato.cod) then
            insertarABB(a^.HI,p)
       else
            insertarABB(a^.HD,p);
end;

procedure cargarArbol(var a:arbol);
var
   p: producto;
begin
   leer(p);
   while(p.cod <> 0) do begin
       insertarABB(a,p);
       leer(p);
   end;
end;


{---------------------------------------------------------------------------}

procedure insertarOrdenado(var l: lista; pro: producto);
var
   ant,nue,act: lista;
begin
   new (nue);
   nue^.datos:= pro;
   act:= l;
   ant:= l;
   while(act <> nil) and(act^.datos.cod < pro.cod) do begin
             ant:= act;
             act:= act^.sig;
   end;
   if(ant=act)then
         l:= nue
   else
         ant^.sig:= nue;
   nue^.sig:= act;
end;

procedure cargarVector(var v:vector; pro:producto);
begin
   insertarOrdenado(v[pro.rubro],pro);
end;


procedure recorridoArbol(var a:arbol; var v:vector);
begin
     if(a<> nil) then begin
           a^.dato.precio:= (a^.dato.precio * 2);
           cargarVector(v, a^.dato);
           recorridoArbol(a^.HI,v);
           recorridoArbol(a^.HD,v);

     end;
end;

procedure ImprimirArbol(a:arbol); {preorden: Raiz, HI,HD}
begin
     if(a <> nil) then begin
          writeln(a^.dato.cod);
          writeln(a^.dato.nombre);
          writeln(a^.dato.stock);
          writeln(a^.dato.precio);
          writeln(a^.dato.rubro);
     end;
end;

procedure ImprimirLista(l:lista);
begin
     while(l<>nil) do begin
         writeln('El codigo del producto es: ', l^.datos.cod);
         writeln('El nombre del producto es: ', l^.datos.nombre);
         writeln('El stock disponible es: ', l^.datos.stock);
         writeln('El precio del producto es: ',l^.datos.precio);
     end;
end;

procedure ImprimirVector(v:vector);
var
   i: integer;
begin
     for i:=1 to dimF do begin
         writeln('Se imprime la lista del rubro : ', i);
         ImprimirLista(v[i]);
     end;
end;

{--------------------------------------------------------------------------}
var
   a:arbol;
   v:vector;
begin
  a:=nil;
  cargarArbol(a);
  recorridoArbol(a,v);
  ImprimirArbol(a);
  ImprimirVector(v);
  readln;
end.
