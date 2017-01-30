Head head;
Body body;
Body body1;
Body body2;
Body body3;

void setup() {
  size(640,360);
  head = new Head();
  body = new Body();
  body1 = new Body();
  body2 = new Body();
  body3 = new Body();
}

void draw() {
  background(255);
  
  head.update();
  body.update(head);
  body1.update2(body);
  body2.update2(body1);  
  body3.update2(body2);
  head.display(); 
  body.display();
  body1.display2();
  body2.display();
  body3.display2();
  
  stroke(0);
  noFill();
  beginShape();
  vertex(head.position.x,head.position.y);
  vertex(body.position.x,body.position.y);
  vertex(body1.position.x,body1.position.y);
  vertex(body2.position.x,body2.position.y);
  vertex(body3.position.x,body3.position.y);
  endShape();
}