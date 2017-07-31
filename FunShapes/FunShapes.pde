// A colorful variation on Example 2-2: Make Circles from
// Getting Started with Processing by Casey Reas and Ben Fry
// P. Conrad, 7/27/2017

char shape = 'c';

int hue= 0;
int hueDelta = 4;
float shapeDelta = 20.0;

float prevShapeX=0, prevShapeY=0;

void setup() {
  size(512,512);
  colorMode(HSB,360,100,100,100);
  smooth();  
}

void draw() {
  if (keyPressed) {
   if (key=='c' || key == 'C') {
      shape = 'c'; 
   } else if (key=='r' || key == 'R') {
      shape = 'r'; 
   } else if (key=='s' || key == 'S') {
      shape = 's'; 
   }
    
  }
  if (mousePressed && dist(prevShapeX,prevShapeY,mouseX,mouseY) > shapeDelta) {
    hue = (hue + hueDelta) % 360;
    fill ( (hue), 100,100,50);
    switch(shape) {
      case 'c': 
      ellipse(mouseX, mouseY, 80, 80);
      break;
    case 'r': 
      rect(mouseX, mouseY, 80, 80);
      break;
    case 's': 
      star(mouseX, mouseY, 80, 20, 5);  
      break;
    default:             
      break;
    }
    
    prevShapeX = mouseX; prevShapeY = mouseY;
  }
  
}