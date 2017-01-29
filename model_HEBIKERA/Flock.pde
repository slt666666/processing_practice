class Flock {
  ArrayList<Monster> monsters; 

  Flock() {
    monsters = new ArrayList<Monster>(); 
  }

  void run() {
    for (Monster b : monsters) {
      b.run(monsters);  
    }
  }

  void addMonster(Monster b) {
    monsters.add(b);
  }

}