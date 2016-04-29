public class VisualizationDirection {
  private int id;
  
  private ArrayList<VisualizationDirectionLayer> layers;
  
  public VisualizationDirection(XML direction) {
    this.id = direction.getInt("id");
    
    this.initializeLayers(direction);
  }
  
  private void initializeLayers(XML animation) {
    this.layers = new ArrayList<VisualizationDirectionLayer>();
    
    XML[] layers = animation.getChildren("layer");
    for (XML layer : layers) {
      this.layers.add(new VisualizationDirectionLayer(layer));
    }
  }
  
  public int getId() {
    return this.id;
  }
  
  public VisualizationDirectionLayer getLayer(int id) {
    for (VisualizationDirectionLayer layer : this.layers) {
      if (layer.getId() == id) {
        return layer;
      }
    }
    
    return null;
  }
}
