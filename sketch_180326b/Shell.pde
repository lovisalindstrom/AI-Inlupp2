public class Shell{
  PVector position;
  PVector velocity;
  int radius;

  Shell(float x, float y, int radius) {
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    this.radius = radius;
  }

  public void movement(){

  
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
