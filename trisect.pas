program asdf;
uses crt, dos, graph;
var i,sz,n: longint;
x: real;
gd,gm,szog,t,cx,cy: integer;
s: string;
c: char;

begin

sz := 1;
n := 2;

cx := 500;
cy := 500;

initgraph(gd,gm,'');
detectgraph(gd,gm);

readln(szog);
randomize;
setcolor(Random(15)+1);
PieSlice(600,500,szog,0,cx);
//s := ('Az eredeti szog ', szog, #248, '. Ennek a harmada kb ', szog/3);
OutTextXY(100,200,s);

i := 1;

repeat
	setcolor(black);
	OutTextXY(1500,200,s);
	x := sz/n;
	write(x:9:9, ' | ');
	t := round(x*szog);
	write(t, ' | ');
	str(t,s);
	s := s + #248;
	setcolor(Random(15)+1);
	OutTextXY(1500,200,s);
	writeln();
	
	cx := cx - 10;
	
	Pieslice(600,500,t,0,cx);
	
	sz := sz * 2;
	n := n * 2;
	
	if (i mod 2 = 0) then begin
		sz := sz + 1;
	end
	else begin
		sz := sz - 1;
	end;
	i := i + 1;
	c := readkey;
until (c = #27);

closegraph;
readkey;
end.
