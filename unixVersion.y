%token LEFT CLEAR RIGHT TOP DOWN TPRT TPLT DNRT DNLT STEPS POSITION HOME ERASER PEN PUP PDOWN

%{
#include <stdio.h>
#include <string.h>
extern int yylineno;
extern char* yytext;
char screen[32][100];
int cx,cy,xctr,yctr;

const char turtle='o';
char draw = '.';
char prvs = ' ';
int pflag=1;
void yyerror(const char *str)
{
        fprintf(stderr,"error: %s at Line %d, after %s\n",str,yylineno,yytext);
	yyparse();
}

int yywrap()
{
        return 1;
}

void display()
{
int i,j;
	for(i=0;i<32;i++)
	{
		printf("\n");

		for(j=0;j<100;j++)
			printf("%c",screen[i][j]);
	}
printf("\nLOGO ~> ");
}  
main()
{
int i=0,j=0;

for(i=0;i<32;i++)
	for(j=0;j<100;j++)
		screen[i][j]=' ';

for (i=0;i<32;i++)
	{
		screen [i][99]='|';
		screen [i][0]='|';
	}

//screen[31][99]='|';
for(j=0;j<99;j++)
	{
	screen [31][j]='_';
	screen [0][j]= '_';
	}
screen[31][0]='|';
screen[16][50]=turtle;
screen[0][0]=screen[0][99]=' ';

cx=16;
cy=50;

display();
yyparse();

}
%}
%%
commands: /* empty */
        | commands command 
        ;

command:
	lt 
	|
	rt
	|
	tp
	|
	dn
	|
	topleft
	|
	downleft
	|
	topright
	|
	downright
	|
	position
	|
	clear
	|
	home
	|
	erase
	|
	pen
	|
	pup
	|
	pdown
	;

lt:
	LEFT STEPS
	{
		printf("Left %d\n",$2);
		yctr=0;
		if(pflag==0)	screen[cx][cy]=prvs;
		while(yctr++<$2) 
		{
			if(pflag)
			screen[cx][cy]=draw;
			cy--;
		}
		prvs=screen[cx][cy];
		screen[cx][cy]=turtle;
		display();
	}
rt:
	RIGHT STEPS
	{
		printf("Right %d\n",$2);
		yctr=0;
		if(pflag==0)	screen[cx][cy]=prvs;
                while(yctr++<$2)
                {
			if(pflag)
                        screen[cx][cy]=draw;
                        cy++;
                }
		prvs=screen[cx][cy];
                screen[cx][cy]=turtle;
                display();

	}
tp:
	TOP STEPS
	{
		printf("Top %d\n",$2);
		xctr=0;
		if(pflag==0)	screen[cx][cy]=prvs;
		while(xctr++<$2)
		{
			if(pflag)
			screen[cx][cy]=draw;
			cx--;
			if(cx < 0)
			{
				cx = 31;
				cy = cy + 1;
			}
		}
		prvs=screen[cx][cy];
		screen[cx][cy]=turtle;
		display();
	}
dn:
	DOWN STEPS
	{
		printf("Down %d\n",$2);
		 xctr=0;
		if(pflag==0)	screen[cx][cy]=prvs;
                while(xctr++<$2)
                {
			if(pflag)
                        screen[cx][cy]=draw;
                        cx++;
			if(cx > 31)
			{
				cx = 0;
				cy = cy - 1;
			}
                }
		prvs=screen[cx][cy];
                screen[cx][cy]=turtle;
                display();

	}

topleft:
	TPLT STEPS
	{
		printf("Top Left %d\n",$2);
		xctr=0;
		yctr=0;
		if(pflag==0)	screen[cx][cy]=prvs;
		int init_y = cy;
		while(xctr++<$2)
		{
			if(pflag)
			screen[cx][cy]=draw;
			cx--;
			cy--;

			if (cx < 0 )
			{
				cx = 31;
				cy = init_y + 17;
				init_y = cy / 2; //fix this
			}
		}	
		prvs=screen[cx][cy];
		screen[cx][cy]=turtle;
		display();
	}
downleft:
	DNLT STEPS
	{
	 	printf("Down Left %d\n",$2);
                xctr=0;
                yctr=0;
		if(pflag==0)	screen[cx][cy]=prvs;
                while(xctr++<$2)
                {
			if(pflag)
                        screen[cx][cy]=draw;
                        cx++;
                        cy--;
                }
		prvs=screen[cx][cy];
                screen[cx][cy]=turtle;
                display();
	}

topright:
        TPRT STEPS
        {
                printf("Top Right %d\n",$2);
                xctr=0;
                yctr=0;
		if(pflag==0)	screen[cx][cy]=prvs;
                while(xctr++<$2)
                {
			if(pflag)
                        screen[cx][cy]=draw;
                        cx--;
                        cy++;
                }
		prvs=screen[cx][cy];
                screen[cx][cy]=turtle;
                display();
        
	}

downright:
        DNRT STEPS
        {
                printf("Down Right %d\n",$2);
                xctr=0;
                yctr=0;
		if(pflag==0)	screen[cx][cy]=prvs;
                while(xctr++<$2)
                {
			if(pflag)
                        screen[cx][cy]=draw;
                        cx++;
                        cy++;
                }
		prvs=screen[cx][cy];
                screen[cx][cy]=turtle;
                display();

        }
position:
	POSITION
	{
		printf("The position of the turtle is ROW : %d COLUMN : %d\n", cx, cy);
		screen[cx][cy]=turtle;
                display();
	}
clear:
	CLEAR
	{
		int i,j;
		for(i=0;i<32;i++)
      			  for(j=0;j<100;j++)
                		screen[i][j]=' ';

		for (i=0;i<32;i++)
        	{
        	        screen [i][99]='|';
        	        screen [i][0]='|';
        	}

		for(j=0;j<99;j++)
        	{
        		screen [31][j]='_';
        		screen [0][j]= '_';
        	}
	screen[31][0]='|';
	screen[cx][cy]=turtle;
	screen[0][0]=screen[0][99]=' ';

	display();
	}
home:
	HOME
	{
	screen[cx][cy]=draw;
			
	cx=16;
	cy=50;
	screen[cx][cy]=turtle;
	display();
	}

erase:
	ERASER
	{
		draw=' ';		
		display();
	}
pen:
	PEN
	{
		draw='.';
		display();
	}
pup:
	PUP
	{
		pflag=0;
		display();
	}
pdown:
	PDOWN
	{
		pflag=1;
		display();
	}
%%

