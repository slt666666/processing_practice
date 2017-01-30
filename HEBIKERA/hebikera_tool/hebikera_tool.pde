Mover mover;
Mover2 mover2;
Mover2 mover3;
Mover2 mover4;


void setup() {
  size(640,360);
  mover = new Mover();
  mover2 = new Mover2();
  mover3 = new Mover2();
  mover4 = new Mover2();
}

void draw() {
  background(255);
  
  mover.update();
  mover2.update(mover);
  mover3.update2(mover2);
  mover4.update2(mover3);  
  mover.display2(); 
  mover2.display();
  mover3.display2();
  mover4.display();
  
  stroke(0);
  noFill();
  beginShape();
  vertex(mover.position.x,mover.position.y);
  vertex(mover2.position.x,mover2.position.y);
  vertex(mover3.position.x,mover3.position.y);
  vertex(mover4.position.x,mover4.position.y);
  endShape();
}