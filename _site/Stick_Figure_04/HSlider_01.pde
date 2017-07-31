// HSlider, based on HScrollbar from processing.org
//  Original: https://processing.org/examples/scrollbar.html
// P. Conrad, 07/31/2017


class HSlider {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;
  int min, max;

  HSlider (float xp, float yp, int sw, int sh, int l, int imin, int imax) {
    min = imin;
    max = imax;
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
    println("sposMin=",sposMin,"sposMax=",sposMax,"swidth=",swidth);
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    } else {
      spos = newspos; 
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
    textAlign(CENTER);
    text(str(getVal()), spos, ypos - 5);
    textAlign(RIGHT);
    text(str(min),xpos-5,ypos + sheight);
    textAlign(LEFT);
    text(str(max),xpos+swidth+5,ypos + sheight);
  }

  int getVal() {
    // Convert 0 to total width of scrollbar into min max
    return int(map(spos,xpos,xpos+swidth-sheight,min,max));
  }
}