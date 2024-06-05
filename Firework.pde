class Firework extends Circle {
  //Global Variables
  float  gravity = 0.0;
  float firstBallW;
  float playAreaX, playAreaY, playAreaW, playAreaH;
  int sparks = 10;//the amount of balls generated
  float[] fx = new float[sparks];
  float[] fy = new float[sparks];
  float[] fw = new float[sparks]; 
  color[] fc = new color[sparks];
  float[] xVelocity = new float[sparks];
  float[] yVelocity = new float[sparks];
  //
  Firework(float x, float y, float w, float h, color c) {
    super(x, y, w, h, c);
  }//Fireworks
  //Methods
  void drawing() {
    draw();
  }//end draw
  void draw() {
    for ( int i=0; i<fx.length; i++ ) {
      fill(fc[i]);
      if (fy[i] <= playAreaY+playAreaH-(fw[i]/2)) {//deletes the ball before it leaves the play area
        ellipse(fx[i], fy[i], fw[i], fw[i]);
      }
      fill(colorReset);
    }
    moving();
  }//end draw
  //
  void mousePressed() {}//end mousePressed
  //
  void keyPressed() {}//end keyPressed
  //
  void keyReleased()  {}//end keyReleased
  //
  void reset() {}//end reset
  //
  void variablesUpdate(float v0, float g, float v2, float v3, float v4, float v5, float v6, float v7, float v8, float v9, float v10, float v11, float v12, float v13) {
    playAreaX = v4;
    playAreaY = v5;
    playAreaW = v6;
    playAreaH = v7;
    firstBallW = v0;
    for ( int i=0; i<fx.length; i++ ) {
      gravity = g;
      this.fx[i] = v2;
      this.fy[i] = v3;
      this.xVelocity[i] = random(-5, 5);
      this.yVelocity[i] = random(-5, 5);
      this.fc[i] = randomColor(); //RGB color
      this.fw[i] = random(firstBallW/1.1);
    }
  }//end variablesUpdate
  color backgroundColor() {
    color nightMode = 0;
    return nightMode;
  }//end backgroundColor
  //
  void bounce() {
    for ( int i=0; i<fx.length; i++ ) {
      if (fx[i] <= ((fw[i]/2)+(playAreaX)) || fx[i] >= (playAreaX + playAreaW)-(fw[i]/2)) (xVelocity[i]) *= -1;
      if (fy[i] <= ((playAreaY)+(fw[i]/2)) || fy[i] >= (playAreaY+playAreaH)-(fw[i]/2)) (yVelocity[i]) *= -1;
    }
  }//end bounce
  void moving() {
    for ( int i=0; i<fx.length; i++ ) {
      yVelocity[i] += gravity;
      fx[i] += (xVelocity[i]);
      fy[i] += (yVelocity[i]);
    }
    bounce();
  }//end moving
}//end Firework
//end Firework subProgram
