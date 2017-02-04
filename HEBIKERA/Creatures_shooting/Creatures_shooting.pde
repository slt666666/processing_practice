Flock FishAndHebi;
Ball ball;
ArrayList<Bullet> bullets;

void setup() {
  size(640,360);
  FishAndHebi = new Flock(10,5);
  ball = new Ball();
  bullets = new ArrayList<Bullet>();
}

void draw() {

  background(220);
  ball.move();
  FishAndHebi.deadCheck();
  FishAndHebi.update();
  FishAndHebi.display();
  for (int i = bullets.size()-1; i >= 0; i--){
     bullets.get(i).move();
     if (bullets.get(i).removeCheck()){
       bullets.remove(bullets.get(i));
     }
  }
  text("Click to generate new Indoor fish", 0, height-10);
}

void mousePressed(){
   FishAndHebi.addFish();
   FishAndHebi.addHebi();   
}

void keyPressed(){
   Bullet bullet = new Bullet();
   bullets.add(bullet);
}