%token MOVE LEFT RIGHT FORWARD BACKWARD PEN UP DOWN VALUE SIZE COLOR VAL ERASE NORMAL SHOW HIDE TURTLE EXIT ROTATE HOME CLEARSCREEN SQUARE CIRCLE VA
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <GL/glut.h>
#include <math.h>

#include <GL/glut.h> 
int draw_array[50][4];
int ct=0,turtle=1;

void initGL() {
 
   glClearColor(0.0f, 0.0f, 0.0f, 1.0f); 
	glClear(GL_COLOR_BUFFER_BIT); 
	
}
 
void display() {

   glMatrixMode(GL_MODELVIEW);     
   glLoadIdentity(); 
	glClear(GL_COLOR_BUFFER_BIT); 
   	int a,pen=1;
	int angle = 0;
	float tempX=0.0f,tempY=0.0f;
	float i=0.0f,j=0.0f;
	float r=1.0f,g=0.0f,b=0.0f;
	for(a=0;a<ct;a++)
	{
  		if(draw_array[a][0]==0)
    	{
    		tempY = ((draw_array[a][1])/100.0)*cos(angle*(3.14/180));
    		tempX = ((draw_array[a][1])/100.0)*sin(angle*(3.14/180));
    	}
    	else if(draw_array[a][0]==2)
    	{
    		tempY = ((draw_array[a][1])/100.0)*cos(angle*(3.14/180) + 90*(3.14/180));
            tempX = ((draw_array[a][1])/100.0)*sin(angle*(3.14/180) + 90*(3.14/180));
    	}
    	else if(draw_array[a][0]==4)
    	{
    		tempY = ((draw_array[a][1])/100.0)*cos(angle*(3.14/180) + 180*(3.14/180));
            tempX = ((draw_array[a][1])/100.0)*sin(angle*(3.14/180) + 180*(3.14/180));
    	}
    	else if(draw_array[a][0]==6)
    	{
    		tempY = ((draw_array[a][1])/100.0)*cos(angle*(3.14/180) + 270*(3.14/180));
            tempX = ((draw_array[a][1])/100.0)*sin(angle*(3.14/180) + 270*(3.14/180));
    	}
else if(draw_array[a][0]==1)
        {
            angle += draw_array[a][1];
            tempX=0.0f;
            tempY=0.0f;
        }
		else if(draw_array[a][0]==3)
		 {
			i=0.0f;
			j=0.0f;
			tempX=0.0f;
			tempY=0.0f;
		}
		else if(draw_array[a][0]==8)
		{
			pen=0;
			tempX=0.0f;
			tempY=0.0f;
		}
		else if(draw_array[a][0]==9)
		{
			pen=1;
			tempX=0.0f;
			tempY=0.0f;
		}
		else if(draw_array[a][0]==10)
		{
			r=draw_array[a][1];
			g=draw_array[a][2];
			b=draw_array[a][3];
			tempX=0.0f;
			tempY=0.0f;
		}
		else if(draw_array[a][0]==12)
		 {
			/*float p= 0.707*draw_array[a][1];
			glTranslatef(i,j, 0.0f);
    			  glBegin(GL_LINE_LOOP);              
			      glColor3f(r, g, b); 
			      glVertex2f(p,p);     
			      glVertex2f(-p, p);     
			      glVertex2f(-p, -p);
			      glVertex2f(p, -p);
 			glEnd();
			*/
			tempX=0.0f;
			tempY=(draw_array[a][1])/100.0;
			glBegin(GL_LINES);              
      		glColor3f(r,g,b); 
     		 glVertex2f(i, j);    
      		glVertex2f(i+tempX, j+tempY);     
   		glEnd();
			i+=tempX;
			j+=tempY;
			tempX=(draw_array[a][1])/100.0;
			tempY=0.0f;
			glBegin(GL_LINES);              
      		glColor3f(r,g,b); 
     		 glVertex2f(i, j);    
      		glVertex2f(i+tempX, j+tempY);     
   		glEnd();
			i+=tempX;
			j+=tempY;
			tempX=0.0f;
			tempY=-(draw_array[a][1])/100.0;
			glBegin(GL_LINES);              
      		glColor3f(r,g,b); 
     		 glVertex2f(i, j);    
      		glVertex2f(i+tempX, j+tempY);     
   		glEnd();
			i+=tempX;
			j+=tempY;
			tempX=-(draw_array[a][1])/100.0;
			tempY=0.0f;
			glBegin(GL_LINES);              
      		glColor3f(r,g,b); 
     		 glVertex2f(i, j);    
      		glVertex2f(i+tempX, j+tempY);     
   		glEnd();
			i+=tempX;
			j+=tempY;
			tempX=0.0f;
			tempY=0.0f;
		}
		else if(draw_array[a][0]==13)
		{
			int q,r=draw_array[a][1];
			float x=i,y=j;   
    			glColor3f(r,g,b);
    			glBegin(GL_LINES);
    for (q = 0; q < 360; q+=2)
    {
    x = (r/100.0) * sin(q*(3.14/180));
    y = -(r/100.0) * cos(q*(3.14/180));
    glVertex2f(x + i,y + j);
    
    x = (r/100.0) * sin((q+2)*(3.14/180));
    y = -(r/100.0) * cos((q+2)*(3.14/180));
    glVertex2f(x + i,y +j);
    }
    glEnd();
			tempX=0.0f;
			tempY=0.0f;
		}
		else if(draw_array[a][0]==14)
		{
			int q,r=draw_array[a][1];
			float x=i,y=j;   
    			glColor3f(r,g,b);
    			glBegin(GL_LINES);
    for (q = 0; q < 360; q+=2)
    {
    x = (r/100.0) * sin(q*(3.14/180));
    y = -(r/100.0) * cos(q*(3.14/180));
    glVertex2f(x + i,y + j);
    
    x = (r/100.0) * sin((q+2)*(3.14/180));
    y = -(r/100.0) * cos((q+2)*(3.14/180));
    glVertex2f(x + i,y +j);
    }
    glEnd();
			tempX=0.0f;
			tempY=0.0f;
		}

		if(pen==1)
		{
		glBegin(GL_LINES);              
      		glColor3f(r,g,b); 
     		 glVertex2f(i, j);    
      		glVertex2f(i+tempX, j+tempY);     
   		glEnd();
		}
		i+=tempX;
		j+=tempY;
	}
	

	if(turtle==1)
	{
	glTranslatef(i,j, 0.0f);
      glBegin(GL_QUADS);              
      glColor3f(1.0f, 0.0f, 0.0f); 
      glVertex2f(0.02f, 0.02f);     
      glVertex2f(-0.02f, 0.02f);     
      glVertex2f(-0.02f, -0.02f);
      glVertex2f(0.02f, -0.02f);
 	glEnd();  
 	}
   glFlush();  // Render now
}
 /*
void changeX(float n)
{
	float temp=(n/100.0f);
	glMatrixMode(GL_MODELVIEW);      
   	glLoadIdentity(); 
	glBegin(GL_LINES);              
      	glColor3f(1.0f, 0.0f, 0.0f); 
     	 glVertex2f(i, j);    
      	glVertex2f(i+temp, j);     
   	glEnd();
	;
	i+=temp;
	
}
void changeY(float n)
{
	float temp=(n/100.0f);
	glMatrixMode(GL_MODELVIEW);      
   	glLoadIdentity(); 
	glBegin(GL_LINES);              
      	glColor3f(1.0f, 0.0f, 0.0f); 
     	 glVertex2f(i, j);    
      	glVertex2f(i, j+temp);     
   	glEnd();
	;
	j+=temp;
}*/

int main(int argc, char **argv)
{	
	int i,j;	 
        

glutInit(&argc, argv);
glutInitWindowSize(700,700);   

   glutInitWindowPosition(700, 0); 
        
   int a=glutCreateWindow("LOGO - TURTLE");
   glutDisplayFunc(display);       
   initGL();
   display();
   yyparse();
for(i=0;i<ct;i++)
{	
	yyparse();
printf("I'm Back");
        display();

}
glutDestroyWindow(a);
   //glutMainLoop();            
   return 0;
} 
//0-7 move 1-rotate 3-home && 8-penUp 9-penDown 10-penColor 11-penSize 12-square 
%}
%%
commands: /* empty */
        | commands command 
        ;

command:
        move
	|
	pen_cmd
	|
	turtle_cmd
	;
move:
	MOVE FORWARD VALUE
	{
		draw_array[ct][0]=0;
		draw_array[ct++][1]=$3;
		display();
		
	}|
	MOVE BACKWARD VALUE
	{
		draw_array[ct][0]=4;
		draw_array[ct++][1]=$3;
		display();
		
	}|
	MOVE LEFT VALUE
	{
		draw_array[ct][0]=6;
		draw_array[ct++][1]=$3;
		display();
		
	}|
	MOVE RIGHT VALUE
	{
		draw_array[ct][0]=2;
		draw_array[ct++][1]=$3;
		display();
		
	}|
	ROTATE VAL
	{		
		draw_array[ct][0]=1;
		draw_array[ct++][1]=$2;
	}|
	ROTATE VALUE
	{		
		draw_array[ct][0]=1;
		draw_array[ct++][1]=$2;
	}|
	ROTATE VA
	{		
		draw_array[ct][0]=1;
		draw_array[ct++][1]=$2;
	};
pen_cmd:
	PEN UP
	{
		draw_array[ct++][0]=8;
		display();		
	}|
	PEN DOWN
	{
		draw_array[ct++][0]=9;
		display();		
	}|
	PEN COLOR VAL VAL VAL
	{
		draw_array[ct][0]=10;
		draw_array[ct][1]=$3;
		draw_array[ct][2]=$4;
		draw_array[ct++][3]=$5;
	}|
	PEN SIZE VALUE
	{
		draw_array[ct][0]=11;
		draw_array[ct++][1]=$3;
	}|
	PEN ERASE
	{
		draw_array[ct][0]=10;
		draw_array[ct][1]=0;
		draw_array[ct][2]=0;
		draw_array[ct++][3]=0;
	}|
	PEN NORMAL
	{
		draw_array[ct][0]=10;
		draw_array[ct][1]=255;
		draw_array[ct][2]=0;
		draw_array[ct++][3]=0;
	}	
	;
turtle_cmd:
	SHOW TURTLE
	{
		turtle=1;
		display();
	}|
	HIDE TURTLE
	{	
		turtle=0;
		display();
	}|
	EXIT
	{
	 exit(0);
	}|
	HOME
	{
		draw_array[ct++][0]=3;
		display();			
	}|
	CLEARSCREEN
	{
		memset(draw_array,0,sizeof(draw_array[0][0])*50*4);
		ct=0;
		display();
	}|
	SQUARE VALUE
	{
		draw_array[ct][0]=12;
		draw_array[ct++][1]=$2;
		display();
	}|
	CIRCLE VALUE
	{
		draw_array[ct][0]=13;
		draw_array[ct++][1]=$2;
		display();
	}
	;
%%
yyerror(s)
char *s;
{
  fprintf(stderr, "%s\n",s);
}
 
int yywrap()
{
        return 1;
} 
