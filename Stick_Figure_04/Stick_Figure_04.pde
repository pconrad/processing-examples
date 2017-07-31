// Stick Figure with function and slides
// P. Conrad, 7/31/2017

PVector headCenter = new PVector(250, 350);
PFont font;

HSlider armAngle, legAngle, headDiameter, bodyHeight, armLength, legLength, neckLength;

void setup() {
  size(500, 500);
  colorMode(RGB, 255);
  font = loadFont("SansSerif-12.vlw");
  textFont(font);
  smooth();
  armAngle = new HSlider(150.0, 40.0, 300, 16, 2, 120, 270);
  legAngle = new HSlider(150.0, 80.0, 300, 16, 2, 10, 180);
  headDiameter = new HSlider(150.0, 120.0, 300, 16, 2, 10, 100);
  bodyHeight = new HSlider(150.0, 160.0, 300, 16, 2, 10, 100);
  armLength = new HSlider(150.0, 200.0, 300, 16, 2, 10, 80);
  legLength = new HSlider(150.0, 240.0, 300, 16, 2, 10, 80);
  neckLength = new HSlider(150.0, 280.0, 300, 16, 2, 10, 40);
}



void draw() {
  background(255);
  textSize(12);
  
  
  fill(#208040); textAlign(LEFT); 
  text("armAngle",10,armAngle.ypos+armAngle.sheight);
  armAngle.update(); armAngle.display();
  
  fill(#208040);textAlign(LEFT); 
  text("legAngle",10,legAngle.ypos+legAngle.sheight);
  legAngle.update(); legAngle.display();

  fill(#208040);textAlign(LEFT); 
  text("headDiameter",10,headDiameter.ypos+headDiameter.sheight);
  headDiameter.update(); headDiameter.display();
 
  fill(#208040);textAlign(LEFT); 
  text("bodyHeight",10,bodyHeight.ypos+bodyHeight.sheight);
  bodyHeight.update(); bodyHeight.display();

  fill(#208040);textAlign(LEFT); 
  text("armLength",10,armLength.ypos+armLength.sheight);
  armLength.update(); armLength.display();

 fill(#208040);textAlign(LEFT); 
  text("legLength",10,legLength.ypos+legLength.sheight);
  legLength.update(); legLength.display();


  fill(#208040);textAlign(LEFT); 
  text("neckLength",10,neckLength.ypos+neckLength.sheight);
  neckLength.update(); neckLength.display();
  
  drawStickFigure( headCenter, 
    headDiameter.getVal(),
    bodyHeight.getVal(), 
    legAngle.getVal(),
    armAngle.getVal(),
    legLength.getVal(), 
    armLength.getVal(), 
    neckLength.getVal());
}

// Source: https://gist.github.com/nataliefreed/8483050
PVector polar(float r, float theta) //converts an angle and radius into a vector
{
  return new PVector(r*cos(theta), r*sin(-theta)); // negate y for left handed coordinate system
}