//Global Variables
boolean portOn = true;
float refMeasure;
boolean nightMode = false;
color strokeColor = #FFFBE3;
color background; //= #9EA9F0;
color secondaryColor;// = #CCC1FF;
color hoverOver;// = #8D9EFF;
//
void setupPort() {
  refMeasure = width/50;
  Button quit = new Button(width-width/10, 0, width/10, height/14, 0); 
  Button menuToPong = new Button(refMeasure, (height-(height/8 + refMeasure)), width/6, height/8, 0);
  RectText title = new RectText(width/2-(width*4/10), height/10, width*4/5, height/3, secondaryColor);
  quit.variablesUpdate(quit.x, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  menuToPong.variablesUpdate(0, menuToPong.x, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  title.variablesUpdate(title.x, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  //
  shapes.add(quit); //Element 0, quit
  shapes.add(menuToPong); //Element 1, menuToPong
  shapes.add(title);//Element 2, title
}//end setupPong
void drawPort() {
  nightMode();
  if (portOn) drawPortOn();
  for ( Shape s : shapes ) {
    s.drawing();
  }
}//end drawPong
void mousePressedPort() {
  for ( Shape s : shapes ) {
    s.mousePressed();
  }
}//end mousePressedPong
void keyPressedPort() {
  if (key == '4') portSwitch();//switches pong on and off
}//end keyPressedPong
//
void drawPortOn() {
  background(background);
  for ( Shape s : shapes ) {
    s.reset();
  }
}//end drawPong
void mousePressedPortOn() {}//end mousePressedPong
void keyPressedPortOn() {}//end keyPressedPong
void portSwitch() {
  if (portOn) { 
    portOn = false; 
    pongOn = false;
    modeOn = true;
  } else { 
    portOn = true;
    pongOn = false;
    modeOn = false;
  }
}//end pongOnOffSwitch
void nightMode() {
  //if (!nightMode){ nightMode = true; } else { nightMode = false; }//turing on and off
  if (nightMode){
    tint(64, 64, 40); //RGB: Night Mode
    strokeColor = #FFFDD0;
    secondaryColor = #FFC919 ;//The Button color CCC1FF
    background = #3B3B3B; //The background color 9EA9F0
    hoverOver = #9B9B9B; //hover over color FF0000 8D9EFF
  } else {
    tint(255, 128); //Gray Scale, day use: used 1/2 tint for white (128/255=1/2)
    strokeColor = #FFFBE3;
    secondaryColor = #CCC1FF;//The Button color CCC1FF
    background = #9EA9F0; //The background color 9EA9F0
    hoverOver = #8D9EFF; //hover over color FF0000 8D9EFF
  }
}//end nightMode()
//end Port subProgram
