//AI INLUPP 2
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
