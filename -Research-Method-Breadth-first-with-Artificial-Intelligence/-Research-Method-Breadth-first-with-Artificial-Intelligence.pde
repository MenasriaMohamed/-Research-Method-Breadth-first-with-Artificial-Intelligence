
PImage img;
int tour;
int i, j, w , h ;
float r,g,b;
public ArrayList<point> ch = new ArrayList<point>();
pile c = new pile();

int [][]obst={{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
             {1,0,0,0,0,1,2,0,0,0,0,0,0,0,0,1},
             {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
             {1,1,1,1,1,0,0,0,0,0,1,1,0,0,0,1},
             {1,1,0,1,1,1,0,1,0,0,0,0,0,0,0,1},
             {1,0,0,0,1,0,0,1,1,1,1,1,0,0,0,1},
             {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
             {1,0,0,0,0,3,0,0,0,0,0,0,1,0,0,1},
             {1,0,0,0,1,0,0,0,0,0,0,0,1,0,0,1},
             {1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,1},
             {1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1},
             {1,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1},
             {1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1},
             {1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1},
             {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
             {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}}; 

void setup() {
  size(512, 512);
  img = loadImage("im.jpg");
 w=img.width;
 h=img.height;
 tour=0;
 loadPixels();
  img.loadPixels();
c.p.add(new point(2,1,6));
}



void draw() {
for (int x = 0; x < w; x++ ) {
    for (int y = 0; y < h; y++ ) {

     int loc = x + y*w;
      int stepx=w/16;
      int stepy=h/16;
      i= y/stepy; j=x/stepx;
      int val=obst[i][j];
      switch (val)
      {
        case 0: r= 0; g=0; b=0; break;
        case 1: r= 0; g=0; b=255; break;
        case 2: r= 255; g=0; b=0; break;
        case 3: r= 0; g=255; b=0; break;
      }      
      color c = color(r, g, b);
      pixels[loc]=c;      
    }
  }
  
 if(c.p.size()!=0 && obst[c.p.get(c.p.size()-1).x -1][c.p.get(c.p.size()-1).y]!=3 
 && obst[c.p.get(c.p.size()-1).x+1][c.p.get(c.p.size()-1).y]!=3 &&
 obst[c.p.get(c.p.size()-1).x][c.p.get(c.p.size()-1).y-1]!=3 && obst[c.p.get(c.p.size()-1).x][c.p.get(c.p.size()-1).y+1]!=3)
{ 
 


if(c.p.get(c.p.size()-1).lef==false ) 
{ 
  if(obst[c.p.get(c.p.size()-1).x][c.p.get(c.p.size()-1).y-1]==1) c.p.get(c.p.size()-1).lef= true ;
  else{ 
  c.p.get(c.p.size()-1).lef= true ;
  
  point d =new point(2, c.p.get(c.p.size()-1).x,c.p.get(c.p.size()-1).y-1) ;
    if(!c.vif(d))
  {
  c.p.get(c.p.size()-1).num =0 ;
  obst[c.p.get(c.p.size()-1).x][c.p.get(c.p.size()-1).y]=0;
  obst[c.p.get(c.p.size()-1).x][c.p.get(c.p.size()-1).y-1]=2;

  d.ret= true ;
  c.p.add(d);
  }
  
  }
}else{

if(c.p.get(c.p.size()-1).Dow==false ) 
{ if(obst[c.p.get(c.p.size()-1).x+1][c.p.get(c.p.size()-1).y]==1) c.p.get(c.p.size()-1).Dow= true ;
  else{ 
  c.p.get(c.p.size()-1).Dow= true ;
  
  point d =new point(2, c.p.get(c.p.size()-1).x+1,c.p.get(c.p.size()-1).y) ;
    if(!c.vif(d))
  {
  c.p.get(c.p.size()-1).num =0 ;
  obst[c.p.get(c.p.size()-1).x][c.p.get(c.p.size()-1).y]=0;
  obst[c.p.get(c.p.size()-1).x+1][c.p.get(c.p.size()-1).y]=2;

  d.Up =true ;
  c.p.add(d);
  
  }
  }
}else{

if(c.p.get(c.p.size()-1).ret==false ) 
{ if(obst[c.p.get(c.p.size()-1).x][c.p.get(c.p.size()-1).y+1]==1) c.p.get(c.p.size()-1).ret= true ;
  else{ 
  c.p.get(c.p.size()-1).ret= true ;
  
  point d =new point(2, c.p.get(c.p.size()-1).x,c.p.get(c.p.size()-1).y+1) ;
     if(!c.vif(d))
  {
  c.p.get(c.p.size()-1).num =0 ;
  obst[c.p.get(c.p.size()-1).x][c.p.get(c.p.size()-1).y]=0;
  obst[c.p.get(c.p.size()-1).x][c.p.get(c.p.size()-1).y+1]=2;

  
  d.lef =true ;
  c.p.add(d);
  }
  
  }

}else{
if(c.p.get(c.p.size()-1).Up==false ) 
{ if(obst[c.p.get(c.p.size()-1).x-1][c.p.get(c.p.size()-1).y]==1) c.p.get(c.p.size()-1).Up= true ;
  else{ 
  c.p.get(c.p.size()-1).Up= true ;
  
  point d =new point(2, c.p.get(c.p.size()-1).x-1,c.p.get(c.p.size()-1).y) ;
     if(!c.vif(d))
  {
  c.p.get(c.p.size()-1).num =0 ;
  obst[c.p.get(c.p.size()-1).x][c.p.get(c.p.size()-1).y]=0;
  obst[c.p.get(c.p.size()-1).x-1][c.p.get(c.p.size()-1).y]=2;

  d.Dow =true;
  c.p.add(d);
 
  }
  }

}else{
obst[c.p.get(c.p.size()-1).x][c.p.get(c.p.size()-1).y]=0;
c.p.remove(c.p.size()-1);
obst[c.p.get(c.p.size()-1).x][c.p.get(c.p.size()-1).y]=2;

          }

        }


    }

  }
}
   
  delay(30) ;
  
  updatePixels(); 
  if(tour==-1)exit();
}
public class point {
int num ;
int  x , y;
Boolean Up = false, Dow= false , lef = false, ret = false ; 
public point (int num ,int x ,  int y)
{
this.num = num ;
this.x = x ;
this.y = y ;
}




}







public class pile{
public ArrayList <point> p = new ArrayList<point>() ; 


public boolean vif(point d)
{ for(point c : p)
  {
  if(c.x==d.x && c.y == d.y) return true ;
  
  }
return false ;
}


}
