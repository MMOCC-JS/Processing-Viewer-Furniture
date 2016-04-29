public class VisualizationAnimation {
  private int id;
  
  private ArrayList<VisualizationAnimationLayer> layers;
  
  public VisualizationAnimation(XML animation) {
    this.id = animation.getInt("id");
    
    this.initializeLayers(animation);
  }
  
  private void initializeLayers(XML animation) {
    this.layers = new ArrayList<VisualizationAnimationLayer>();
    
    XML[] layers = animation.getChildren("animationLayer");
    for (XML layer : layers) {
      this.layers.add(new VisualizationAnimationLayer(layer));
    } 
  }
  
  public int getId() {
    return this.id;
  }
  
  public VisualizationAnimationLayer getLayer(int id) {
    for (VisualizationAnimationLayer layer : this.layers) {
      if (layer.getId() == id) {
        return layer;
      }
    }
    
    return null;
  }
}
