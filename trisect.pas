program trisection;
uses crt, dos, graph;
var
i,sz,n                 : longint;
x                      : real;
gd,gm,angle,t,cx,cy,oc : integer;
s,ts,as                : string;

begin

sz := 1;
n := 2;

cx := 500;
cy := 500;

initgraph(gd,gm,'');
detectgraph(gd,gm);

write('Enter an angle in degrees: ');
readln(angle);
write('Enter the number of operations: ');
readln(oc);

writeln('Now look at the graph window application');

randomize;
setcolor(Random(15)+1);

PieSlice(600,600,angle,0,cx);

str(angle,s);
s := s + #248;
OutTextXY(1200,180,'Original:');
OutTextXY(1300,180,s);
OutTextXY(1300,200,'angle');
OutTextXY(1350,200,'| inaccuracy');

for i := 1 to oc do begin
    x := sz/n;
    t := round(x*angle);
    x := (1/3)*angle - x*angle;
    str(t,s);
    str(i,ts);
    str(x:9:9,as);
    ts := 'Step ' + ts + ':';
    s := s + #248;
    as := '| ' + as;
    setcolor(Random(15)+1);
    OutTextXY(1200,200+20*i,ts);
    OutTextXY(1300,200+20*i,s);
    OutTextXY(1350,200+20*i,as);

    cx := cx - 10;

    Pieslice(600,600,t,0,cx);

    if (n < 1073741823) then begin
        sz := sz * 2;
        n := n * 2;
    end else begin
    OutTextXY(1200,200+20*i+20,'Memory limit reached, aborting.');
    break;
    end;

    if (i mod 2 = 0) then begin
        sz := sz + 1;
    end else begin
        sz := sz - 1;
    end;
    delay(500);
end;

writeln('Demonstration complete, press any key to exit.');
readkey;
closegraph;

end.
