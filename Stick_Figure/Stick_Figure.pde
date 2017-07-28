// A colorful variation on Example 2-2: Make Circles from
// Getting Started with Processing by Casey Reas and Ben Fry
// P. Conrad, 7/27/2017

void setup() {
  size(512,512);
  colorMode(RGB,255);
  smooth();  
}

void draw() {
  ellipse(100,100, 80, 80);
}