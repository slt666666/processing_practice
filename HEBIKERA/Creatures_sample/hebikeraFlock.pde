class hebikeraFlock{
  ArrayList<CreatureHebikera> hebikeras;
  
  hebikeraFlock(int num){
    hebikeras = new ArrayList<CreatureHebikera>();
    for (int i = 0; i < num; i++){
      hebiHead brain = new hebiHead(random(width), random(height));
      hebikeras.add(new CreatureHebikera(4, brain));
    }
  }
  
  void addCreature(){
    hebiHead brain = new hebiHead(mouseX, mouseY);
    hebikeras.add(new CreatureHebikera(4, brain));
  }
  
  void update(){
    for (CreatureHebikera h: hebikeras){
      h.update(hebikeras);
    }
  }
  
  void display(){
    for (CreatureHebikera h: hebikeras){
      h.display(); 
    }
  }
}