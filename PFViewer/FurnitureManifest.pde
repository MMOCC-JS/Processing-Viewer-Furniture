public class FurnitureManifest {
  private Furniture furniture;
  
  private ArrayList<ManifestFile> manifestFiles;
  
  public FurnitureManifest(Furniture furniture) {
    this.furniture = furniture;
   
    this.initializeManifest();
  }
  
  private void initializeManifest() {
    this.manifestFiles = new ArrayList<ManifestFile>();
    
    XML manifest = loadXML(this.furniture.getBasePath() + "/" + this.furniture.getFurniname() + "_manifest.xml");
    XML[] assets = manifest.getChildren("library/assets/asset");
    
    for (XML asset : assets) {
      String name = asset.getString("name");
      boolean preFurniname = (name.indexOf(this.furniture.getFurniname()) == 0);
      
      if (preFurniname) {
        name = name.replace(this.furniture.getFurniname() + "_", "");
      }
      
      ManifestFile manifestFile = new ManifestFile(this.furniture, name, asset.getString("mimeType"), preFurniname);
      this.manifestFiles.add(manifestFile);
    }
  }
  
  public boolean checkManifest() {
    for (ManifestFile manifestFile : this.manifestFiles) {
      File file = new File(manifestFile.toString());
      if (!file.exists()) {
        return false;
      }
    }
    
    return true;
  }
  
  public ManifestFile getManifestFile(String name, boolean preFurniname) {
    for (ManifestFile manifestFile : this.manifestFiles) {
      if (manifestFile.getName(preFurniname).equals(name)) {
        return manifestFile;
      }
    }
    
    return null;
  }
  
  public ManifestFile getManifestFile(String name) {
    return this.getManifestFile(name, false);
  }
  
  public Furniture getFurniture() {
    return this.furniture;
  }
}
