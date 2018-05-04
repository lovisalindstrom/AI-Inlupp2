HashMap hm = new HashMap();


public void createGraph(){

  for(int x = 10; x < 800; x += 100){
      //System.out.println("test");

    for(int y = 10; y < 800; y += 100){
    
     if(y == 10){
        hm.put(new CordinateKey(x,y), new Node(x,y));
     }else{
       hm.put(new CordinateKey(x,y), new Node(x,y));
       if(hm.get(new CordinateKey(x,y-100)) !=null){
        Node ovan = (Node)hm.get(new CordinateKey(x,y-100));
        Node nuvarande = (Node)hm.get(new CordinateKey(x,y));
        nuvarande.setNorthNode(ovan);
        hm.put(new CordinateKey(x,y), new Node(x,y));
        //System.out.println("ovan: "+ ovan);
        //System.out.println(nuvarande.northNode);
        //System.out.println("-----------------");
       }
       if(y != 10){
         Node bakom = (Node)hm.get(new CordinateKey(x,y-100));
         Node nuvarande = (Node)hm.get(new CordinateKey(x,y));
         //System.out.println("bakom: "+ bakom);
         //System.out.println(nuvarande.northNode);
         //System.out.println("-----------------");
       }
     } 
      
    }    
  }
}

public class Node {
    public String name;
    public Node northNode;
    public Node eastNode;
    public Node southNode;
    public Node westNode;
    public int x,y;
    
    public Node(Node NorthNode, Node EastNode, Node SouthNode, Node WestNode, int x, int y){
      this.northNode = northNode;
      this.eastNode = eastNode;
      this.southNode = southNode;
      this.westNode = westNode;
    }
    public Node(int x, int y){
      this.x = x;
      this.y = y;
    }
    public void setNorthNode(Node nNode){
      this.northNode = nNode;
    }
    public void setEastNode(Node eNode){
      this.eastNode = eNode;
    }
    public void setSouthNode(Node sNode){
      this.southNode = sNode;
    }
    public void setWestNode(Node wNode){
      this.westNode = wNode;
    }
    
    public void addNodes(Node newNorth, Node newEast, Node newSouth, Node newWest ){
      northNode =  newNorth;
      eastNode = newEast;
      southNode= newSouth;
      westNode = newWest;

      
      
    }
    
    public String toString(){
     return "tostring x:"+x + " y: " + y; 
    }
}


public class Graph {
    List<Node> nodes;
}

class CordinateKey {
    private int x;
    private int y;
    
    public CordinateKey(int x, int y){
      this.x = x;
      this.y = y;
    }

    @Override
    public boolean equals(Object obj) {
        if(obj != null && obj instanceof CordinateKey) {
            CordinateKey s = (CordinateKey)obj;
            return x == s.x && y == s.y;
        }
        return false;
    }

    @Override
    public int hashCode() {
        return x * 31 + y;
    }
}
