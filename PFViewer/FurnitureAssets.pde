public class FurnitureAssets {
  private FurnitureManifest manifest;
  
  private ArrayList<AssetImage> assetImages;
  
  public FurnitureAssets(FurnitureManifest manifest) {
    this.manifest = manifest;
    
    this.initializeAssets();
  }
  
  private void initializeAssets() {
    this.assetImages = new ArrayList<AssetImage>();
    
    XML _assets = this.manifest.getManifestFile("assets").getXML();
    XML[] assets = _assets.getChildren("asset");
    
    for (XML asset : assets) {
      String name = asset.getString("name");
      
      String source = name;
      if (asset.hasAttribute("source")) {
        source = asset.getString("source");
      }
      
      ManifestFile manifestFile = this.manifest.getManifestFile(source, true);
      if (manifestFile == null) {
        throw new RuntimeException("Asset does not appear to be in the manifest!");
      }
      
      AssetImage assetImage = new AssetImage(manifestFile, asset);

      this.assetImages.add(assetImage);
    }
  }
  
  public AssetImage getAsset(int size, int layer, int direction, int frame) {
    for (AssetImage assetImage : this.assetImages) {
      if (assetImage.equals(size, layer, direction, frame)) {
        return assetImage;
      }
    }
    
    return null;
  }
  
  public FurnitureManifest getManifest() {
    return this.manifest;
  }
}
