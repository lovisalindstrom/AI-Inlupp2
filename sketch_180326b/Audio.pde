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
