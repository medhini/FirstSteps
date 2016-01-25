# FirstSteps
FirstSteps is a language designed to teach basics of programming to beginners. This is our version of LOGO, the first programming language learnt by most primary school students. FirstSteps uses simple commands to control the motion of a turtle across a screen and draw objects. It is an efficient tool to introduce the concept of programming and can strengthen analytical skills and creativity of young minds.

<b> FirstSteps comes in two interfaces : </b>

1. A terminal interface (Command Line Interface) : Solely built using lex and yacc. In this, the shapes are represented on the terminal using basics symbols.
2. Graphical User Interface : Designed using OpenGL, lex and yacc. Shapes are represented in OpenGL frames using lines, circles and other shapes. Other features were added to enhance the visual appeal of the software and thus provide better user experience. 

#Installation
To use the Terminal Version, go through the following steps

Compile using following commands

```
$ lex unixVersion.l

$ yacc -d unixVersion.y

$ cc lex.yy.c y.tab.c -o logo
```


Maximize the terminal for full screen

RUN $ ./logo

Horizontal Motion

TP LT DN RT for Top, Left, Down, Right

Examples

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

Contributors :

1. Medhini G N
2. Suryansh Kumar
