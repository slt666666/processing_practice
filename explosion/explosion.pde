Flock fishes;
//ArrayList<Ball> balls;

void setup(){
  size(720, 480, P3D);
  background(220);
  fishes = new Flock(5,2);
  //balls = new ArrayList<Ball>();
  //balls.add(new Ball());
}

void draw() {

  background(220);
  //if (balls.size() > 0) {
  //  for (int i = 0; i < balls.size(); i++){
  //    balls.get(i).move();
  //    if (balls.get(i).outSide()){
  //      balls.remove(balls.get(i));
  //    }
  //  }
  //}
  fishes.deadCheck();
  fishes.update();
  fishes.display();
  
  beginShape();
  vertex(0,height,0);
  vertex(width,height,0);
  vertex(width,height,-300);  
  vertex(0,height,-300);
  endShape(CLOSE);
  
  beginShape();
  vertex(0,0,0);
  vertex(width,0,0);
  vertex(width,0,-300);  
  vertex(0,0,-300);
  endShape(CLOSE);

}

void mousePressed(){
   //balls.add(new Ball());
   fishes.addFish(5);  
}