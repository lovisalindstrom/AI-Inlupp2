//AI INLUPP 2
//Grupp 11
//Sebastian Bäckström Pino
//Ellinor Gran
//Lovisa Lindström

public class Team{
  
  String teamName;
  color teamColor;

  ArrayList<TankOne> messages = new ArrayList<TankOne>();

  public Team(String teamName){
    this.teamName = teamName;
  }
  
  public String getTeamName(){
    return teamName;
  }

}
