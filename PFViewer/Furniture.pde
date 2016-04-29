public class Furniture { // IDrawable interface?!
  private FurnitureManifest manifest;
  private FurnitureAssets assets;
  private ArrayList<FurnitureVisualization> visualizations;
  
  private String furniname;
  private String basePath;
  
  private float x;
  private float y;
  private float z;
  
  private float centerZ;
  
  private int[] directions;
  
  private String logic;
  private String visualization;
  
  public Furniture(String furniname, String basePath) {
    this.furniname = furniname;
    this.basePath = basePath;
    
    this.manifest = new FurnitureManifest(this);
    this.assets = new FurnitureAssets(this.manifest);
    
    /*if (!this.manifest.checkManifest()) {
      throw new RuntimeException("Invalid furniture");
    }*/
    
    this.initializeIndex();
    this.initializeLogic();
    this.initializeVisualizations();
  }

  private void initializeIndex() {
    XML index = this.manifest.getManifestFile("index").getXML();
    
    this.logic = index.getString("logic");
    this.visualization = index.getString("visualization");
  }
  
  private void initializeLogic() {
    XML logic = this.manifest.getManifestFile("logic").getXML();
    XML dimension = logic.getChild("model/dimensions");
    
    this.x= dimension.getFloat("x");
    this.y = dimension.getFloat("y");
    this.z = dimension.getFloat("z");
    
    this.centerZ = dimension.getFloat("centerZ", -1);
    
    XML[] directions = logic.getChildren("model/directions/direction");
    
    this.directions = new int[directions.length];
    for (int i = 0; i < directions.length; i++) {
      this.directions[i] = directions[i].getInt("id") / 90 * 2;
    }
  }
  
  private void initializeVisualizations() {
    this.visualizations = new ArrayList<FurnitureVisualization>();
    
    XML _visualizations = this.manifest.getManifestFile("visualization").getXML();
    XML[] visualizations = _visualizations.getChildren("graphics/visualization");// with graphics tag (newest)
    
    for (XML visualization : visualizations) {
      FurnitureVisualization fVisualization = new FurnitureVisualization(visualization);
      
      this.visualizations.add(fVisualization);
    }
  }
  
  public String getFurniname() {
    return this.furniname;
  }
  
  public String getBasePath() {
    return this.basePath;
  }
  
  public float getX() {
    return this.x;
  }
  
  public float getY() {
    return this.y;
  }
  
  public float getZ() {
    return this.z;
  }
  
  public float getCenterZ() {
    return this.centerZ;
  }
  
  public int[] getDirections() {
    return this.directions;
  }
  
  public String getLogic() {
    return this.logic;
  }
  
  public String getVisualization() {
    return this.visualization;
  }
  
  public FurnitureManifest getManifest() {
    return this.manifest;
  }
  
  public FurnitureAssets getAssets() {
    return this.assets;
  }
  
  public FurnitureVisualization getVisualizationData(int size) {
    for (FurnitureVisualization visualization : this.visualizations) {
      if (visualization.getSize() == size) {
        return visualization;
      }
    }
    
    return null;
  }
}
