class Body {

  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector steer;
  float topspeed;
  float reductionRate;

  Body(float x, float y) {
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    topspeed = 5;
  }

  void update(Head target) {
    PVector desired = PVector.sub(target.position, position);
    
    float distance = desired.mag();
    desired.normalize();
    if (distance < 30){
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
    if (distance < 30){
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
    float mapAngle = abs(angle);
    if (mapAngle >= PI/2){ 
      reductionRate = map(mapAngle,PI/2,PI,0,1);
    }else{
      reductionRate = map(mapAngle,0,PI,1,0);
    }
    stroke(random(255));
    strokeWeight(2);
    fill(random(255));
    pushMatrix();
    translate(position.x, position.y);
    beginShape();
    if(angle <= PI/2 && angle >= -PI/2){
      vertex(20*cos(angle)*reductionRate,-20*sin(angle));
      vertex(45*cos(angle+PI*3/5)*reductionRate,-45*sin(angle+PI*3/5));
      vertex(20*cos(angle+PI/2)*reductionRate,-20*sin(angle+PI/2));
      vertex(30*cos(angle+PI*9/10)*reductionRate,-30*sin(angle+PI*9/10));
      vertex(20*cos(angle+PI*7/6)*reductionRate,-20*sin(angle+PI*7/6));
      vertex(30*cos(angle+PI*13/10)*reductionRate,-30*sin(angle+PI*13/10));
      vertex(20*cos(angle+PI*13/10)*reductionRate,-20*sin(angle+PI*13/10));
      vertex(20*cos(angle+PI*8/5)*reductionRate,-20*sin(angle+PI*8/5));
    }else{
    //左向き
      vertex(20*cos(angle)*reductionRate,-20*sin(angle));
      vertex(45*cos(angle-PI*3/5)*reductionRate,-45*sin(angle-PI*3/5));
      vertex(20*cos(angle-PI/2)*reductionRate,-20*sin(angle-PI/2));
      vertex(30*cos(angle-PI*9/10)*reductionRate,-30*sin(angle-PI*9/10));
      vertex(20*cos(angle-PI*7/6)*reductionRate,-20*sin(angle-PI*7/6));
      vertex(30*cos(angle-PI*13/10)*reductionRate,-30*sin(angle-PI*13/10));
      vertex(20*cos(angle-PI*13/10)*reductionRate,-20*sin(angle-PI*13/10));
      vertex(20*cos(angle-PI*8/5)*reductionRate,-20*sin(angle-PI*8/5));
    }
    endShape(CLOSE);
    popMatrix();
  }
  
  void displayTail() {
    float angle = atan2(-steer.y, steer.x);
    float mapAngle = abs(angle);
    if (mapAngle >= PI/2){ 
      reductionRate = map(mapAngle,PI/2,PI,0,1);
    }else{
      reductionRate = map(mapAngle,0,PI,1,0);
    }
    stroke(random(255));
    strokeWeight(2);
    fill(random(255));
    pushMatrix();
    translate(position.x, position.y);
    beginShape();
    vertex(20*cos(angle)*reductionRate,-20*sin(angle));
    vertex(10*cos(angle+PI/2)*reductionRate,-10*sin(angle+PI/2));
    vertex(60*cos(angle+PI)*reductionRate,-60*sin(angle+PI));
    vertex(10*cos(angle+PI*3/2)*reductionRate,-10*sin(angle+PI*3/2));
    endShape(CLOSE);
    popMatrix();
  }
}