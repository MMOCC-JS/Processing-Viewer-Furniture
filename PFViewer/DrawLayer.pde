public class DrawLayer implements Comparable<DrawLayer> {
  private AssetImage image;
  
  private String ink;
  private int alpha;
  
  private int tint;
  
  private int x;
  private int y;
  private int z;
  
  public DrawLayer() {
    this.image = null;
    
    this.ink = "BLEND";
    this.alpha = 255;
    
    this.tint = 0xFFFFFFFF;
    
    this.x = 0;
    this.y = 0;
    this.z = 0;
  }
  
  public void draw() {
    if (this.image != null && this.image.getResource() != null) {
      pushMatrix();
      translate(this.x, this.y);
      tint(this.tint, this.alpha);
      
      if (this.image.getFlipH() == 1) {
        scale(-1, 1);
      }
      
      if (this.image.getFlipV() == 1) {
        scale(1, -1);
      }
      
      if (this.ink.equals("BLEND")) {
        this.image.draw();
      }
      else {
        this.image.drawBlend(this.getBlendMode());
      }
      
      tint(0xFF); // reset tint
      popMatrix();
    }
  }
  
  @Override
  public int compareTo(DrawLayer drawLayer) {
    return this.z - drawLayer.z;
  }
  
  public int getBlendMode() {
    if (this.ink.equals("ADD")) {
      return ADD ;
    }
    else if (this.ink.equals("COPY")) {
      return REPLACE;
    }
    
    return BLEND;
  }
  
  public AssetImage getImage() {
    return this.image;
  }
  
  public void setImage(AssetImage image) {
    this.image = image;
  }
  
  public String getInk() {
    return this.ink;
  }
  
  public void setInk(String ink) {
    this.ink = ink;
  }
  
  public int getAlpha() {
    return this.alpha;
  }
  
  public void setAlpha(int alpha) {
    this.alpha = alpha;
  }
  
  public int getColor() {
    return this.tint;
  }
  
  public void setColor(int tint) {
    this.tint = tint;
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
  
  public int getZ() {
    return this.z;
  }
  
  public void setZ(int z) {
    this.z = z;
  }
}
