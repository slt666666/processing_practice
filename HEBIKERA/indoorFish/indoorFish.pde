Flock creatures;

void setup() {
  size(640,360);
  creatures = new Flock(1);
}

void draw() {
  fill(220, 120);
  rect(0,0,width,height);
  creatures.update();
  creatures.display();
  text("Click to generate new Indoor fish", 0, height-10);
}

void mousePressed(){
   creatures.addCreature();
}