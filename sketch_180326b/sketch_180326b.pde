//AI INLUPP 2
//Grupp 11
//Sebastian Bäckström Pino
//Ellinor Gran
//Lovisa Lindström

import game2dai.entities.*;
import game2dai.entityshapes.ps.*;
import game2dai.maths.*;
import game2dai.*;
import game2dai.entityshapes.*;
import game2dai.fsm.*;
import game2dai.steering.*;
import game2dai.utils.*;
import game2dai.graph.*;
import java.util.*;
import ddf.minim.*;

World world;
Minim minim;
StopWatch sw;
Obstacle ob1;
Obstacle ob2;
Obstacle ob3;
TankOne t1t1;
TankOne t1t2;
TankOne t1t3;
TankOne t1t4;
TankOne t1t5;
TankOne t1t6;
Team teamA;
Team teamB;
ArrayList <TankOne> tanks = new ArrayList<TankOne>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();

int savedTime;
int totalTime = 180;

TankPic tankPic;
BitmapPic obstaclePic;

void setup() {
  minim = new Minim(this);
  createGraph();
  size(800, 800);
  teamA = new Team("teamA");
  teamB = new Team("teamB");
  Domain domain = new Domain(0, 0, 800, 800);

  t1t1 = createTank(domain,40, 50,teamA);
  t1t2 = createTank(domain,40, 150,teamA);
  t1t3 = createTank(domain,40, 250,teamA);
  t1t4 = createTank(domain,760, height-50,teamB);
  t1t5 = createTank(domain,760, height-150,teamB);
  t1t6 = createTank(domain,760, height-250,teamB);

  ob1 = createObstacle(domain, 230, 600);
  ob2 = createObstacle(domain, 280, 220);
  ob3 = createObstacle(domain, 530, 520);
  
  world = new World(800, 800);
  sw = new StopWatch();
  int selectedHint = -1;
  selectedHint = Hints.HINT_VIEW;
  t1t1.renderer().showHints(selectedHint);
  t1t2.renderer().showHints(selectedHint);
  t1t3.renderer().showHints(selectedHint);
  t1t4.renderer().showHints(selectedHint);
  t1t5.renderer().showHints(selectedHint);
  t1t6.renderer().showHints(selectedHint);
  
  world.add(t1t1);
  world.add(t1t2);
  world.add(t1t3);
  world.add(t1t4);
  world.add(t1t5);
  world.add(t1t6);
  world.add(ob1);
  world.add(ob2);
  world.add(ob3);
  sw.reset();
  savedTime = millis();

}

  void displayHomeBaseTeam1() {
  strokeWeight(1);
  fill(204, 50, 50, 15);
  rect(0, 0, 150, 350);
}

void displayHomeBaseTeam2() {
  strokeWeight(1);
  fill(0, 150, 200, 15);
  rect(width - 151, height - 351, 150, 350);
}

public void timer(){
  int passedTime = ((millis() - savedTime) / 1000);
  //System.out.println(passedTime);
  if(passedTime > totalTime){
    exit();
  }
}

void draw(){
  
  timer();
  t1t1.runTank();
  t1t2.runTank();
  t1t3.runTank();
  t1t4.runTank();
  t1t5.runTank();
  t1t6.runTank();
  double elapsedTime = sw.getElapsedTime();
  world.update(elapsedTime);
  background(255);
  displayHomeBaseTeam1(); 
  displayHomeBaseTeam2();
  world.draw(elapsedTime);
  
}

public TankOne createTank(Domain domain,int xPos,int yPos, Team team){
  tankPic = new TankPic(this, (float)50, team);
  TankOne tank = new TankOne(new Vector2D(xPos,yPos), // position
  25, // collision radius
  Vector2D.ZERO, // velocity
  70, // maximum speed
  Vector2D.random(null), // heading
  1.5, // mass
  2.5f, // turning rate
  2500,
  team,
  tankPic);
  //if(movement){
  //  tank.AP().obstacleAvoidOn().wanderOn();
  //  tank.AP().wanderOn().wanderFactors(60, 30, 20);
  //  tank.AP().obstacleAvoidDetectBoxLength(15);
  //}
  tanks.add(tank);


  tank.worldDomain(domain, SBF.REBOUND);
  tank.viewFactors(260, PApplet.TWO_PI/7);
  tank.renderer(tankPic);
  return tank;
}
  
public Obstacle createObstacle(Domain domain,int xPos,int yPos) {
  Obstacle ob = new Obstacle(new Vector2D(xPos, yPos), 100);
  obstaclePic = new BitmapPic(this, "data/tree01_v2.png");
  obstacles.add(ob);
  ob.renderer(obstaclePic);
  return ob;
}
