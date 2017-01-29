Flock flock;

void setup() {
  size(640,360);
  flock = new Flock();
  for (int i = 0; i < 30; i++) {
    Monster b = new Monster(width/2,height/2);
    flock.addMonster(b);
  }
}

void draw() {
  background(255);
  flock.run();
}

void mouseDragged() {
  flock.addMonster(new Monster(mouseX,mouseY));
}