// Simple Hard Coded Stick Figure
// P. Conrad, 7/27/2017

void setup() {
  size(500,500);
  colorMode(RGB,255);
  smooth();  
}

void draw() {

   PVector headCenter = new PVector(100,100);
   float headDiameter = 50;
   float totalHeight=100;
   float legAngleDegrees = 60;
   float armAngleDegrees = 80;
   float legLength = 50;
   float armLength = 40;
   float neckLength = 20;
     
   // crotch height is r sin (-theta) where
   //   theta is (90 - (legAngle / 2.0))
   //       r is lenLength
   
   float crotchHeight =  legLength * sin(-radians(90.0 - legAngleDegrees/(2.0)));
   float bodyHeight = totalHeight - headDiameter - crotchHeight;
   
   PVector bodyTop = PVector.add(headCenter, new PVector(0,headDiameter/2.0));
   PVector bodyBottom = PVector.add(bodyTop, new PVector(0,bodyHeight));
   PVector leftLegEnd =  PVector.add(bodyBottom, polar(legLength, radians(270 - legAngleDegrees/2.0)));
   PVector rightLegEnd = PVector.add(bodyBottom, polar(legLength, radians(270 + legAngleDegrees/2.0)));
   
   PVector shoulder = PVector.add(bodyTop, new PVector(0,neckLength));
   PVector leftArmEnd = PVector.add(shoulder, polar(armLength, radians(270 - armAngleDegrees/2.0)));
   PVector rightArmEnd = PVector.add(shoulder, polar(armLength, radians(270 + armAngleDegrees/2.0)));
   
  ellipse(headCenter.x, headCenter.y, headDiameter, headDiameter); // head
  
  line(bodyTop.x, bodyTop.y, bodyBottom.x, bodyBottom.y); // body
  
  line(bodyBottom.x, bodyBottom.y, leftLegEnd.x, leftLegEnd.y); // left leg
  line(bodyBottom.x, bodyBottom.y, rightLegEnd.x, rightLegEnd.y); // right leg
  line(shoulder.x, shoulder.y, leftArmEnd.x, leftArmEnd.y); // left leg
  line(shoulder.x, shoulder.y, rightArmEnd.x, rightArmEnd.y); // right leg

 }
 
// Source: https://gist.github.com/nataliefreed/8483050
PVector polar(float r, float theta) //converts an angle and radius into a vector
{
  return new PVector(r*cos(theta),r*sin(-theta)); // negate y for left handed coordinate system
}