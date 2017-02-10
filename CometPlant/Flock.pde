class Flock{
  ArrayList<Creature> creatures;
  int subNum = 1;
  
  Flock(int num_fish, int num_hebi){
    creatures = new ArrayList<Creature>();
    for (int i = 0; i < num_fish; i++){
      fishHead brain = new fishHead(random(width), 0, random(-300,0), random(255));
      creatures.add(new CreatureFish(6, brain));
    }
    //for (int i = 0; i < num_hebi; i++){
    //  hebiHead brain = new hebiHead(random(width), 0, random(-300,0), random(255));
    //  creatures.add(new CreatureHebikera(4, brain));
    //}
  }
  
  void addFish(int num){
    for (int i = 0; i < num; i++){
      fishHead brain = new fishHead(random(width), 0, random(-300,0), random(255));
      creatures.add(new CreatureFish(6, brain));
    }
  }
  
  //void addHebi(){
  //  hebiHead brain = new hebiHead(random(width), 0, random(-300,0), random(255));
  //  creatures.add(new CreatureHebikera(4, brain));
  //}
  
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
        Creature creature = creatures.get(i);
        paths = (pathfinder[])append(paths, new pathfinder(creature.brain.position.x,creature.brain.position.y,creature.brain.position.z));
        creatures.remove(creatures.get(i));
      }
    }
  }
}