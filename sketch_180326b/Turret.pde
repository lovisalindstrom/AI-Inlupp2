//AI INLUPP 2
public class Turret {
  
  //Vector2D position;
  //Vector2D velocity;
  float xPos;
  float yPos;
  float radius;
  int cannon_length;
  boolean hasBomb;
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
    //fill(204, 50, 50);
    fill(255);
    ellipse(xPos,yPos,25,25);
    drawBomb();
    strokeWeight(2);
    line(0, 0, this.cannon_length, 0);
  }
  
  public void drawBomb(){
    if(hasBomb == true){
      fill(255);
      ellipse(xPos, yPos, 15, 15);
    } else {
      fill(0);
      ellipse(xPos, yPos, 15, 15);
      //System.out.println(hasBomb);
    }
  }
  
  public void bombShot2(){
    this.hasBomb = true;
  }
  
  public void bombShot(){
    hasBomb = true;
    //System.out.println(this.hasBomb);
  }
  
  public void bombStay(){
    hasBomb = false;
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
    //shellPic = new ShellPic(Shellpic, (float)25);
    
    return shell;
  }
  
  public void display(){
    drawTurret();
    shell = createShell();
    //shell.run();
    
  }
  
  /*public void shot(){
    Shell.Translate(TankOne.heading(), yPos.heading());
  }*/
}
