public class VisualizationAnimationLayer {
  private int id;
  
  private int frameRepeat;
  private int loopCount;
  
  private ArrayList<Integer> frameSequence;
  
  public VisualizationAnimationLayer(XML layer) {
    this.id = layer.getInt("id");
    
    this.frameRepeat = layer.getInt("frameRepeat", 1);
    this.loopCount = layer.getInt("loopCount", 0);
    
    this.initializeFrameSequence(layer);
  }
  
  private void initializeFrameSequence(XML layer) {
    this.frameSequence = new ArrayList<Integer>();
    
    XML[] frames = layer.getChildren("frameSequence/frame");
    for (XML frame : frames) {
      this.frameSequence.add(frame.getInt("id"));
    }
  }
  
  public int getId() {
    return this.id;
  }
  
  public int getFrameFromFrameCount(int frameCount) {
    if (this.frameSequence.size() < 1) {
      return 0;
    }
    
    int frameIndex = (frameCount % (this.frameSequence.size() * this.frameRepeat)) / this.frameRepeat;
    
    return this.frameSequence.get(frameIndex);
  }
  
  public int getFrameSequence(int index) {
    if (index < this.frameSequence.size()) {
      return this.frameSequence.get(index).intValue();
    }
    
    return 0;
  }
  
  public int getSize() {
    return this.frameSequence.size();
  }
}
