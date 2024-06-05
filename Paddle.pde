class Paddle extends Rectangle {
  //Global Variables
  float ballX, ballY, ballW;//ball variables
  float pay;//playAreaY //smallest Y value for paddle movement height/10
  float pah;//playAreaHeight
  float pam;//playAreaMiddle
  float sp;//starting position
  float paddleTravel;
  Boolean paddleUp = false, paddleDown = false;//keyPressed
  //
  Paddle(float x, float y, float w, float h, color c) {
    super(x, y, w, h, c);
    this.c = randomColor();
  }//end Paddle
  //Methods
  void drawing() {
    if (pongOn) draw();
  }//end drawing
  //
  void draw() {
    fill(c);
    if ( x < pam ) {
      rect( x, y, w, h);//draws left padddle
    } else {
      rect( x, y, w, h);//draws right paddle
    }
    if (pongGameOn && !isDelayed) paddleMove();
  }//end draw
  //
  void mousePressed() {}//end mousePressed
  //
  void keyPressed() {
    if (!onePlayer) {
      twoPlayerKeyPressed();
    } else if (!screenSaver) {
      onePlayerKeyPressed();
    } else {
      //empty no paddle movement
    }
  }//end keyPressed
  void variablesUpdate(float playAreaMiddle, float startingPosition, float ballw, float playAreaY, float playAreaH, float v5, float v6, float v7, float v8, float v9, float v10, float v11, float v12, float v13) {//sp = starting position
    ballW = ballw;
    pay = playAreaY;//smallest Y value for paddle movement height/10
    pah = playAreaH;
    pam = playAreaMiddle;
    sp = startingPosition;
    paddle();
  }//end variablesUpdate
  //
  void keyReleased()  {
    if (x < pam) {
      if (key == 'w' || key == 'W') {
        this.paddleDown = false;
        this.paddleUp = false;
      }
      if ( key == 's' || key == 'S') {
        this.paddleUp = false;
        this.paddleDown = false;
      }
    } else  {
      if (key == CODED && keyCode == UP) {
        this.paddleDown = false;
        this.paddleUp = false;
      }
      if (key == CODED && keyCode == DOWN) {
        this.paddleUp = false;
        this.paddleDown = false;
      }
    }
  }//end keyReleased
  //
  void reset() {
    pongGameOn = false;
    this.y = (pay) + (pah/2) - (h/2);
  }//end reset
  //
  void paddleMove() {
    if (paddleUp) paddleUp();
    if (paddleDown) paddleDown();
    if (onePlayer) rightPaddleAI(14);
    if (screenSaver) screenSaver(14);
  }//end paddleMove
  void paddleUp() {
    y -= (paddleTravel);//moving up
    if (y < pay) y = pay;//error catch: will not go off screen
  }//end paddleUp
  void paddleDown() {
    y += (paddleTravel);//moving down
    if (y > pay+pah-h) y = pay+pah-h;//error catch: will not go off screen
  }//end paddleDown
  void rightPaddleAI(int b1) {
    ballUpdate(shapes.get(b1).x, shapes.get(b1).y);
    if ( ballX > pam ) {
      if (x > pam) {
        if (mai || eai) {
          mediumEasyai();
        } else {//impossible ai
          hai();
        }
      }
    }
    errorCatchAi();
  }//end rightPaddleAI
  //
  void screenSaver(int b1) {
    ballUpdate(shapes.get(b1).x, shapes.get(b1).y);
    haimai();
    if ( ballX > pam ) {
      if (x > pam) {//rightPaddle
        if (mai || eai) {
          mediumEasyai();
        } else {//impossible ai
          hai();
        }
      }
    } else {
      if (x < pam) {//leftPaddle
        if (mai || eai) {
          mediumEasyai();
        } else {//impossible ai
          hai();
        }
      }
    }
    errorCatchAi();
  }//end screenSaver
  void haimai() {
    float whatToPick = random(200);
    if (whatToPick > 50) { 
      mai = true;
    } else {
      mai = false;
    }
  }
  void hai() {
    if (this.y+(this.h/2) <= (ballY) || this.y+(this.h/2) >= (ballY)) {
      if (this.y+(h/2) <= (ballY)) {//medium Ai
        this.y += this.paddleTravel;
      } else {
        this.y -= this.paddleTravel;
      }
    }
  }//end hai
  void mediumEasyai() {
    float demarcation = 0;//degree to which the paddle will miss
    if (mai) {//medium ai
      demarcation = random(pah);//degree to which the paddle will miss
    } else {//easy ai
      demarcation = random(pah*2);//degree to which the paddle will miss
    }
    if (this.y+(this.h/2)+demarcation <= (ballY) || this.y+(this.h/2)-demarcation >= (ballY)) {
      if (this.y+(this.h/2)+demarcation <= (ballY)) {//medium Ai
        this.y += this.paddleTravel;
      } else {
        this.y -= this.paddleTravel;
      }
    }
  }//end mediumEasyai
  void errorCatchAi() {
    if (this.y < pay || this.y > pay+pah-this.h) {//error catch
      if (this.y < pay) {
        this.y = pay;
      } else {
        this.y = pay+pah-this.h;
      }
    }
  }//end errorCatchAi
  void ballUpdate(float v0, float v1) {
    ballX = v0;
    ballY = v1;
  }//end ballUpdate
   void twoPlayerKeyPressed() {
    if (x < pam) {
      if (key == 'w' || key == 'W') {
        this.paddleDown = false;
        this.paddleUp = true;
      }
      if ( key == 's' || key == 'S') {
        this.paddleUp = false;
        this.paddleDown = true;
      }
    } else {
      if (key == CODED && keyCode == UP) {
        this.paddleDown = false;
        this.paddleUp = true;
      }
      if (key == CODED && keyCode == DOWN) {
        this.paddleUp = false;
        this.paddleDown = true;
      }
    }
  }//end twoPlayerKeyPressed
  void onePlayerKeyPressed() {
    if (x < pam) {
      if (key == 'w' || key == 'W') {
        this.paddleDown = false;
        this.paddleUp = true;
      }
      if ( key == 's' || key == 'S') {
        this.paddleUp = false;
        this.paddleDown = true;
      }
    }
  }//end onePlayerKeyPressed
  void paddle() {
    float goalX, goalW;
    float startPositionDifferent = 0.25;//has to be decimal
    goalW = (ballW*3);
    this.h = (pah * startPositionDifferent);
    this.y = (pay) + (pah/2) - (h/2);
    this.w = (ballW/2);//ball radius
    if ( sp < pam ) {
      goalX = sp;
      el += goalW+w;//edge Left
    } else {
      goalX = sp-(goalW*2)-w;
      x -= w;
      er += goalW-w;//edge Right
    }
    this.x = goalX+goalW;
    this.paddleTravel = (pah/50);//paddle speed
  }//end paddle
  //
  color backgroundColor() {
    color nightMode = 0;
    return nightMode;
  }//end backgroundColor
}//end Paddle
//end Paddle SubProgram
