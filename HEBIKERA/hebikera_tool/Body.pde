class Body {

  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector steer;
  float topspeed;

  Body(float x, float y) {
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    topspeed = 5;
  }

  void update(Head target) {
    PVector desired = PVector.sub(target.position, position);
    
    float distance = desired.mag();
    desired.normalize();
    if (distance < 40){
      float m = map(distance,0,100,0,topspeed);
      desired.mult(m);
    }else{
      desired.mult(topspeed);
    }
    
    steer = PVector.sub(desired, velocity);
    position.add(steer);
  }

  void update2(Body target) {
    
    PVector desired = PVector.sub(target.position, position);
    
    float distance = desired.mag();
    desired.normalize();
    if (distance < 40){
      float m = map(distance,0,100,0,topspeed);
      desired.mult(m);
    }else{
      desired.mult(topspeed);
    }
    
    steer = PVector.sub(desired, velocity);
    position.add(steer);
  }

  void displayBody() {
    float angle = atan2(-steer.y, steer.x);
    stroke(0);
    strokeWeight(2);
    noFill();
    pushMatrix();
    translate(position.x, position.y);
    beginShape();
    vertex(20*cos(angle),-20*sin(angle));
    vertex(20*cos(angle+PI/2),-20*sin(angle+PI/2));
    vertex(20*cos(angle+PI),-20*sin(angle+PI));
    vertex(20*cos(angle+PI*3/2),-20*sin(angle+PI*3/2));
    endShape(CLOSE);
    popMatrix();
  }
  
  void displayTail() {
    float angle = atan2(-steer.y, steer.x);
    stroke(0);
    strokeWeight(2);
    noFill();
    pushMatrix();
    translate(position.x, position.y);
    beginShape();
    
    endShape(CLOSE);
    popMatrix();
  }
}