String[] roomMap = {
  "0000000X",
  "0000000X",
  "0000000X",
  "0000000X",
  "0000000X",
  "0000000X",
  "0000000X",
  "0000000X",
  "0000000X",
  "XXXXXXXX"
};

RoomViewer roomViewer;

void setup() {
  size(800, 600);
  frameRate(24);
  
  roomViewer = new RoomViewer(roomMap, 400, 200);
  
  Furniture adsCapriLava = new Furniture("ads_capri_lava", "../furnitures/ads_capri_lava");
  roomViewer.addFurniture(adsCapriLava, 0, 0, 0);
  
  Furniture adsCalipCola = new Furniture("ads_calip_cola", "../furnitures/ads_calip_cola");
  FurnitureViewer adsCalipColaViewer1 = new FurnitureViewer(adsCalipCola, 0, 2, 0);
  adsCalipColaViewer1.setColor(1);
  roomViewer.addFurniture(adsCalipColaViewer1);
  
  FurnitureViewer adsCalipColaViewer2 = new FurnitureViewer(adsCalipCola, 0, 2, 2.5);
  adsCalipColaViewer2.setColor(2);
  adsCalipColaViewer2.setDirection(4);
  roomViewer.addFurniture(adsCalipColaViewer2);
  
  FurnitureViewer adsCalipColaViewer3 = new FurnitureViewer(adsCalipCola, 0, 4, 0);
  adsCalipColaViewer3.setColor(3);
  roomViewer.addFurniture(adsCalipColaViewer3);
  
  FurnitureViewer adsCalipColaViewer4 = new FurnitureViewer(adsCalipCola, 0, 5, 0);
  adsCalipColaViewer4.setColor(4);
  roomViewer.addFurniture(adsCalipColaViewer4);
  
  Furniture adsCalipFan = new Furniture("ads_calip_fan", "../furnitures/ads_calip_fan");
  FurnitureViewer adsCalipFanViewer = new FurnitureViewer(adsCalipFan, 0, 5, 2.5);
  adsCalipFanViewer.setAnimation(1);
  adsCalipFanViewer.setDirection(4);
  roomViewer.addFurniture(adsCalipFanViewer);
  
  Furniture adsCchupsScreen = new Furniture("ads_cchups_screen", "../furnitures/ads_cchups_screen");
  FurnitureViewer adsCchupsScreenViewer = new FurnitureViewer(adsCchupsScreen, 2, 0, 1);
  adsCchupsScreenViewer.setDirection(4);
  roomViewer.addFurniture(adsCchupsScreenViewer);
  
  Furniture adsCalipPool = new Furniture("ads_calip_pool", "../furnitures/ads_calip_pool");
  roomViewer.addFurniture(adsCalipPool, 1, 1, 0);
  
  /*Furniture cland15Tent = new Furniture("army_c15_officetent", "../furnitures/army_c15_officetent");
  FurnitureViewer cland15TentViewer = new FurnitureViewer(cland15Tent, 3, 4, 0);
  cland15TentViewer.setAnimation(1);
  cland15TentViewer.setDirection(4);
  roomViewer.addFurniture(cland15TentViewer);*/
  
  Furniture adsCalipChair = new Furniture("ads_calip_chair", "../furnitures/ads_calip_chair");
  FurnitureViewer adsCalipChairViewer = new FurnitureViewer(adsCalipChair, 3, 4, 0);
  adsCalipChairViewer.setDirection(4);
  roomViewer.addFurniture(adsCalipChairViewer);
}

void draw() {
  background(0);
  
  roomViewer.draw();
}
