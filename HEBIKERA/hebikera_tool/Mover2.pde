class Mover2 {

  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector steer;
  float topspeed;

  Mover2() {
    position = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    topspeed = 5;
  }

  void update(Mover target) {
    
    PVector desired = PVector.sub(target.position, position);
    
    float distance = desired.mag();
    desired.normalize();
    if (distance < 100){
      float m = map(distance,0,100,0,topspeed);
      desired.mult(m);
    }else{
      desired.mult(topspeed);
    }
    
    steer = PVector.sub(desired, velocity);
    position.add(steer);
  }

  void update2(Mover2 target) {
    
    PVector desired = PVector.sub(target.position, position);
    
    float distance = desired.mag();
    desired.normalize();
    if (distance < 100){
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
    ellipse(position.x,position.y,48,48);
  }
  
  void display2() {
    float angle = steer.heading();
    stroke(0);
    strokeWeight(2);
    noFill();
    pushMatrix();
    translate(position.x, position.y);
    beginShape();
    vertex(48*cos(angle),48*sin(angle));
    vertex(48*cos(angle+radians(120)),48*sin(angle+radians(120)));
    vertex(48*cos(angle-radians(120)),48*sin(angle-radians(120)));
    endShape(CLOSE);
    popMatrix();
  }
}