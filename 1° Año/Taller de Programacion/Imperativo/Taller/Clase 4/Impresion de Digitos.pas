{Imprimir digito empezando por la unidad e imprimir digito finalizando con la
unidad.}


program ImprimirDigito1;
procedure digito(n: integer;dig:integer);
begin
    if (n <> 0) then begin
                dig:= n mod 10;
                writeln('el digito es: ',dig);
                n:=n div 10;
                digito(n,dig);
    end;
end;
procedure digito1(n: integer;dig:integer);
begin
    if (n <> 0) then begin
                dig:= n mod 10;
                n:=n div 10;
                digito1(n,dig);
                writeln('el digito es: ',dig);

    end;

end;
var
    n,dig:integer;
begin
    writeln('ingrese un numero');
    readln(n);
    digito(n,dig);
    writeln('de reversa');
    digito1 (n,dig);
    readln;
end.

