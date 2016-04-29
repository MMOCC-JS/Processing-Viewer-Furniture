import java.util.*;

public class FurnitureViewer {
  private Furniture furniture;
  
  private int x;
  private int y;
  private float z;
  
  private int size;
  private int direction;
  private int animation;
  private int tint;

  private ArrayList<DrawLayer> drawLayers;
  
  public FurnitureViewer(Furniture furniture, int x, int y, float z, int size, int direction, int animation, int tint) {
    this.furniture = furniture;
    
    this.setX(x);
    this.setY(y);
    this.setZ(z);
    this.setSize(size);
    this.setDirection(direction);
    this.setAnimation(animation);
    this.setColor(tint);
    
    this.drawLayers = new ArrayList<DrawLayer>();
  }
  
  public FurnitureViewer(Furniture furniture, int x, int y, float z) {
    this(furniture, x, y, z, 64, furniture.getDirections()[0], 0, 0);
  }
  
  public FurnitureViewer(Furniture furniture) {
    this(furniture, 0, 0, 0);
  }
  
  public void draw() {
    pushMatrix();
    translate(32, 16);
    
    /* furni draw logic */
    FurnitureVisualization visual = this.getCurrentVisualizationData();
    VisualizationAnimation animation = visual.getAnimation(this.animation);
    VisualizationDirection direction = visual.getDirection(this.direction);
    VisualizationColor tint = visual.getColor(this.tint);
    
    this.drawLayers.clear();
    
    for (int layerId = 0; layerId < visual.getLayerCount(); layerId++) {
      DrawLayer drawLayer = new DrawLayer();
      drawLayers.add(drawLayer);
      
      VisualizationLayer layer = visual.getLayer(layerId);
      if (layer != null) {
        drawLayer.setInk(layer.getInk());
        drawLayer.setAlpha(layer.getAlpha());
        
        drawLayer.setZ(layer.getZ());
      }
      
      int frameIndex = 0;
      
      if (animation != null) {
        VisualizationAnimationLayer animationLayer = animation.getLayer(layerId);
        
        if (animationLayer != null) {
          frameIndex = animationLayer.getFrameFromFrameCount(frameCount);
        }
      }
      
      if (direction != null) {
        VisualizationDirectionLayer directionLayer = direction.getLayer(layerId);
        
        if (directionLayer != null) {
          drawLayer.setX(directionLayer.getX());
          drawLayer.setY(directionLayer.getY());
          drawLayer.setZ(directionLayer.getZ());
        }
      }
      
      if (tint != null) {
        VisualizationColorLayer tintLayer = tint.getLayer(layerId);
        
        if (tintLayer != null) {
          drawLayer.setColor(tintLayer.getColor());
        }
      }
      
      AssetImage image = this.furniture.getAssets().getAsset(this.size, layerId, this.direction, frameIndex);
      
      /*if (layerId == 16) {
        println((char)(image.getLayer() + 'a'), drawLayer.getZ(), image.getManifestFile());
      }*/
      
      drawLayer.setImage(image);
    }
    
    Collections.sort(drawLayers);
    
    for (DrawLayer drawLayer : drawLayers) {
      drawLayer.draw();
    }
    /* end */
    
    popMatrix();
  }
  
  public int getX() {
    return this.x;
  }
  
  public void setX(int x) {
    this.x = x;
  }
  
  public int getY() {
    return this.y;
  }
  
  public void setY(int y) {
    this.y = y;
  }
  
  public float getZ() {
    return this.z;
  }
  
  public void setZ(float z) {
    this.z = z;
  }
  
  public int getSize() {
    return this.size;
  }
  
  public void setSize(int size) {
    if (size == 0 || size == 32 || size == 64) {
      this.size = size;
    }
  }
  
  public int getDirection() {
    return this.direction;
  }
  
  public void setDirection(int direction) {
    for (int testDirection : this.furniture.getDirections()) {
      if (testDirection == direction) {
        this.direction = direction;
        
        break;
      }
    }
  }
  
  public int getAnimation() {
    return this.animation;
  }
  
  public void setAnimation(int animation) {
    FurnitureVisualization visual = this.getCurrentVisualizationData();
    if (visual.getAnimation(animation) != null) {
      this.animation = animation;
    }
  }
  
  public int getColor() {
    return this.tint;
  }
  
  public void setColor(int tint) {
    FurnitureVisualization visual = this.getCurrentVisualizationData();
    if (visual.getColor(tint) != null) {
      this.tint = tint;
    }
  }
  
  public Furniture getFurniture() {
    return this.furniture;
  }
  
  public FurnitureVisualization getCurrentVisualizationData() {
    return this.furniture.getVisualizationData(this.size);
  }
}
