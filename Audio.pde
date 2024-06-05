//Global Variables
Minim minim; //creates an object to access all functions
AudioPlayer[] songs = new AudioPlayer[1]; //creates "Play List" variable holding extensions WAV,AIFF,AU,SND,and MP3
AudioPlayer[] soundEffects = new AudioPlayer[3]; //creates "Play List" variable holding extensions WAV,AIFF,AU,SND,and MP3
String pathway, tokyoCafeSong, ohMyGodSFX, beepSFX, greatSFX; //the songs/SFX
int currentSong = 0; //current song
//
void setupAudio() {
  minim = new Minim (this); //load from data directory
  concatenationOfMusicFiles();
  songs[0] = minim.loadFile(pathway + tokyoCafeSong);//song
  soundEffects[0] = minim.loadFile( pathway + beepSFX ); //sound effect
  soundEffects[1] = minim.loadFile( pathway + greatSFX ); //sound effect
  soundEffects[2] = minim.loadFile( pathway + ohMyGodSFX ); //sound effect
  loopInf(-1);
}//end setupAudio
void concatenationOfMusicFiles() {
  pathway = "data/";
  beepSFX = "short-beep-tone-47916.mp3";//sound effect
  greatSFX = "positive-tone-man-says-great-209738.mp3";
  ohMyGodSFX = "positive-tone-man-says-oh-my-god-186558.mp3";
  tokyoCafeSong = "tvari-tokyo-cafe-159065.mp3";
}//end concatenationOfMusicFiles()
void loopInf(int loopInf) {//loop inf
  songs[currentSong].pause();//substitute for delay() does not break the rest of code
  songs[currentSong].loop(loopInf);
}//end loopInf
void mute() { //mute button
  if ( songs[currentSong].isMuted() ) {//button works when song is not playing
    songs[currentSong].unmute();//switches off .mute()
  } else {//if song is not muted
    songs[currentSong].mute();//mutes song
  }//end mute button
}//end mute
void muteSFX() {
  for ( int i=0; i<soundEffects.length; i++ ) {
    if ( soundEffects[i].isMuted() ) {//button works when song is not playing
      soundEffects[i].unmute();//switches off .mute()
    } else {//if song is not muted
      soundEffects[i].mute();//mutes song
    }//end mute button
  }
}//end muteSFX
//end Audio subProgram
