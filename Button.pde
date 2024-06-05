class Button extends Rectangle {
  //Global Variables
  //
  Button(float x, float y, float w, float h, color c) {
    super(x, y, w, h, c);
  }//end Button
  //Methods
  void drawing() {
    noStroke();
    universalUI();
    if (modeOn) modeUI();
    if (pongOn) pongUI();
    fill(colorReset);
  }//end Drawing
  void mousePressed() {
    universalMousePressed();
    if (modeOn) modeMousePressed();
    if (pongOn) pongMousePressed();
  }//end mousePressed
  void keyPressed() {}//end keyPressed
  void keyReleased()  {}//end keyReleased
  void reset() {
    resetScore();
    onePlayer = false;
    mai = false;
    eai = false;
    screenSaver = false;
  }//end reset
  float quitX, menuToPongX, pauseX, resetScoreY, twoPlayerX, onePlayerX, haiX, maiX, eaiX, screenSaverX, muteSongX, muteSFXX, nightModeX;
  void variablesUpdate(float v0, float v1, float v2, float v3, float v4, float v5, float v6, float v7, float v8, float v9, float v10, float v11, float v12, float v13) {
    quitX = v0;
    menuToPongX = v1;
    pauseX = v2;
    resetScoreY = v3;
    twoPlayerX = v4;
    onePlayerX= v5;
    haiX = v6;
    maiX = v7;
    eaiX = v8;
    screenSaverX = v9;
    muteSongX = v10;
    muteSFXX = v11;
    nightModeX = v12;
  }//end variablesUpdate
  void universalMousePressed() {
    if (x == quitX) mousePressedExitFunction();
    if (x == menuToPongX) mousePressedMenuToPongFunction();
  }//end universalMousePressed
  void modeMousePressed() {
    if (x == twoPlayerX) mousePressedTwoPlayerFunction();
    if (x == onePlayerX) mousePressedOnePlayerFunction();
    if (x == screenSaverX) mousePressedScreenSaverFunction();
    if (x == muteSongX) mousePressedMuteSongFunction();
    if (x == muteSFXX) mousePressedMuteSFXFunction();
    if (x == nightModeX) mousePressedNightModeFunction();
    if (dmai) {
      if (x == haiX) mousePressedHaiFunction();
      if (x == maiX) mousePressedMaiFunction();
      if (x == eaiX) mousePressedEaiFunction();
    }
  }//end modeMousePressed
  void pongMousePressed() {
    if (x == pauseX) mousePressedPauseGameFunction();
    if (y == resetScoreY) mousePressedResetScoreFunction();
  }//end pongMousePressed
  void universalUI() {
    if (x == quitX) {
      color quitOn = #ff1919;
      color quitOff = #00b530;
      drawing(quitOn, quitOff);
      rectText("Quit");
    }
    if (x == menuToPongX) {
      drawing(hoverOver, secondaryColor);
      rectSwitchingText("Pong", "Menu", portOn);
    }
  }//end universalUI
  void modeUI() {
    if (x == twoPlayerX) {
      drawing(hoverOver, secondaryColor);
      rectText("Two Player");
    }
    if (x == onePlayerX) {
      drawing(hoverOver, secondaryColor);
      rectText("One Player");
    }
    if (x == screenSaverX) {
      drawing(hoverOver, secondaryColor);
      rectText("ScreenSaver");
    }
    if (x == muteSongX) {
      drawing(hoverOver, secondaryColor);
      rectSwitchingText("PlaySong", "MuteSong", songs[currentSong].isMuted());
    }
    if (x == muteSFXX) {
      drawing(hoverOver, secondaryColor);
      //for ( int i=0; i<soundEffects.length; i++ ) {//technically neccesary for mute but makes the text bold when uncommented cause its playing more then once, 
      rectSwitchingText(" PlaySFX ", " MuteSFX ", soundEffects[1].isMuted());//same functionality but not bold text, can be any sfx
      //}
    }
    if (x == nightModeX) {
      drawing(hoverOver, secondaryColor);
      rectSwitchingText("Day Mode", "Night Mode", nightMode);
    }
    if (dmai) {
      if (x == haiX) {
        drawing(hoverOver, secondaryColor);
        rectText("Hard Algorithm");
      }
      if (x == maiX) {
        drawing(hoverOver, secondaryColor);
        rectText("Medium Algorithm");
      }
      if (x == eaiX) {
        drawing(hoverOver, secondaryColor);
        rectText("Easy Algorithm");
      }
    }
  }//end modeUI
  void pongUI() {
    if (x == pauseX) {
      drawing(hoverOver, secondaryColor);
      rectSwitchingText("PAUSE", "PLAY", pongGameOn);
    }
    if (y == resetScoreY && x != quitX) {
      drawing(hoverOver, secondaryColor);
      rectText("Reset");
    }
  }//end pongUI
  void drawing(color hoverOver, color buttonColor) {
    if ( mouseX>=x && mouseX<=x+w && mouseY>=y && mouseY<=y+h )
    {fill(hoverOver);} else {fill(buttonColor);}
    rect(x, y, w, h);
  }//end drawing
  void mousePressedExitFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h )
    exit();
  }//end mousePressedExitFunction
  void mousePressedMenuToPongFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h )
    portSwitch();
  }//end mousePressedMenuToPongFunction
  void mousePressedPauseGameFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h )
    pongOnOffSwitch();
  }//end mousePressedPauseGameFunction
  void mousePressedResetScoreFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h )
    resetScore();
  }//end mousePressedResetScoreFunction
  void resetScore() {
    scoreRight = 0;
    scoreLeft = 0;
  }//end resetScore
  void mousePressedTwoPlayerFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h )
    modeSwitch();
  }//end mousePressedTwoPlayerFunction
  void mousePressedOnePlayerFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h ) {
      pongAiDropMenu();
    }
  }//end mousePressedOnePlayerFunction
  void mousePressedHaiFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h ) {
      onePlayer = true;
      modeSwitch();
    }
  }//end mousePressedHaiFunction
  void mousePressedMaiFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h ) {
      onePlayer = true;
      mai = true;
      modeSwitch();
    }
  }//end mousePressedMaiFunction
  void mousePressedEaiFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h ) {
      onePlayer = true;
      eai = true;
      modeSwitch();
    }
  }//end mousePressedEaiFunction
  void mousePressedScreenSaverFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h ) {
      screenSaver = true;
      modeSwitch();
    }
  }//end mousePressedScreenSaverFunction
  void mousePressedMuteSongFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h ) mute();
  }//end mousePressedMuteSongFunction
  void mousePressedMuteSFXFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h ) muteSFX();
  }//end mousePressedMuteSFXFunction
  void mousePressedNightModeFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h ) nightMode();
  }//end mousePressedNightModeFunction
  void rectText (String firstText) {
    drawText( height, ink, CENTER, CENTER, Font, textSpace+firstText+textSpace, x, y, w, h);
  }//end rectText
  void rectSwitchingText(String firstText, String secondText, boolean boole) {
    if (boole) {
      drawText( height, ink, CENTER, CENTER, Font, textSpace+firstText+textSpace, x, y, w, h);
    } else {
      drawText( height, ink, CENTER, CENTER, Font, textSpace+secondText+textSpace, x, y, w, h);
    }
  }//end rectSwitchingText
  //
  void pongAiDropMenu() {
    if (dmai) {
      dmai = false;
    } else {
      dmai = true;
    }
  }//end dropMenu
  void nightMode() {
    if (nightMode) {
      nightMode = false;
    } else {
      nightMode = true;
    }
  }//end nightMode
  color backgroundColor() {
    color nightMode = 0;
    return nightMode;
  }//end backgroundColor
}//end Button
//end Button subProgram
