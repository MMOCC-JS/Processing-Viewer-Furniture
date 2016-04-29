public class RoomViewer {
  private String[] roomMap;
  
  private ArrayList<FurnitureViewer> furnitures;
  
  private PImage floorTile;
  private PImage rightWall;
  private PImage leftWall;
  
  private int x;
  private int y;
  
  public RoomViewer(String[] roomMap, int x, int y) {
    this.roomMap = roomMap;
    
    this.x = x;
    this.y = y;
    
    this.furnitures = new ArrayList<FurnitureViewer>();
    
    this.floorTile = loadImage("./resources/floor_tile.png");
    this.rightWall = loadImage("./resources/wall_r.png");
    this.leftWall = loadImage("./resources/wall_l.png");
  }
  
  public void draw() {
    pushMatrix();
    translate(this.x, this.y);
    
    // room
    int floorMaxY = this.roomMap.length;
    int floorMaxX = this.roomMap[0].length();
    
    int tileModules = floorMaxX;
    
    int floorIndex = 0;
    do {
      int tileX = floorIndex % tileModules;
      int tileY = floorIndex / tileModules;
      
      char tileData = this.roomMap[tileY].charAt(tileX);
      
      float drawX = this.getDrawX(tileX, tileY);
      float drawY = this.getDrawY(tileX, tileY);
      
      if (tileData != 'X') {
        // draw left wall
        if (tileX < 1) {
          image(this.leftWall, drawX - 8, drawY - 122);
        }
        
        // draw right wall
        if (tileY < 1) {
          image(this.rightWall, drawX + 32, drawY - 122);
        }
        
        image(this.floorTile, drawX, drawY);
      }
    }
    while (++floorIndex < floorMaxX * floorMaxY);
    
    for (FurnitureViewer viewer : this.furnitures) {
      pushMatrix();
      float drawX = this.getDrawX(viewer.getX(), viewer.getY(), viewer.getZ());
      float drawY = this.getDrawY(viewer.getX(), viewer.getY(), viewer.getZ());
      
      translate(drawX, drawY);
      
      viewer.draw();
      popMatrix();
    }
    
    popMatrix();
  }
  
  public void addFurniture(Furniture furniture, int tileX, int tileY, float z) {
    this.addFurniture(new FurnitureViewer(furniture, tileX, tileY, z));
  }
  
  public void addFurniture(FurnitureViewer viewer) {
    this.furnitures.add(viewer);
  }
  
  public float getDrawX(int tileX, int tileY) {
    return tileX * 32 - tileY * 32;
  }
  
  public float getDrawX(int tileX, int tileY, float z) {
      return this.getDrawX(tileX, tileY);
  }
  
  public float getDrawY(int tileX, int tileY) {
    return tileX * 16 + tileY * 16;
  }
  
  public float getDrawY(int tileX, int tileY, float z) {
    return this.getDrawY(tileX, tileY) - z * 32;
  }
}
