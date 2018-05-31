//AI INLUPP 2
public class TankOne extends Vehicle{
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
  long start = System.currentTimeMillis();
  TankPic tankPic;

  //Audio
  Audio myAudio;
  AudioPlayer audioBlast;
  AudioPlayer audioShot;
  
  //Timer
  boolean waitingOver = true;
  int savedTime;
  int totalTime = 3000;

  public TankOne(Vector2D position, double radius, Vector2D velocity, 
  double max_speed, Vector2D heading, double mass, 
  double max_turn_rate, double max_force, Team team, TankPic tankPic){
    super(position, radius, velocity, max_speed, heading, mass, max_turn_rate, 
    max_force);
    this.radius = 20;
    this.position = position;
    this.health = 3;
    this.team = team;
    this.tankPic = tankPic;
    this.turret = new Turret(tankPic.posX,tankPic.posY,30,6);

  }
  
  void setup(){
  savedTime = millis();

  waitingOver = true;
  System.out.println("sdasdasdasdasdasdasdasdasd");
  }

  public void moveForward(){
    position.add(velocity);

  }
  

  public void lookForTank() {
    for (int i = 0; i < tanks.size(); i++) {
      if (canSee(world, tanks.get(i).pos()) && tanks.get(i) != this) {
        //System.out.println("HITTAD");
        long finish = System.currentTimeMillis();
        System.out.println(finish-start);
        
        if(finish-start > 3000 && this.team.getTeamName() != tanks.get(i).team.getTeamName()){
          System.out.println(turret);
          //this.turret.bombShot();
          turret.bombShot2();
          System.out.println(turret.hasBomb);
          myAudio = new Audio();
          myAudio.blast();
          waitingOver = false;
          savedTime = millis();
          start = System.currentTimeMillis();
        }
      }else{
       //System.out.println("INTE HITTAD"); 
      }
    }
    
  }
  
  private void timer(){
  int passedTime = (millis() - savedTime);
  System.out.println(passedTime);
  if(passedTime > totalTime){
    waitingOver = true;
  }
}
  
  public void rotateCounterClock(){

    
  }

  public void rotateClock(){

    
  }
  
 

  
  public void drawTank(){
    fill(128, 204, 255);
    ellipse((float)position.x,(float)position.y,50,50);
    strokeWeight(2);
    line((float)position.x, (float)position.y, (float)position.x, (float)position.y+25);
    strokeWeight(1);
  }
  
  void run(){
    display();
    keyPressed();
  }
  
  
  
  void display() {
    drawTank();

    turret.run();
  }

}


public class TankPic extends PicturePS {
  Turret turret;
  Team team;
  int head;
  float size;
  int health;
  float posX,posY;
  public TankPic(PApplet app, float size, int body, Team team) {
    super(app);
    this.size = size;
    this.head = body;
    this.health = 3;
    this.team = team;
  }

  public TankPic(PApplet app, float size, Team team) {
    this(app, size, color(255, 169, 19), team);
    this.health = 3;
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
    timer();

    // Draw the entity  
    if(team.getTeamName() == "teamA"){
      fill((((255/6) * health) * 40), 50, 50, 255 - health*60);
    }else if(team.getTeamName() == "teamB"){
      fill(0, 0, ((255/6) * health) * 40, 255 - health*60);
    }
    ellipse(0,0, 50, 50);
    strokeWeight(2);
    line(0, 0, 25, 0);
    
    turret = new Turret(0, 0, 20, 25);
    turret.display();
    

    // Finished drawing
    popMatrix();
    popStyle();
  }
}
