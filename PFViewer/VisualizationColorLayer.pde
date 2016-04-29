public class VisualizationColorLayer {
  private int id;
  
  private int tint;
  
  public VisualizationColorLayer(XML layer) {
    this.id = layer.getInt("id");
    
    String tint = layer.getString("color").toUpperCase();
    
    this.tint = 0xFF000000 | Integer.parseInt(tint, 16);
  }
  
  public int getId() {
    return this.id;
  }
  
  public int getColor() {
    return this.tint;
  }
}
