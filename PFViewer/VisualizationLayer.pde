public class VisualizationLayer {
  private int id;
  
  private int alpha;
  private String ink;
  
  //private int x;
  //private int y;
  private int z;
  
  public VisualizationLayer(XML layer) {
    this.id = layer.getInt("id");
    
    this.alpha = layer.getInt("alpha", 255);
    this.ink = layer.getString("ink", "BLEND");
    
    //this.x = layer.getInt("x", 0);
    //this.y = layer.getInt("y", 0);
    this.z = layer.getInt("z", 0);
  }
  
  public int getId() {
    return this.id;
  }
  
  public int getAlpha() {
    return this.alpha;
  }
  
  public String getInk() {
    return this.ink;
  }
  
  /*public int getX() {
    return this.x;
  }
  
  public int getY() {
    return this.y;
  }*/
  
  public int getZ() {
    return this.z;
  }
}
