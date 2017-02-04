fishFlock fishes;
hebikeraFlock hebikeras;
Ball ball;

void setup() {
  size(640,360);
  //fishes = new fishFlock(1);
  hebikeras = new hebikeraFlock(1);
  ball = new Ball();
}

void draw() {
  fill(220, 120);
  rect(0,0,width,height);
  ball.move();
  //fishes.update();
  hebikeras.update();
  //fishes.display();
  hebikeras.display();
  text("Click to generate new Indoor fish", 0, height-10);
}

void mousePressed(){
   //fishes.addCreature();
   hebikeras.addCreature();
}