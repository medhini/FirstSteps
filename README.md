# FirstSteps
Programming language for beginners

Compile using following commands

$ lex UnixVersion.l

$ yacc -d UnixVersion.y

$ cc lex.yy.c y.tab.c -o logo


Maximize the terminal for full screen

RUN $ ./logo

Horizontal Motion

TP LT DN RT for Top, Left, Down, Right

examples

TP 6 : Move Top 6 steps

RT 5 : Move Right 5 steps

Diagonal Motion

TOL TOR DOL DOR

For TopLeft, TopRight, DownLeft, DownRight

examples

TOL 5

DOR 6


ERASER for converting to eraser mode. Move over previously drawn lines and this will erase them

PEN to switch back to the Pen mode from eraser

PUP for Pen Up. You can move the turtle without drawing anything on the screen.

PDOWN for Pen Down
