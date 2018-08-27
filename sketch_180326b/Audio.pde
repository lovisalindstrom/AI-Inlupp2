//AI INLUPP 2
//Grupp 11
//Sebastian Bäckström Pino
//Ellinor Gran
//Lovisa Lindström

class Audio {
  AudioPlayer audioShot;
  AudioPlayer audioBlast;
  AudioPlayer audioTank;

  Audio() {
    //audioShot = minim.loadFile("shot.mp3");
    audioBlast = minim.loadFile("tankShoting.mp3");
    //audioBlast = minim.loadFile("blast.mp3");
    //audioShot = minim.loadFile("tankMoving.mp3");
    
  }

  //void shot() {
  //  audioShot.rewind();
  //  audioShot.play();
  //}

  void blast() {
    audioBlast.rewind();
    audioBlast.play();
  }
}
