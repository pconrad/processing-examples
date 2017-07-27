// A colorful variation on Example 2-2: Make Circles from
// Getting Started with Processing by Casey Reas and Ben Fry
// P. Conrad, 7/27/2017

int hue= 0;
int delta = 1;

void setup() {
  size(512,512);
  colorMode(HSB,360,100,100,100);
  smooth();  
}

void draw() {
  hue = (hue + delta) % 360;
  if ( mousePressed ) {
    fill ( (hue + 180) % 360, 100,100,50);
  } else {
    fill ( (hue), 100,100,50);
  }
  ellipse(mouseX, mouseY, 80, 80);
}