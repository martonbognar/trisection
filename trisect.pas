program trisection;
uses crt, graph;
var
i, sz, n            : longint;  // i: loop variable, sz: numerator in the fraction, n: denominator in the fraction
x                   : real;     // x: the fraction that gets multiplied with the original angle
gd, gm              : integer;  // gd, gm: variables necessary for the graphical window
io                  : byte;     // io: used for input checking
angle, t, cx, oc    : integer;  // angle: the original angle, t: the calculated angle, cx: the width of the drawn pieslice, oc: the number of operations
s, ts, as           : string;   // s: used to display the current angle, ts: used to display the current step, as: used to display the current inaccuracy

begin

cx := 500;

initgraph(gd, gm, '');
detectgraph(gd, gm);

write('Enter an angle in degrees: ');
repeat
   {$I-}
   readln(angle);
   {$I+}
   io:=ioresult;
   if io <> 0 then writeln('Please enter a valid number');
   if (angle < 1) and (io = 0) then writeln('Please only enter positive values');
until (io = 0) and (angle > 0);

write('Enter the number of operations: ');
repeat
   {$I-}
   readln(oc);
   {$I+}
   io:=ioresult;
   if io <> 0 then writeln('Please enter a valid number');
   if (oc < 1) and (io = 0)  then writeln('Please only enter positive values');
until (io = 0) and (oc > 0);

writeln('Now look at the graph window application!');

randomize;
setcolor(Random(15)+1);

// draw the original angle
PieSlice(600, 600, angle, 0, cx);

str(angle, s);
s := s + #248;

// print the size of the original angle and the headers
OutTextXY(1200, 180, 'Original:');
OutTextXY(1300, 180, s);
OutTextXY(1300, 200, 'angle');
OutTextXY(1350, 200, '| inaccuracy');

sz := 1;
n := 2;

for i := 1 to oc do begin

    // calculate the current angle size and inaccuracy
    x := sz/n;
    t := round(x*angle);
    x := (1/3)*angle - x*angle;

    str(t, s);
    str(i, ts);
    str(x:9:9, as);
    if (x > 0) then as := '+' + as;

    ts := 'Step ' + ts + ':';
    s := s + #248;
    as := '| ' + as + #248;

    // print data about the current angle
    setcolor(Random(15)+1);
    OutTextXY(1200, 200+20*i, ts);
    OutTextXY(1300, 200+20*i, s);
    OutTextXY(1350, 200+20*i, as);

    cx := cx - 10;

    // draw the current angle
    Pieslice(600, 600, t, 0, cx);

    if (n < 1073741823) then begin
        // this...
        sz := sz * 2;
        n := n * 2;
    end else begin
        OutTextXY(1200, 200+20*i+20, 'Memory limit reached, aborting.');
        break;
    end;

    // ...and this is where the magic happens
    // we are using the following series to get as close to 1/3 as possible: 1/2, 1/4, 3/8, 5/16, 11/32, 21/64, ...
    // (we can do this using only the allowed tools)
    if (i mod 2 = 0) then begin
        sz := sz + 1;
    end else begin
        sz := sz - 1;
    end;

    delay(500);
    
    if i = oc then OutTextXY(1200, 200+20*i+20, 'This was the last step.');

end;

writeln('Demonstration complete, press any key to exit.');
readkey;
closegraph;

end.
