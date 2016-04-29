public class VisualizationColor {
  private int id;
  
  private ArrayList<VisualizationColorLayer> layers;
  
  public VisualizationColor(XML tint) {
    this.id = tint.getInt("id");
    
    this.initializeLayers(tint);
  }
  
  private void initializeLayers(XML tint) {
    this.layers = new ArrayList<VisualizationColorLayer>();
    
    XML[] layers = tint.getChildren("colorLayer");
    for (XML layer : layers) {
      this.layers.add(new VisualizationColorLayer(layer));
    } 
  }
  
  public int getId() {
    return this.id;
  }
  
  public VisualizationColorLayer getLayer(int id) {
    for (VisualizationColorLayer layer : this.layers) {
      if (layer.getId() == id) {
        return layer;
      }
    }
    
    return null;
  }
}
