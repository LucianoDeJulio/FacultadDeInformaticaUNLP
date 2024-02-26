Procedure BusquedaD( v:vector; ini,fin,dato:integer; var pos:integer );
var
  medio:integer;
begin
  if(fin<0)then
    writeln('No hay elementos.')
  else
    medio:=(ini+fin) div 2;
    if(v[medio]=dato)then
      pos:=medio
    else begin
      if(v[medio]>dato)then begin
        fin:=medio-1;
        BusquedaD(v,ini,fin,dato,pos);
      end
      else
        ini:=medio+1;
        BusquedaD(v,ini,fin,dato,pos);
    end;
end;
