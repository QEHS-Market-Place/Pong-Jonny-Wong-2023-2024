class PongPlayArea extends Rectangle {
  //Global Variables
  float leftGoalXTop, leftGoalYTop, leftGoalXBottom, leftGoalYBottom;
  float rightGoalXTop, rightGoalYTop, rightGoalXBottom, rightGoalYBottom;
  float mPlayAreaX, mPlayAreaYTop, mPlayAreaYBottom;
  //
  PongPlayArea(float x, float y, float w, float h, color c) {
    super(x, y, w, h, c);
  }//end PongPlayArea
  //
  //Methods
  void drawing() {
    if (pongOn) draw();
  }//end draw
  void draw() {
    fill(secondaryColor);
    rect(x, y, w, h); //Pong Table
    stroke(255);
    line(mPlayAreaX, mPlayAreaYTop, mPlayAreaX, mPlayAreaYBottom);
    noStroke();
  }//end drawing
  //
  void mousePressed() {}//end mousePressed
  //
  void keyPressed() {}//end keyPressed
  //
  void keyReleased()  {}//end keyReleased
  //
  void reset() {}//end reset
  //
  color backgroundColor() { //See Night Mode
    color Color=#050500;
    return Color;
  }//end backgroundColor
  //Getters and Setters
  void variablesUpdate( float goalWidth, float v1, float v2, float v3, float v4, float v5, float v6, float v7, float v8, float v9, float v10, float v11, float v12, float v13) {
    leftGoalXTop = x+goalWidth;
    leftGoalYTop = y;
    leftGoalXBottom = leftGoalXTop;
    leftGoalYBottom = leftGoalYTop+h;
    rightGoalXTop = w-goalWidth;
    rightGoalYTop = leftGoalYTop;
    rightGoalXBottom = rightGoalXTop;
    rightGoalYBottom = leftGoalYBottom;
    mPlayAreaX = (x+(w/2)); //Used in Paddle Constructor to create left or right Paddle
    mPlayAreaYTop = leftGoalYTop;//mPlayAreaYTop
    mPlayAreaYBottom = leftGoalYBottom;
  } //Ball Diameter Update
}//end pongPlayArea
//end pongPlayArea subProgram
