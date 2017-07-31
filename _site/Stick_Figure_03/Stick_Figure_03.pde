// Stick Figure with function
// P. Conrad, 7/30/2017

PVector headCenter = new PVector(250, 250);
float headDiameter = 50;
float bodyHeight=100;
float legAngleDegrees = 60;
float armAngleDegrees = 120;
float legLength = 50;
float armLength = 40;
float neckLength = 20;
PFont font;

void setup() {
  size(500, 500);
  colorMode(RGB, 255);
  font = loadFont("Serif-24.vlw");
  textFont(font);
  smooth();
}

void drawStickFigure(PVector headCenter, 
  float headDiameter, 
  float bodyHeight, 
  float legAngleDegrees, 
  float armAngleDegrees, 
  float lenLength, 
  float armLength, 
  float neckLength) {
  // crotch height is r sin (-theta) where
  //   theta is (90 - (legAngle / 2.0))
  //       r is lenLength


  PVector bodyTop = PVector.add(headCenter, new PVector(0, headDiameter/2.0));
  PVector bodyBottom = PVector.add(bodyTop, new PVector(0, bodyHeight));
  PVector leftLegEnd =  PVector.add(bodyBottom, polar(legLength, radians(270 - legAngleDegrees/2.0)));
  PVector rightLegEnd = PVector.add(bodyBottom, polar(legLength, radians(270 + legAngleDegrees/2.0)));

  PVector shoulder = PVector.add(bodyTop, new PVector(0, neckLength));
  PVector leftArmEnd = PVector.add(shoulder, polar(armLength, radians(270 - armAngleDegrees/2.0)));
  PVector rightArmEnd = PVector.add(shoulder, polar(armLength, radians(270 + armAngleDegrees/2.0)));

  fill(255);
  ellipse(headCenter.x, headCenter.y, headDiameter, headDiameter); // head

  line(bodyTop.x, bodyTop.y, bodyBottom.x, bodyBottom.y); // body

  line(bodyBottom.x, bodyBottom.y, leftLegEnd.x, leftLegEnd.y); // left leg
  line(bodyBottom.x, bodyBottom.y, rightLegEnd.x, rightLegEnd.y); // right leg
  line(shoulder.x, shoulder.y, leftArmEnd.x, leftArmEnd.y); // left leg
  line(shoulder.x, shoulder.y, rightArmEnd.x, rightArmEnd.y); // right leg
}


void draw() {
  background(255);
  textSize(24);
  fill(#208040);
  
  text("Use up/down arrow keys to move arms", 30, 30);
  text("Use right/left arrow keys to move legs", 30, 60);
  text("Use AWSD keys to stick figure", 30, 90);
  
  if (keyPressed) {
  
   if (key == 'A' || key=='a') {
      headCenter.x --;   
    }
   else if (key == 'W' || key=='w') {
      headCenter.y --;   
    }
   else if (key == 'S' || key=='s') {
      headCenter.y ++;   
    }
   else if (key == 'D' || key=='d') {
      headCenter.x ++;   
    }

    
    else if (key == CODED) {  // If it’s a coded key
      if (keyCode == UP && armAngleDegrees < 270.0) {
        armAngleDegrees++;
      } else if (keyCode == DOWN && armAngleDegrees > 10.0) {
        armAngleDegrees--;
      } else if (keyCode == LEFT && legAngleDegrees < 180.0) {
        legAngleDegrees++;
        println(legAngleDegrees);
      } else if (keyCode == RIGHT && legAngleDegrees > 10.0) {
        legAngleDegrees--;
        println(legAngleDegrees);
      }
    }
  }

  drawStickFigure( headCenter, 
    headDiameter, 
    bodyHeight, 
    legAngleDegrees, 
    armAngleDegrees, 
    legLength, 
    armLength, 
    neckLength);
}

// Source: https://gist.github.com/nataliefreed/8483050
PVector polar(float r, float theta) //converts an angle and radius into a vector
{
  return new PVector(r*cos(theta), r*sin(-theta)); // negate y for left handed coordinate system
}