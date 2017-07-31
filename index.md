# Processing Examples by P. Conrad

A few small examples of programs in Processing.  Many are small variations on
examples from:

*  [Getting Started with Processing](https://www.safaribooksonline.com/library/view/make-getting-started/9781457187070/) by Casey Reas and Ben Fry
   Copyright © 2010 Casey Reas and Ben Fry. 
   Published by O’Reilly Media, Inc.  

Github source is here: <https://github.com/pconrad/processing-examples>

| Example | Description |
|---------|-------------|
| [Example_2_2_color_variation](Example_2_2_color_variation) | A variation on an example from Reas and Fry, with color varying on each frame, cycling through the Hues of the HSB color space (Hue/Saturation/Brightness).  Click to change the color to one that is 180 degrees in Hue from current color.  |
| [FunShapes](FunShapes) | A further variation that allows selecting shapes |
| [Stick_Figure](Stick_Figure) | stick figure with hard coded values |
| [Stick_Figure_02](Stick_Figure_02) | stick figure using variables and `PVector` objects |
| [Stick_Figure_03](Stick_Figure_03) | stick figure via function call, and with keyboard control over arms, legs and position |
| [Stick_Figure_04](Stick_Figure_04) | stick figure with sliders |

# Outline of a Processing Sketch

```processing

void setup() {
 // run once to initialize
}

void draw() {
 // run every frame
}

```

# Some useful idioms

* To clear frame before drawing, use this at top of `draw()`
   ```processing
   background(204); // 204 is the color, in this case, light grey
   ```
   
* To draw a continuous line
   ```processing
   line(mouseX, mouseY, pmouseX, pmouseY);
   ```
   

# Some useful special values 

| Variable Name | Explanation |
|---------------|-------------|
| `framecount` | increments by one with each frame |
| `mousePressed` | is the mouse pressed? |
| `mouseX`,`mouseY` | location of the mouse |
| `pmouseX`,`pmouseY` | location of the mouse during previous frame |