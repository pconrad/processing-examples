// Simple Hard Coded Stick Figure
// P. Conrad, 7/27/2017

void setup() {
  size(200,300);
  colorMode(RGB,255);
  smooth();  
}

void draw() {
  
  ellipse(100,100, 40, 40); // head
  
  line(100,120, 100, 200); // body
  
  line(100,200, 75, 240); // left leg
  line(100,200, 125, 240); // right leg

  line(100,150, 50, 180); // left arm
  line(100,150, 150, 180); // right arm

 }