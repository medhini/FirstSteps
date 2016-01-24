# FirstSteps
FirstSteps is a language designed to teach basics of programming to beginners. This is our version of the Programming Language LOGO, the first programming language learnt by everyone, in primary school. FirstSteps uses simple commands to draw objects. You can move the turtle across the screen and control its motion using simple commands.

FirstSteps comes in two interfaces : 

1. A terminal interface (Command Line Interface) : Solely built using lex and yacc. In this, the shapes are represented on the terminal using basics symbols.
2. Graphical User Interface : Designed using OpenGL, lex and yacc. Shapes are represented in OpenGL frames using lines, circles and other shapes. Other features were added to enhance the visual appeal of the software and thus provide better user experience. 


To use the Terminal Version, go through the following steps

Compile using following commands

$ lex unixVersion.l

$ yacc -d unixVersion.y

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

HOME to get back to the centre of the screen

CLEAR to clear the screen of all lines


NOTE : You can also write a list of commands and feed it to the program to generate the desired drawing in one go

$ ./logo < star.logo
