class Head {

  PVector position;
  PVector velocity;
  float topspeed;

  Head(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(0,0);
    topspeed = 5;
  }
  
  void update(ArrayList<Creature> creatures) {
    PVector followP = follow();
    PVector separateP = separate(creatures);
    velocity.add(followP);
    velocity.add(separateP);
    velocity.limit(topspeed);
    position.add(velocity);
}
  
  PVector follow() {
    
    PVector mouse = new PVector(mouseX,mouseY);
    PVector followPower = PVector.sub(mouse,position);
    followPower.setMag(0.2);
    followPower.limit(topspeed);
    return followPower;
  }
  
  PVector separate(ArrayList<Creature> creatures){
    float desiredDistance = 20;
    PVector sum = new PVector();
    int count = 0;
    for (Creature c: creatures){
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
    float angle = velocity.heading();
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