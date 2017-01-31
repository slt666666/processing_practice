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
    if (distance < 20){
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
    if (distance < 20){
      float m = map(distance,0,100,0,topspeed);
      desired.mult(m);
    }else{
      desired.mult(topspeed);
    }
    
    steer = PVector.sub(desired, velocity);
    position.add(steer);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    pushMatrix();
    translate(position.x, position.y);
    beginShape();
    vertex(-10,-10);
    vertex(10,-10);
    vertex(10,10);
    vertex(-10,10);
    endShape(CLOSE);
    popMatrix();
  }
  
  void display2() {
    float angle = steer.heading();
    stroke(0);
    strokeWeight(2);
    noFill();
    pushMatrix();
    translate(position.x, position.y);
    beginShape();
    vertex(10*cos(angle),10*sin(angle));
    vertex(10*cos(angle+radians(120)),10*sin(angle+radians(120)));
    vertex(10*cos(angle-radians(120)),10*sin(angle-radians(120)));
    endShape(CLOSE);
    popMatrix();
  }
}