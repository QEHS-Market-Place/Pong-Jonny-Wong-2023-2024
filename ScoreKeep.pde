class ScoreKeep extends Rectangle {
  //Global Variables
  ScoreKeep(float x, float y, float w, float h, color c) {
    super(x, y, w, h, c);
    this.x = refMeasure;
    this.w = height/8;
    this.h = height/8;
  }//end Scoreboard
  //
  //Methods
  void drawing() {
    if (pongOn) draw();
  }//end draw
  void draw() {
    fill(secondaryColor);
    rect(x, y, w, h);
    scoreKeeper();
    if (y == sry) rectText(str(scoreRight));
    if (y == sly) rectText(str(scoreLeft));
  }//end drawing
  void scoreKeeper() {
    if (winConRight) {
      scoreRight++;
      winConRight = false;
    }
    if (winConLeft) {
      scoreLeft++;
      winConLeft = false;
    }
  }//end scoreKeeper
  //
  void mousePressed() {}//end mousePressed
  //
  void keyPressed() {}//end keyPressed
  //
  void keyReleased()  {}//end keyReleased
  //
  void reset() {}//end reset
  //
  float sly, sry;
  void variablesUpdate(float v0, float v1, float v2, float v3, float v4, float v5, float v6, float v7, float v8, float v9, float v10, float v11, float v12, float v13) {
    sly = v0;
    sry = v1;
  }//end variablesUpdate
  //
  color backgroundColor() {
    color nightMode = 0;
    return nightMode;
  }//end backgroundColor
  void rectText(String firstText) {
    drawText( height, ink, CENTER, CENTER, Font, textSpace+textSpace+firstText+textSpace+textSpace, x, y, w, h);
  }//end rectText
}//end Scoreboard
//end ScoreKeep subProgram
