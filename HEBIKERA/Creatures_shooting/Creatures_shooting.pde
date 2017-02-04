Flock FishAndHebi;
ArrayList<Ball> balls;
ArrayList<Bullet> bullets;

void setup() {
  size(640,360);
  FishAndHebi = new Flock(10,2);
  balls = new ArrayList<Ball>();
  balls.add(new Ball());
  balls.add(new Ball());
  balls.add(new Ball());
  bullets = new ArrayList<Bullet>();
}

void draw() {

  background(220);
  for (Ball b: balls){
    b.move();
  }
  FishAndHebi.deadCheck();
  FishAndHebi.update();
  FishAndHebi.display();
  for (int i = bullets.size()-1; i >= 0; i--){
     bullets.get(i).move();
     if (bullets.get(i).removeCheck()){
       bullets.remove(bullets.get(i));
     }
  }
  text("Click to generate new creature", 0, height-10);
}

void mousePressed(){
   FishAndHebi.addFish();
   FishAndHebi.addHebi();   
}

void keyPressed(){
   Bullet bullet = new Bullet();
   bullets.add(bullet);
}