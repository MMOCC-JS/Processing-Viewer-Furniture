public class FurnitureVisualization {
  private int angle;
  private int size;
  private int layerCount;
  
  private ArrayList<VisualizationLayer> layers;
  private ArrayList<VisualizationAnimation> animations;
  private ArrayList<VisualizationDirection> directions;
  private ArrayList<VisualizationColor> colors;
  
  public FurnitureVisualization(XML visualization) {
    this.angle = visualization.getInt("angle");
    this.size = visualization.getInt("size");
    this.layerCount = visualization.getInt("layerCount");
    
    this.initializeLayers(visualization);
    this.initializeAnimations(visualization);
    this.initializeDirections(visualization);
    this.initializeColors(visualization);
  }
  
  private void initializeLayers(XML visualization) {
    this.layers = new ArrayList<VisualizationLayer>();
    
    XML[] layers = visualization.getChildren("layers/layer");
    for (XML layer : layers) {
      this.layers.add(new VisualizationLayer(layer));
    } 
  }
  
  private void initializeAnimations(XML visualization) {
    this.animations = new ArrayList<VisualizationAnimation>();
    
    XML[] animations = visualization.getChildren("animations/animation");
    for (XML animation : animations) {
      this.animations.add(new VisualizationAnimation(animation));
    } 
  }
  
  private void initializeDirections(XML visualization) {
    this.directions = new ArrayList<VisualizationDirection>();
    
    XML[] directions = visualization.getChildren("directions/direction");
    for (XML direction : directions) {
      this.directions.add(new VisualizationDirection(direction));
    }
  }
  
  private void initializeColors(XML visualization) {
    this.colors = new ArrayList<VisualizationColor>();
    
    XML[] colors = visualization.getChildren("colors/color");
    for (XML tint : colors) {
      this.colors.add(new VisualizationColor(tint));
    }
  }
  
  public int getAngle() {
    return this.angle;
  }
  
  public int getSize() {
    return this.size;
  }
  
  public int getLayerCount() {
    return this.layerCount;
  }
  
  public VisualizationLayer getLayer(int id) {
    for (VisualizationLayer layer : this.layers) {
      if (layer.getId() == id) {
        return layer;
      }
    }
    
    return null;
  }
  
  public VisualizationAnimation getAnimation(int id) {
    for (VisualizationAnimation animation : this.animations) {
      if (animation.getId() == id) {
        return animation;
      }
    }
    
    return null;
  }
  
  public VisualizationDirection getDirection(int id) {
    for (VisualizationDirection direction : this.directions) {
      if (direction.getId() == id) {
        return direction;
      }
    }
    
    return null;
  }
  
  public VisualizationColor getColor(int id) {
    for (VisualizationColor tint : this.colors) {
      if (tint.getId() == id) {
        return tint;
      }
    }
    
    return null;
  }
}
