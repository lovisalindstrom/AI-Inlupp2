//AI INLUPP 2
//Grupp 11
//Sebastian Bäckström Pino
//Ellinor Gran
//Lovisa Lindström

public class Shell extends Vehicle{
  int health = 10;
  int radius;
  Vector2D position;
  Vector2D velocity;
  Vector2D heading;
  Vector2D lastKnownPos = new Vector2D();
  PVector acceleration;
  boolean collision;
  Turret turret;
  Team team;

  public Shell(Vector2D position, double radius, Vector2D velocity, 
  double max_speed, Vector2D heading, double mass, 
  double max_turn_rate, double max_force){
    super(position, radius, velocity, max_speed, heading, mass, max_turn_rate, 
    max_force);
    this.position = position;
  }

}

public class ShellPic extends PicturePS {
  int head;
  float size;


  public ShellPic(PApplet app, float size, int body) {
    super(app);
    this.size = size;
    this.head = body;
  }

  public ShellPic(PApplet app, float size) {
    this(app, size, color(255, 169, 19));
  }


  public void draw(BaseEntity user, float posX, float posY, float velX, 
  float velY, float headX, float headY, float etime) {
    // Draw and hints that are specified and relevant
    
    Hints.hintFlags = hints;
    Hints.draw(app, user, velX, velY, headX, headY);
    
    // Determine the angle the tank is heading
    float angle = PApplet.atan2(headY, headX);

    // Prepare to draw the entity    
    pushStyle();
    pushMatrix();
    translate(posX, posY);
    rotate(angle);

    // Draw the entity  
    fill(0);
    ellipse(0,0, 15, 15);

    // Finished drawing
    popMatrix();
    popStyle();
  }
}

////AI INLUPP 2
//public class Shell extends Vehicle{
//  Vector2D position;
//  Vector2D velocity;
//  Vector2D heading;
//  Vector2D lastKnownPos = new Vector2D();
//  int radius;
//  boolean isCounting;
//  int savedTime;
//  int passedTime;
//  boolean isLoaded;  // The shot is loaded and ready to shoot (visible on screen.)
//  boolean isInMotion; // The shot is on its way.
//  boolean isVisible;

//  Shell(Vector2D position, double radius, Vector2D velocity, 
//  double max_speed, Vector2D heading, double mass, 
//  double max_turn_rate, double max_force) {
//    super(position, radius, velocity, max_speed, heading, mass, max_turn_rate, 
//    max_force);
//    this.isInMotion = false;
//    this.isCounting = false;
//    this.isVisible = true;
//  }

//   void startTimer() {
//    //println("*** CannonBall.startTimer()");
//    this.isCounting = true;
//    this.savedTime = millis();
//    this.passedTime = 0;
    
//  }
  
//  void resetTimer() {
//    //println("*** CannonBall.resetTimer()");
//    this.isCounting = false;
//    this.savedTime = 0;
//    this.passedTime = 0;
    
//    this.isInMotion = false;
//    this.isLoaded = false;
//  }
  
  
  
//  //public void drawShell(){
//  //  fill(0);
//  //  ellipse(position.x, position.y, 15, 15);
//  //}

//  public void run(){
//    display();
//  }
  
//  public void display(){
//    drawShell();
//  }

//}
