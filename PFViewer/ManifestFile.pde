public class ManifestFile {
  private Furniture furniture;
  private boolean preFurniname;
  private String mimeType;
  private String name;
  
  public ManifestFile(Furniture furniture, String name, String mimeType, boolean preFurniname) {
    this.furniture = furniture;
    this.preFurniname = preFurniname;
    this.mimeType = mimeType;
    this.name = name;
  }
  
  public ManifestFile(Furniture furniture, String name, String mimeType) {
    this(furniture, name, mimeType, false);
  }
  
  public XML getXML() {
    if (!this.mimeType.equals("text/xml")) {
      throw new RuntimeException("Requested file is not from the mimetype text/xml!");
    }

    return loadXML(this.toString());
  }
  
  public PImage getImage() {
    if (this.mimeType.indexOf("image/") != 0) {
      throw new RuntimeException("Requested file is not from the mimetype image/*!");
    }
    
    return loadImage(this.toString());
  }
  
  public Furniture getFurniture() {
    return this.furniture;
  }
  
  public String getMimeType() {
    return this.mimeType;
  }
  
  public String getName(boolean preFurniname) {
    return (this.preFurniname && preFurniname) ? this.furniture.getFurniname() + "_" + this.name : this.name;
  }
  
  public String getName() {
    return this.getName(false);
  }
  
  public String toString() {
    return this.furniture.getBasePath() + "/" + this.furniture.getFurniname() + "_" + this.getName(true) + "." + this.mimeType.replace("text/", "").replace("image/", "");
  }
}
