class Flock{
  ArrayList<Creature> creatures;
  
  Flock(int num_fish, int num_hebi){
    creatures = new ArrayList<Creature>();
    for (int i = 0; i < num_fish; i++){
      Head brain = new Head(random(width), random(height));
      creatures.add(new CreatureFish(6, brain));
    }
    for (int i = 0; i < num_hebi; i++){
      hebiHead brain = new hebiHead(random(width), random(height));
      creatures.add(new CreatureHebikera(6, brain));
    }
  }
  
  void addFish(){
    Head brain = new Head(mouseX, mouseY);
    creatures.add(new Creature(6, brain));
  }
  
  void addHebi(){
    hebiHead brain = new hebiHead(random(width), random(height));
    creatures.add(new CreatureHebikera(6, brain));
  }
  
  void update(){
    for (Creature c: creatures){
      c.update();
    }
  }
  
  void display(){
    for (Creature c: creatures){
      c.display(); 
      c.connect();
    }
  }
  
  void deadCheck(){
    for (int i = creatures.size()-1; i >= 0; i--){
      if(creatures.get(i).bodies.get(0).collision()){
        creatures.remove(creatures.get(i));
      }
    }
  }
}