//Global Variables
boolean pongOn = false;
boolean pongGameOn = false;
boolean winConLeft = false;
boolean winConRight = false;
boolean onePlayer = false;
int pauseStartTime;
int delayTime = 3000;
boolean isDelayed = false;
int scoreRight = 0;
int scoreLeft = 0;
//
void setupPong() {
  PongPlayArea pongPlayArea = new PongPlayArea ((width/2)-(width*2/5), height/10, width*4/5, height*7/10, secondaryColor);
  pongPlayArea.variablesUpdate(height/25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  Ball firstBall = new Ball(pongPlayArea.x+(pongPlayArea.w/2), pongPlayArea.y+(pongPlayArea.h/2), 0, 0, 0);
  Ball secondBall = new Ball(firstBall.x, firstBall.y, firstBall.w, 0, 0, firstBall.xVelocity, firstBall.yVelocity);
  Paddle firstPaddle = new Paddle(0, 0, 0, 0, 0);
  Paddle secondPaddle = new Paddle(0, 0, 0, 0, 0);
  firstPaddle.variablesUpdate( pongPlayArea.x+(pongPlayArea.w/2), width/10, firstBall.w, pongPlayArea.y, pongPlayArea.h, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  secondPaddle.variablesUpdate( pongPlayArea.x+pongPlayArea.w/2, width*9/10, firstBall.w, pongPlayArea.y, pongPlayArea.h, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  ScoreKeep leftScoreKeep = new ScoreKeep(0, height/10+height/14+(refMeasure/2), 0, 0, 0);
  ScoreKeep rightScoreKeep = new ScoreKeep(0, leftScoreKeep.y+leftScoreKeep.h+(refMeasure/2), 0, 0, 0);
  leftScoreKeep.variablesUpdate(leftScoreKeep.y, rightScoreKeep.y, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  rightScoreKeep.variablesUpdate(leftScoreKeep.y, rightScoreKeep.y, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  Button pauseGame = new Button(refMeasure, height/10, height/8, height/14, 0); 
  Button resetScore = new Button(refMeasure, rightScoreKeep.y+rightScoreKeep.h+(refMeasure/2), height/8, height/14, 0);
  RectText countDown = new RectText(pongPlayArea.x+(pongPlayArea.w/2)-height/4, pongPlayArea.y+(pongPlayArea.h/2)-height/4, height/2, height/2, 0);
  RectText pausedGameText = new RectText(pongPlayArea.x+(pongPlayArea.w/2)-height/4, pongPlayArea.y+(pongPlayArea.h/2)-height/12, height/2, height/6, background);
  countDown.variablesUpdate(0, countDown.x, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  pausedGameText.variablesUpdate(0, 0, pausedGameText.x, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  pauseGame.variablesUpdate(0, 0, pauseGame.x, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  resetScore.variablesUpdate(0, 0, 0, resetScore.y, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  firstBall.collisionPlayArea(pongPlayArea.x, pongPlayArea.y, pongPlayArea.w, pongPlayArea.h);
  secondBall.collisionPlayArea(pongPlayArea.x, pongPlayArea.y, pongPlayArea.w, pongPlayArea.h);
  firstBall.disappear = false;
  secondBall.disappear = true;
  //
  shapes.add(pongPlayArea); //Element 13, pongPlayArea
  shapes.add(firstBall); //Element 14, firstBall
  shapes.add(secondBall); //Element 15, secondBall
  shapes.add(firstPaddle); //Element 16, firstPaddle
  shapes.add(secondPaddle); //Element 17, secondPaddle
  shapes.add(leftScoreKeep); //Element 18, leftScoreKeep
  shapes.add(rightScoreKeep); //Element 19, rightScoreKeep
  shapes.add(pauseGame); //Element 20, pauseGame
  shapes.add(resetScore); //Element 21, resetScore
  shapes.add(countDown); //Element 22, countDown
  shapes.add(pausedGameText); //Element 23, pausedGameText
}//end setupPong
void drawPong() {
  if (pongOn) drawPongOn( 14, 15, 16, 17 );
}//end drawPong
void mousePressedPong() {
  if (pongOn) mousePressedPongOn();
}//end mousePressedPong
void keyPressedPong() {
  if (pongOn) keyPressedPongOn();
}//end keyPressedPong
void keyReleasedPong() {
  for ( Shape s : shapes ) {
    s.keyReleased();
  }
}//end keyReleasedPong
//
void drawPongOn(int b1, int b2, int p1, int p2) {
  background(background);
  shapes.get(b1).variablesUpdate(shapes.get(p1).x, shapes.get(p1).y, shapes.get(p1).w, shapes.get(p1).h, shapes.get(p2).x, shapes.get(p2).y, shapes.get(p2).w, shapes.get(p2).h, 0, 0, 0, 0, 0, 0);
  shapes.get(b2).variablesUpdate(shapes.get(p1).x, shapes.get(p1).y, shapes.get(p1).w, shapes.get(p1).h, shapes.get(p2).x, shapes.get(p2).y, shapes.get(p2).w, shapes.get(p2).h, 0, 0, 0, 0, 0, 0);
}//end drawPong
void mousePressedPongOn() {}//end mousePressedPong
void keyPressedPongOn() {
  for ( Shape s : shapes ) {
    s.keyPressed();
  }
  if (key == ' ') pongOnOffSwitch();//switches pong on and off
}//end keyPressedPong
void pongOnOffSwitch() {
  if (pongGameOn) { pongGameOn = false; } else { pongGameOn = true; }//switches pong on and off
}//end pongOnOffSwitch
//end Pong subProgram
