//Global Variables
boolean modeOn = false;
boolean dmai = false;//drop down menu for ai
boolean mai = false, eai = false, screenSaver = false;//hard ai, medium ai, easy ai
//
void setupMode() {
  Button onePlayer = new Button(refMeasure, height/10, width/6, height/8, 0);
  Button twoPlayer = new Button(onePlayer.x+width/6+refMeasure/2, onePlayer.y, width/6, height/8, 0);
  Button hai = new Button(onePlayer.x, onePlayer.y+onePlayer.h+(refMeasure/2), width/6, height/14, 0);
  Button mai = new Button(onePlayer.x, hai.y+hai.h+(refMeasure/2), width/6, height/14, 0);
  Button eai = new Button(onePlayer.x, mai.y+mai.h+(refMeasure/2), width/6, height/14, 0);
  Button screenSaver = new Button(twoPlayer.x+width/6+refMeasure/2, twoPlayer.y, width/6, height/8, 0);
  RectText musicSettings = new RectText(width-refMeasure-width/6, height/10, width/6, height/8, secondaryColor);
  Button muteSong = new Button(musicSettings.x, musicSettings.y+musicSettings.h+(refMeasure/2), width/6, height/14, 0);
  Button muteSFX = new Button(musicSettings.x, muteSong.y+muteSong.h+(refMeasure/2), width/6, height/14, 0);
  Button nightMode = new Button(screenSaver.x+screenSaver.w+refMeasure/2, screenSaver.y, width/6, height/8, 0);
  twoPlayer.variablesUpdate(0, 0, 0, 0, twoPlayer.x, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  onePlayer.variablesUpdate(0, 0, 0, 0, 0, onePlayer.x, 0, 0, 0, 0, 0, 0, 0, 0);
  hai.variablesUpdate(0, 0, 0, 0, 0, 0, hai.x, 0, 0, 0, 0, 0, 0, 0);
  mai.variablesUpdate(0, 0, 0, 0, 0, 0, 0, mai.x, 0, 0, 0, 0, 0, 0);
  eai.variablesUpdate(0, 0, 0, 0, 0, 0, 0, 0, eai.x, 0, 0, 0, 0, 0);
  screenSaver.variablesUpdate(0, 0, 0, 0, 0, 0, 0, 0, 0, screenSaver.x, 0, 0, 0, 0);
  musicSettings.variablesUpdate(0, 0, 0, musicSettings.x, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  muteSong.variablesUpdate(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, muteSong.x, 0, 0, 0);
  muteSFX.variablesUpdate(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, muteSFX.x, 0, 0);
  nightMode.variablesUpdate(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nightMode.x, 0);
  //
  shapes.add(onePlayer);//Element 3, onePlayer
  shapes.add(twoPlayer);//Element 4, twoPlayer
  shapes.add(hai);//Element 5, hard ai
  shapes.add(mai);//Element 6, medium ai
  shapes.add(eai);//Element 7, easy ai
  shapes.add(screenSaver);//Element 8, screenSaver
  shapes.add(musicSettings);//Element 9, musicSettings
  shapes.add(muteSong);//Element 10, muteSong
  shapes.add(muteSFX);//Element 11, muteSFX
  shapes.add(nightMode);//Element 12, nightMode
}//end setupPong
void drawMode() {
  if (modeOn) drawModeOn();
}//end drawPong
void mousePressedMode() {
}//end mousePressedPong
void keyPressedMode() {
}//end keyPressedPong
//
void drawModeOn() {
  background(background);
}//end drawPong
void mousePressedModeOn() {}//end mousePressedPong
void keyPressedModeOn() {}//end keyPressedPong
void modeSwitch() {
  portOn = false;
  modeOn = false;
  pongOn = true;
}//end modeSwitch
//end Mode subProgram
