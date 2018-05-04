//AI INLUPP 2
public class Shell extends Vehicle{
  PVector position;
  PVector velocity;
  PVector acceleration;
  int radius;
  boolean isCounting;
  int savedTime;
  int passedTime;
  boolean isLoaded;  // The shot is loaded and ready to shoot (visible on screen.)
  boolean isInMotion; // The shot is on its way.
  boolean isVisible;

  Shell(Vector2D position, double radius, Vector2D velocity, 
  double max_speed, Vector2D heading, double mass, 
  double max_turn_rate, double max_force) {
    super(position, radius, velocity, max_speed, heading, mass, max_turn_rate, 
    max_force);
    this.isInMotion = false;
    this.isCounting = false;
    this.isVisible = true;
  }

   void startTimer() {
    //println("*** CannonBall.startTimer()");
    this.isCounting = true;
    this.savedTime = millis();
    this.passedTime = 0;
    
  }
  
  void resetTimer() {
    //println("*** CannonBall.resetTimer()");
    this.isCounting = false;
    this.savedTime = 0;
    this.passedTime = 0;
    
    this.isInMotion = false;
    this.isLoaded = false;
        
    this.velocity.set(0,0,0);
    this.acceleration.set(0,0,0);
  }
  
  public void drawShell(){
    fill(0);
    ellipse(position.x, position.y, 15, 15);
  }

  public void run(){
    display();
  }
  
  public void display(){
    drawShell();
  }

}
