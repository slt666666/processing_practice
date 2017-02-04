class Head extends BodyParts{

  int followNum;
  
  Head(float x, float y, int num) {
    super(x, y);
    followNum = num;
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
    PVector followPower = PVector.sub(balls.get(followNum).position,position);
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
    super.display();
  }

}