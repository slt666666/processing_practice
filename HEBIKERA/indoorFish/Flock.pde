class Flock{
  ArrayList<Creature> creatures;
  
  Flock(int num){
    creatures = new ArrayList<Creature>();
    for (int i = 0; i < num; i++){
      Head brain = new Head(random(width), random(height));
      creatures.add(new Creature(7, brain));
    }
  }
  
  void addCreature(){
    Head brain = new Head(mouseX, mouseY);
    creatures.add(new Creature(6, brain));
  }
  
  void update(){
    for (Creature c: creatures){
      c.update(creatures);
    }
  }
  
  void display(){
    for (Creature c: creatures){
      c.display(); 
      c.connect();
    }
  }
}