Flock creatures;

void setup() {
  size(640,360);
  creatures = new Flock(1);
}

void draw() {
  background(127);

  creatures.update();
  creatures.display();
  text("Click to generate new Indoor fish", 0, height-10);
}

void mousePressed(){
   creatures.addCreature();
}