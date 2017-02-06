Flock fishes;
ArrayList<Ball> balls;

void setup(){
  size(720,480);
  background(220);
  fishes = new Flock(5,2);
  balls = new ArrayList<Ball>();
  balls.add(new Ball());
}

void draw() {

  background(220);
  for (Ball b: balls){
    b.move();
  }
  fishes.deadCheck();
  fishes.update();
  fishes.display();
}

void mousePressed(){
   balls.add(new Ball());
   fishes.addFish(5);  
}