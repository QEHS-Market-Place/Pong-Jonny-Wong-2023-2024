abstract class Shape {
  //Global Variables
  float x; //X-Variable, Position
  float y; //Y-Variable, Position
  float w; //Width
  float h; //Height
  float el; //left bounce edge, x-pixel
  float er; //right bounce edge, x-pixel
  float plt; // left top paddle y-pixel
  float plb; // left bottom paddle y-pixel
  float prt; // right top paddle y-pixel
  float prb; // right bottom paddle y-pixel
  boolean disappear;
  color c, colorReset;//Shape Color
  //
  Shape(float x, float y, float w, float h, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    colorReset = backgroundColor(); //Populated Once is all constructors and updated constructors
  }//end Shape
  //
  //Methods
  abstract void drawing();
  //
  abstract void mousePressed();
  //
  abstract void keyPressed();
  //
  abstract void keyReleased();
  //
  abstract void reset();
  //
  abstract color backgroundColor();
  //
  abstract void variablesUpdate(float v0, float v1, float v2, float v3, float v4, float v5, float v6, float v7, float v8, float v9, float v10, float v11, float v12, float v13);
  //
}//end Shape
//end Shape subProgram
