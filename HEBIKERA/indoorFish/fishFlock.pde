class fishFlock{
  ArrayList<Creature> fishes;
  
  fishFlock(int num){
    fishes = new ArrayList<Creature>();
    for (int i = 0; i < num; i++){
      Head brain = new Head(random(width), random(height));
      fishes.add(new Creature(6, brain));
    }
  }
  
  void addCreature(){
    Head brain = new Head(mouseX, mouseY);
    fishes.add(new Creature(6, brain));
  }
  
  void update(){
    for (Creature f: fishes){
      f.update(fishes);
    }
  }
  
  void display(){
    for (Creature f: fishes){
      f.display(); 
      f.connect();
    }
  }
}