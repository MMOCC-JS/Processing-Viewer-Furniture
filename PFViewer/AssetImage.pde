public class AssetImage { // IDrawable interface?!
  private ManifestFile manifestFile;
  private PImage resource;
  
  private int x;
  private int y;
  
  private int size;
  private int layer;
  private int direction;
  private int frame;
  
  private int flipH;
  private int flipV;
  
  public AssetImage(ManifestFile manifestFile, XML asset) {
    this.manifestFile = manifestFile;
    this.resource = this.manifestFile.getImage();
    
    this.x = asset.getInt("x");
    this.y = asset.getInt("y");
    
    this.flipH = asset.getInt("flipH", 0);
    this.flipV = asset.getInt("flipV", 0);
    
    this.size = 0;
    this.layer = 0;
    this.direction = 0;
    this.frame = 0;
    
    this.initializeByName(asset.getString("name"));
  }
  
  private void initializeByName(String name) {
    String[] nameParts = split(name, "_");
    int i = nameParts.length;
    
    if (nameParts[i - 1].equals("small")) {
      // nothing i guess?
    }
    else if (nameParts[i - 2].equals("icon")) {
      this.layer = this.parseLayerByString(nameParts[--i]);
    }
    else
    {
      this.frame = Integer.parseInt(nameParts[--i]);
      this.direction = Integer.parseInt(nameParts[--i]);
      this.layer = this.parseLayerByString(nameParts[--i]);
      this.size = Integer.parseInt(nameParts[--i]);
    }
  }
  
  private int parseLayerByString(String layer) {
    int result = 0;
    
    int layerLength = layer.length();
    for (int i = 0; i < layerLength; i++) {
      // 0 - 25 = 26
      int layerChar = layer.charAt(i) - 'a';
      
      result += layerChar * pow(26, layerLength - 1 - i);
    }
    
    return result;
  }
  
  public void draw() {
    if (this.resource != null) {
      /*point(0, 0);
      point(-this.x, -this.y - 2);
      point(this.x, this.y);*/
      image(this.resource, -this.x, -this.y);
    }
  }
  
  public void drawBlend(int blendMode) {
    if (this.resource != null) {
      blend(this.resource, 0, 0, this.resource.width, this.resource.height, -this.x, -this.y, this.resource.width, this.resource.height, blendMode);
    }
  }
  
  public boolean equals(int size, int layer, int direction, int frame) {
    return this.size == size
      && this.layer == layer
      && this.direction == direction
      && this.frame == frame;
  }
  
  public boolean equals(AssetImage image) {
    return image.equals(this.size, this.layer, this.direction, this.frame);
  }
  
  public int getX() {
    return this.x;
  }
  
  public int getY() {
    return this.y;
  }
  
  public int getSize() {
    return this.size;
  }
  
  public int getLayer() {
    return this.layer;
  }
  
  public int getDirection() {
    return this.direction;
  }
  
  public int getFrame() {
    return this.frame;
  }
  
  public int getFlipH() {
    return this.flipH;
  }
  
  public int getFlipV() {
    return this.flipV;
  }
  
  public PImage getResource() {
    return this.resource;
  }
  
  public ManifestFile getManifestFile() {
    return this.manifestFile;
  }
}
