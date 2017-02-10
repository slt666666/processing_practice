fishFlock fishes;
hebikeraFlock hebikeras;
Ball ball;
ArrayList<Bullet> bullets;

void setup() {
  size(640,360);
  //fishes = new fishFlock(1);
  hebikeras = new hebikeraFlock(10);
  ball = new Ball();
  bullets = new ArrayList<Bullet>();
}

void draw() {

  background(220);
  ball.move();
  hebikeras.deadCheck();
  //fishes.update();
  hebikeras.update();
  //fishes.display();
  hebikeras.display();
  for (int i = bullets.size()-1; i >= 0; i--){
     bullets.get(i).move();
     if (bullets.get(i).removeCheck()){
       bullets.remove(bullets.get(i));
     }
  }
  text("Click to generate new Indoor fish", 0, height-10);
}

void mousePressed(){
   //fishes.addCreature();
   //hebikeras.addCreature();
   Bullet bullet = new Bullet();
   bullets.add(bullet);
}