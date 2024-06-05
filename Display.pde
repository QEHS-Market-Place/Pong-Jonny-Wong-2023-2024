//Global Variables
int appWidth, appHeight;
Boolean displayCheck = false;
//
void display() {
  appWidth = width;
  appHeight = height;
  displayCheck = ( appWidth >= appHeight ) ? false : true;
  if (displayCheck) displayLandscapePrompt();
}//end display
void displayLandscapePrompt() {//display error cheack
  println(" ( •, ^ •,) stop");
}//end displaylandscape
//end display subProgram
