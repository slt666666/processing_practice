Flock creatures;

void setup() {
  size(640,360);
  creatures = new Flock(1);
}

void draw() {
  background(0);
  creatures.update();
  creatures.display();
}

void mousePressed(){
   creatures.addCreature();
}