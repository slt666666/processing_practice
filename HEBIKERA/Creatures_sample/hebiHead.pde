class hebiHead extends BodyParts {
  
  hebiHead(float x, float y){
    super(x, y);
  }
  
  
  void update(ArrayList<CreatureHebikera> creatures) {
    PVector followP = follow();
    PVector separateP = separate(creatures);
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
  
  PVector separate(ArrayList<CreatureHebikera> creatures){
    float desiredDistance = 30;
    PVector sum = new PVector();
    int count = 0;
    for (CreatureHebikera c: creatures){
      float d = PVector.dist(position, c.brain.position);
      if ((d > 0) && (d < desiredDistance)){
        PVector diff = PVector.sub(position, c.brain.position);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count++;
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
    if(angle <= PI/2 && angle >= -PI/2){
    //右向き
    beginShape();
    vertex(25*cos(angle)*reductionRate,-25*sin(angle));
    vertex(32*cos(angle+PI/3)*reductionRate,-32*sin(angle+PI/3));
    curveVertex(32*cos(angle+PI/3)*reductionRate,-32*sin(angle+PI/3));
    curveVertex(28*cos(angle+PI/2)*reductionRate,-28*sin(angle+PI/2));
    curveVertex(48*cos(angle+PI*2/3)*reductionRate,-48*sin(angle+PI*2/3));
    curveVertex(48*cos(angle+PI*2/3)*reductionRate,-48*sin(angle+PI*2/3));
    vertex(32*cos(angle+PI*2/3)*reductionRate,-32*sin(angle+PI*2/3));
    curveVertex(32*cos(angle+PI*2/3)*reductionRate,-32*sin(angle+PI*2/3));
    curveVertex(32*cos(angle+PI*2/3)*reductionRate,-32*sin(angle+PI*2/3));
    curveVertex(28*cos(angle+PI*11/12)*reductionRate,-28*sin(angle+PI*11/12));
    curveVertex(40*cos(angle+PI)*reductionRate,-40*sin(angle+PI));
    curveVertex(40*cos(angle+PI)*reductionRate,-40*sin(angle+PI));
    curveVertex(28*cos(angle+PI*13/12)*reductionRate,-28*sin(angle+PI*13/12));
    curveVertex(32*cos(angle+PI*4/3)*reductionRate,-32*sin(angle+PI*4/3));
    curveVertex(32*cos(angle+PI*4/3)*reductionRate,-32*sin(angle+PI*4/3));
    vertex(48*cos(angle+PI*4/3)*reductionRate,-48*sin(angle+PI*4/3));
    curveVertex(48*cos(angle+PI*4/3)*reductionRate,-48*sin(angle+PI*4/3));
    curveVertex(28*cos(angle+PI*3/2)*reductionRate,-28*sin(angle+PI*3/2));
    curveVertex(32*cos(angle+PI*5/3)*reductionRate,-32*sin(angle+PI*5/3));
    curveVertex(32*cos(angle+PI*5/3)*reductionRate,-32*sin(angle+PI*5/3));
    vertex(32*cos(angle+PI*5/3)*reductionRate,-32*sin(angle+PI*5/3));
    endShape(CLOSE);
    
    //触手的な
    fill(0);
    beginShape();
    curveVertex(32*cos(angle+PI/3)*reductionRate,-32*sin(angle+PI/3));
    curveVertex(32*cos(angle+PI/3)*reductionRate,-32*sin(angle+PI/3));
    curveVertex(80*cos(angle+PI*2/9)*reductionRate,-80*sin(angle+PI*2/9));
    curveVertex(112*cos(angle+PI/9)*reductionRate,-112*sin(angle+PI/9));
    curveVertex(112*cos(angle+PI/9)*reductionRate,-112*sin(angle+PI/9));
    curveVertex(80*cos(angle+PI/5)*reductionRate,-80*sin(angle+PI/5));
    curveVertex(28*cos(angle+PI*2/9)*reductionRate,-28*sin(angle+PI*2/9));  
    curveVertex(28*cos(angle+PI*2/9)*reductionRate,-28*sin(angle+PI*2/9));  
    endShape(CLOSE);
    beginShape();
    curveVertex(32*cos(angle-PI/3)*reductionRate,-32*sin(angle-PI/3));
    curveVertex(32*cos(angle-PI/3)*reductionRate,-32*sin(angle-PI/3));
    curveVertex(80*cos(angle-PI*2/9)*reductionRate,-80*sin(angle-PI*2/9));
    curveVertex(112*cos(angle-PI/9)*reductionRate,-112*sin(angle-PI/9));
    curveVertex(112*cos(angle-PI/9)*reductionRate,-112*sin(angle-PI/9));
    curveVertex(80*cos(angle-PI/5)*reductionRate,-80*sin(angle-PI/5));
    curveVertex(28*cos(angle-PI*2/9)*reductionRate,-28*sin(angle-PI*2/9));  
    curveVertex(28*cos(angle-PI*2/9)*reductionRate,-28*sin(angle-PI*2/9));  
    endShape(CLOSE);
    //目
    stroke(0);
    strokeWeight(5);
    noFill();
    ellipse(30*cos(angle+PI*2/9)*reductionRate,-30*sin(angle+PI*2/9),10,10);
    ellipse(30*cos(angle+PI*16/9)*reductionRate,-30*sin(angle+PI*16/9),10,10);
    }else{
    //左向き
    beginShape();
    vertex(25*cos(angle)*reductionRate,-25*sin(angle));
    vertex(32*cos(angle-PI/3)*reductionRate,-32*sin(angle-PI/3));
    curveVertex(32*cos(angle-PI/3)*reductionRate,-32*sin(angle-PI/3));
    curveVertex(28*cos(angle-PI/2)*reductionRate,-28*sin(angle-PI/2));
    curveVertex(48*cos(angle-PI*2/3)*reductionRate,-48*sin(angle-PI*2/3));
    curveVertex(48*cos(angle-PI*2/3)*reductionRate,-48*sin(angle-PI*2/3));
    vertex(32*cos(angle-PI*2/3)*reductionRate,-32*sin(angle-PI*2/3));
    curveVertex(32*cos(angle-PI*2/3)*reductionRate,-32*sin(angle-PI*2/3));
    curveVertex(32*cos(angle-PI*2/3)*reductionRate,-32*sin(angle-PI*2/3));
    curveVertex(28*cos(angle-PI*11/12)*reductionRate,-28*sin(angle-PI*11/12));
    curveVertex(40*cos(angle-PI)*reductionRate,-40*sin(angle-PI));
    curveVertex(40*cos(angle-PI)*reductionRate,-40*sin(angle-PI));
    curveVertex(28*cos(angle-PI*13/12)*reductionRate,-28*sin(angle-PI*13/12));
    curveVertex(32*cos(angle-PI*4/3)*reductionRate,-32*sin(angle-PI*4/3));
    curveVertex(32*cos(angle-PI*4/3)*reductionRate,-32*sin(angle-PI*4/3));
    vertex(48*cos(angle-PI*4/3)*reductionRate,-48*sin(angle-PI*4/3));
    curveVertex(48*cos(angle-PI*4/3)*reductionRate,-48*sin(angle-PI*4/3));
    curveVertex(28*cos(angle-PI*3/2)*reductionRate,-28*sin(angle-PI*3/2));
    curveVertex(32*cos(angle-PI*5/3)*reductionRate,-32*sin(angle-PI*5/3));
    curveVertex(32*cos(angle-PI*5/3)*reductionRate,-32*sin(angle-PI*5/3));
    vertex(32*cos(angle-PI*5/3)*reductionRate,-32*sin(angle-PI*5/3));
    endShape(CLOSE);
    
    //触手的な
    fill(0);
    beginShape();
    curveVertex(32*cos(angle-PI/3)*reductionRate,-32*sin(angle-PI/3));
    curveVertex(32*cos(angle-PI/3)*reductionRate,-32*sin(angle-PI/3));
    curveVertex(80*cos(angle-PI*2/9)*reductionRate,-80*sin(angle-PI*2/9));
    curveVertex(112*cos(angle-PI/9)*reductionRate,-112*sin(angle-PI/9));
    curveVertex(112*cos(angle-PI/9)*reductionRate,-112*sin(angle-PI/9));
    curveVertex(80*cos(angle-PI/5)*reductionRate,-80*sin(angle-PI/5));
    curveVertex(28*cos(angle-PI*2/9)*reductionRate,-28*sin(angle-PI*2/9));  
    curveVertex(28*cos(angle-PI*2/9)*reductionRate,-28*sin(angle-PI*2/9));  
    endShape(CLOSE);
    beginShape();
    curveVertex(32*cos(angle+PI/3)*reductionRate,-32*sin(angle+PI/3));
    curveVertex(32*cos(angle+PI/3)*reductionRate,-32*sin(angle+PI/3));
    curveVertex(80*cos(angle+PI*2/9)*reductionRate,-80*sin(angle+PI*2/9));
    curveVertex(112*cos(angle+PI/9)*reductionRate,-112*sin(angle+PI/9));
    curveVertex(112*cos(angle+PI/9)*reductionRate,-112*sin(angle+PI/9));
    curveVertex(80*cos(angle+PI/5)*reductionRate,-80*sin(angle+PI/5));
    curveVertex(28*cos(angle+PI*2/9)*reductionRate,-28*sin(angle+PI*2/9));  
    curveVertex(28*cos(angle+PI*2/9)*reductionRate,-28*sin(angle+PI*2/9));  
    endShape(CLOSE);
    //目
    stroke(0);
    strokeWeight(5);
    noFill();
    ellipse(30*cos(angle-PI*2/9)*reductionRate,-30*sin(angle-PI*2/9),10,10);
    ellipse(30*cos(angle-PI*16/9)*reductionRate,-30*sin(angle-PI*16/9),10,10);
    }
  
  popMatrix();
  }
}