class Head extends BodyParts{

  Head(float x, float y) {
    super(x, y);
  }
  
  void update() {
    PVector followP = follow();
    PVector separateP = separate();
    velocity.add(followP);
    velocity.add(separateP);
    velocity.limit(topspeed);
    position.add(velocity);
  }
  
  PVector follow() {
    PVector followPower = PVector.sub(ball.position,position);
    followPower.setMag(0.2);
    followPower.limit(topspeed);
    return followPower;
  }
  
  PVector separate(){
    float desiredDistance = 12;
    PVector sum = new PVector();
    int count = 0;
    for (Creature c: FishAndHebi.creatures){
      for (BodyParts p: c.bodies){
        float d = PVector.dist(position, p.position);
        if ((d > 0) && (d < desiredDistance)){
          PVector diff = PVector.sub(position, p.position);
          diff.normalize();
          diff.div(d);
          sum.add(diff);
          count++;
        }
      }
    }
    if (count > 0){
      sum.div(count);
      sum.normalize();
      sum.mult(0.8);
    }
    return sum;
  }
  
  void display() {
    angle = atan2(-velocity.y,velocity.x);
    reductionRate = map(abs(velocity.x),0,5,0,1);
    stroke(random(200));
    strokeWeight(2);
    pushMatrix();
    translate(position.x, position.y);
    fill(random(200));
    beginShape();
    //右向き
    if(angle <= PI/2 && angle >= -PI/2){
      vertex(16*cos(angle-PI/6)*reductionRate,-16*sin(angle-PI/6));
      vertex(6*cos(angle-PI*5/6)*reductionRate,-6*sin(angle-PI*5/6));
      vertex(12*cos(angle+PI*2/3)*reductionRate,-12*sin(angle+PI*2/3));
      vertex(20*cos(angle+PI*2/3)*reductionRate,-20*sin(angle+PI*2/3));
      vertex(12*cos(angle+PI/3)*reductionRate,-12*sin(angle+PI/3));
    }else{
    //左向き
      vertex(16*cos(angle+PI/6)*reductionRate,-16*sin(angle+PI/6));
      vertex(6*cos(angle+PI*5/6)*reductionRate,-6*sin(angle+PI*5/6));
      vertex(12*cos(angle-PI*2/3)*reductionRate,-12*sin(angle-PI*2/3));
      vertex(20*cos(angle-PI*2/3)*reductionRate,-20*sin(angle-PI*2/3));
      vertex(12*cos(angle-PI/3)*reductionRate,-12*sin(angle-PI/3));
    }
    endShape(CLOSE);
    //目
    stroke(0);
    strokeWeight(2);
    fill(0);
    ellipse(0,0,4*reductionRate,4);
    popMatrix();
  }

}