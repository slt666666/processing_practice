class Flock{
  ArrayList<Creature> creatures;
  
  Flock(int num_fish, int num_hebi){
    creatures = new ArrayList<Creature>();
    for (int i = 0; i < num_fish; i++){
      Head brain = new Head(random(width), random(height), 0);
      creatures.add(new CreatureFish(6, brain));
    }
    for (int i = 0; i < num_hebi; i++){
      hebiHead brain = new hebiHead(random(width), random(height), i+1);
      creatures.add(new CreatureHebikera(6, brain));
    }
  }
  
  void addFish(){
    Head brain = new Head(mouseX, mouseY, 0);
    creatures.add(new CreatureFish(6, brain));
  }
  
  void addHebi(){
    balls.add(new Ball());
    hebiHead brain = new hebiHead(mouseX, mouseY, balls.size()-1);
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