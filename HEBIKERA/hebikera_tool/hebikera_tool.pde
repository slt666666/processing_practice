Flock creatures;

void setup() {
  size(640,360);
  creatures = new Flock(5);
}

void draw() {
  background(255);
  creatures.update();
  creatures.display();
}

void mousePressed(){
   creatures.addCreature();
}