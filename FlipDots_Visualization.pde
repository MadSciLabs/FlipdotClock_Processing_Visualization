/**
 * Array. 
 * 
 * An array is a list of data. Each piece of data in an array 
 * is identified by an index number representing its position in 
 * the array. Arrays are zero based, which means that the first 
 * element in the array is [0], the second element is [1], and so on. 
 * In this example, an array named "coswav" is created and
 * filled with the cosine values. This data is displayed three 
 * separate ways on the screen.  
 */


int cols = 42;
int rows = 14;

int dist = 3;
int diameter = 25;
int border = 3;

Dot[][] arrDots = new Dot[cols][rows];

class Dot {

  boolean val;
  int row;
  int col;

  Dot (int _col, int _row) {  
    row = _row; 
    col = _col;
    val = false;
  }

  void flip() {
  
    val = !val;  
  }
  
  void set(boolean _val) {
    val = _val; 
  }
  
  void render() {

    if (val) { fill(220); }
    else { fill(50); }

    int _x = col*(dist + diameter);
    int _y = row*(dist + diameter);

    ellipse(_x,_y,diameter,diameter);
  }
}

void setup() {
  size(1200, 600);
  background(0);
  
  for (int i=0; i<rows; i++)
  {
    for (int j=0; j<cols; j++)
    {
      arrDots[j][i] = new Dot(j,i);
    } 
  }

}

void draw() {

  smooth();
  fill(50);
  stroke(0);
  strokeWeight(1);
  
  translate(border + diameter/2, border + diameter/2);
  
  for (int i=0; i<rows; i++) {
    
    for (int j=0; j<cols; j++) {
     
      arrDots[j][i].render();
    }
  }
}

void mouseClicked() {

  print(mouseX + " " + mouseY + "\n");
  
  int _col = mouseX / (diameter + dist);
  int _row = mouseY / (diameter + dist);
  
  print(_col + " " + _row + "\n");
  
  arrDots[_col][_row].flip();
    
}

