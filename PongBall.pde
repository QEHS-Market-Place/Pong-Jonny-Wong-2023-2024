class Ball extends Circle {
  //Global Variables
  float xVelocity, yVelocity;
  Firework firework;
  //
  Ball(float x, float y, float w, float h, color c) {
    super(x, y, w, h, c);
    int referentMeasures = (width<height) ? (width):(height); //ternary Operator = chooses the smaller value
    //object variables //this is "new Ball()"
    this.w = referentMeasures/25;
    this.xVelocity = xDirection()*(width/200);
    this.yVelocity = yDirection()*(width/200);
    this.c = randomColor();
  }//end Ball
  Ball(float x, float y, float w, float h, color c, float xV, float yV) {
    super(x, y, w, h, c);
    this.x = x;
    this.y = y;
    this.w = w;
    this.c = randomColor();
    this.xVelocity = xV/2;//garentees the second ball will not unfairly move towards the paddle at the same time as the first ball
    this.yVelocity = yV/2;//garentees the second ball will not unfairly move towards the paddle at the same time as the first ball
  }//end cheatBall
  //Methods
  void drawing() {
    if (pongOn) draw();
  }//end draw
  void draw() {
    fill(c);
    if (!disappear) {
      ellipse(x, y, w, w);
      winCondition(); 
      if (pongGameOn && !isDelayed) moving();
    }
    explosions();
    if (!pongGameOn || isDelayed) firework.drawing();
    DelayedOn();
    fill(colorReset);
  }//end draw
  //
  void DelayedOn() {
    if (isDelayed && millis() - pauseStartTime >= delayTime) {
      isDelayed = false;
    }
  }//end DelayedOn
  void mousePressed() {
    mousePressedCheatBall(15);
  }//end mousePressed
  void mousePressedCheatBall(int b2) {
    if ( mouseX>=playAreaX+(w/2.1) && mouseX<=playAreaX+playAreaW-(w/2.1) && mouseY>=playAreaY+(w/2) && mouseY<=playAreaY+playAreaH-(w/2) && pongGameOn) {
      shapes.get(b2).disappear = false;
      shapes.get(b2).x = mouseX;
      shapes.get(b2).y = mouseY;
    }
  }//end mousePressedCheatBall
  //
  void keyPressed() {
    if (key == '2') shapes.get(14).disappear = true;
    if (key == '1') shapes.get(15).disappear = true;
    if (key == 'p' || key == 'P') { // Press 'p' or 'P' to toggle pause
      isDelayed = !isDelayed;
      if (isDelayed) {
        pauseStartTime = millis(); // Record the time when pause started
      }
    }
  }//end keyPressed
  //
  void keyReleased()  {}//end keyReleased
  //
  void reset() {
    toCenter(14, 15);
    shapes.get(14).disappear = false;
    shapes.get(15).disappear = true;
  }//end reset
  //
  float xDirection() {
    float xDirectionLocal = int(random(-2, 2));
    while (xDirectionLocal == 0) {
      xDirectionLocal = int(random(-2, 2));
    }
    return xDirectionLocal;
  }//end xDirection
  float yDirection() {
    float yDirectionLocal = int(random(-2, 2));
    while (yDirectionLocal == 0) {
      yDirectionLocal = int(random(-2, 2));
    }
    return yDirectionLocal;
  }//end yDirection
  //
  color backgroundColor() {
    color nightMode = 0;
    return nightMode;
  }//end Night Mode Color Selector
  void bounce() {
    //if (x <= ((w/2)+(width/10)) || firstBall.x >= ((width*9)/10)-(w/2)) c = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
    if (this.x <= (playAreaX+this.w/2) || this.x >= playAreaX+playAreaW-this.w/2) (xVelocity) *= -1;
    if (this.y <= ((playAreaY)+(this.w/2)) || this.y >= (playAreaY+playAreaH)-(this.w/2)) (yVelocity) *= -1;
  }//end bounce
  void moving() {
    x += (xVelocity);
    y += (yVelocity);
    bounce();
    collisionsPaddle();
  }//end animatingMovement
  float playAreaX, playAreaY, playAreaW, playAreaH;
  void collisionPlayArea(float x, float y, float w, float h) {
    playAreaX = x;
    playAreaY = y;
    playAreaW = w;
    playAreaH = h;
  }//end collisonsUpdate
  float paddleX, paddleY, paddleW, paddleH;
  float paddleX1, paddleY1, paddleW1, paddleH1;
  void variablesUpdate(float x, float y, float w, float h, float x1, float y1, float w1, float h1, float v8, float v9, float v10, float v11, float v12, float v13) {
    paddleX = x;
    paddleY = y;
    paddleW = w;
    paddleH = h;
    paddleX1 = x1;
    paddleY1 = y1;
    paddleW1 = w1;
    paddleH1 = h1;
  }//end variablesUpdate
  void winCondition() {
    if (this.x <= (playAreaX+w/2) || this.x >= (playAreaX+playAreaW-w/2)) {
      if (this.x <= (playAreaX+w/2)) {
        winConLeft = true;
        if (scoreLeft < 5) {
          soundEffects[1].rewind();
          soundEffects[1].play();
        } else {
          soundEffects[2].rewind();
          soundEffects[2].play();
        }
        toCenter(14, 15);
        delayedCode();
        //if (!onePlayer && !screenSaver) pongGameOn = false;
      } else {
        winConRight = true;
        if (scoreRight < 5) {
          soundEffects[1].rewind();
          soundEffects[1].play();
        } else {
          soundEffects[2].rewind();
          soundEffects[2].play();
        }
        toCenter(14, 15);
        delayedCode();
        //if (!onePlayer && !screenSaver) pongGameOn = false;
      }
    }
  }//end winCondition
  void delayedCode() {
    isDelayed = !isDelayed;
    if (isDelayed) {
      pauseStartTime = millis(); // Record the time when pause started
    }
  }
  boolean executed = false;
  void explosions() {
    if (!executed) {
      firework = new Firework(x, y, w, w, c);
      executed = true;
    }
    if (winConRight || winConLeft) {
      if (!disappear) {
        firework = new Firework(x, y, w, w, c);
        firework.variablesUpdate(w, 0.5, x, y, playAreaX, playAreaY, playAreaW, playAreaH, 0, 0, 0, 0, 0, 0);
      }
    }
  }//end explosions
  void toCenter(int b1, int b2) {
    if (shapes.get(b2).disappear) {
      this.x = playAreaX+(playAreaW/2);
      this.y = playAreaY+(playAreaH/2);
    } else {
      shapes.get(b1).x = playAreaX+(playAreaW/2);
      shapes.get(b1).y = playAreaY+(playAreaH/2)-(w);
      shapes.get(b2).x = playAreaX+(playAreaW/2);
      shapes.get(b2).y = playAreaY+(playAreaH/2)+(w);
    }
  }//end toCenter
  void collisionsPaddle() {
    if (x >= paddleX+(paddleW/4) && x <= paddleX+(paddleW) && y >= paddleY && y <= paddleY+paddleH) {//left paddle
      //if (pongGameOn) firstPaddle.paddleColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
      soundEffects[0].rewind();
      soundEffects[0].play();
      x = paddleX + paddleW;
      xVelocity *= -1;
    }
    if (x >= paddleX1+(paddleW1/4) && x <= paddleX1+(paddleW1) && y >= paddleY1 && y <= paddleY1+paddleH1) {//right paddle
      //if (pongGameOn) secondPaddle.paddleColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
      soundEffects[0].rewind();
      soundEffects[0].play();
      x = paddleX1-paddleW1;
      xVelocity *= -1;
    }
  }//end collisionsPaddle
}//end Ball
//end PongBall subProgram
