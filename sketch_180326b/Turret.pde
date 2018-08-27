//AI INLUPP 2
//Grupp 11
//Sebastian Bäckström Pino
//Ellinor Gran
//Lovisa Lindström

public class Turret {
  
  float xPos;
  float yPos;
  float radius;
  int cannon_length;
  Shell shell;
  ShellPic shellPic;
  
  public Turret(float xPos, float yPos, float radius, int cannon_length){
    this.xPos = xPos;
    this.yPos = yPos;
    this.radius = radius;
    this.cannon_length = cannon_length;
  }
  
  
  public void drawTurret(){
    strokeWeight(1);
    fill(255);
    ellipse(xPos,yPos,25,25);
    strokeWeight(2);
    line(0, 0, this.cannon_length, 0);
  }
  
  public void drawBomb(int value){
      fill(value);
      ellipse(xPos, yPos, 15, 15);
  }
  
  public void run(){
    display();
  }
  
  public Shell createShell(){
    shell = new Shell(new Vector2D(xPos,yPos), // position
    25, // collision radius
    Vector2D.ZERO, // velocity
    100, // maximum speed
    Vector2D.random(null), // heading
    1.5, // mass
    2.5f, // turning rate
    2500);
    
    return shell;
  }
  
  public void display(){
    drawTurret();
    shell = createShell();
    //shell.run();
    
  }
  
}
