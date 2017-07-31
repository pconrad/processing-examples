void drawStickFigure(PVector headCenter, 
  float headDiameter, 
  float bodyHeight, 
  float legAngleDegrees, 
  float armAngleDegrees, 
  float legLength, 
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