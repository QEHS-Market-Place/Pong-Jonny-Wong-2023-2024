//Libraries and Dependencies
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//Global Variables
ArrayList<Shape> shapes = new ArrayList<Shape>();
//
void setup() {
  //size(400, 700);//portrait
  size(700, 400);//landscape
  fullScreen();
  display();
  setupText();
  setupAudio();
  setupPort();
  setupMode();
  setupPong();
}//end setup
//
void draw() {
  drawPong();
  drawMode();
  drawPort();
}//end draw
//
void mousePressed() {
  mousePressedPong();
  mousePressedPort();
}//end mousePressed
//
void keyPressed() {
  keyPressedPort();
  keyPressedPong();
}//end keyPressed
//
void keyReleased() {
  keyReleasedPong();
}//end keyReleased
//end pongApp
