abstract class Circle extends Shape {
  //Global Variables
  //
  Circle(float x, float y, float w, float h, color c) {
    super(x, y, w, h, c);
  }//end Circle
  //Methods
  abstract void drawing();//end draw
  //
  abstract void mousePressed();
  //
  abstract void keyPressed();
  //
  abstract void keyReleased();
  //
  abstract void variablesUpdate(float v0, float v1, float v2, float v3, float v4, float v5, float v6, float v7, float v8, float v9, float v10, float v11, float v12, float v13);
  //
  abstract void reset();
  //
  abstract color backgroundColor();//end Night Mode Color Selector
  //
  color randomColor() {
    color chosenColor;
    chosenColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
    return chosenColor;
  }//end randomColor
}// end Circle
//end Circle subProgram
