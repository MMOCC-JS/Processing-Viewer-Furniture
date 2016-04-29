public class VisualizationDirectionLayer {
  private int id;
  
  private int x;
  private int y;
  private int z;
  
  public VisualizationDirectionLayer(XML layer) {
    this.id = layer.getInt("id");
    
    this.x = layer.getInt("x", 0);
    this.y = layer.getInt("y", 0);
    this.z = layer.getInt("z", 0);
  }
  
  public int getId() {
    return this.id;
  }
  
  public int getX() {
    return this.x;
  }
  
  public int getY() {
    return this.y;
  }
  
  public int getZ() {
    return this.z;
  }
}
