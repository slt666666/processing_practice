class Head {

  PVector position;
  PVector velocity;
  float topspeed;
  float reductionRate;

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
    float desiredDistance = 30;
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
    // processingでは上ほどyが小さく、下ほどyが大きい。
    // radian、角度を使う計算を取り入れるときは注意
    // 今回は正規の座標系で計算してからprocessing座標に変換する
    float angle = atan2(-velocity.y,velocity.x);
    reductionRate = map(abs(velocity.x),0,5,0,1);
    stroke(0);
    strokeWeight(2);
    pushMatrix();
    translate(position.x, position.y);
    fill(255);
    beginShape();
    //右向き
    if(angle <= PI/2 && angle >= -PI/2){
      vertex(40*cos(angle-PI/6)*reductionRate,-40*sin(angle-PI/6));
      vertex(15*cos(angle-PI*5/6)*reductionRate,-15*sin(angle-PI*5/6));
      vertex(30*cos(angle+PI*2/3)*reductionRate,-30*sin(angle+PI*2/3));
      vertex(50*cos(angle+PI*2/3)*reductionRate,-50*sin(angle+PI*2/3));
      vertex(30*cos(angle+PI/3)*reductionRate,-30*sin(angle+PI/3));
    }else{
    //左向き
      vertex(40*cos(angle+PI/6)*reductionRate,-40*sin(angle+PI/6));
      vertex(15*cos(angle+PI*5/6)*reductionRate,-15*sin(angle+PI*5/6));
      vertex(30*cos(angle-PI*2/3)*reductionRate,-30*sin(angle-PI*2/3));
      vertex(50*cos(angle-PI*2/3)*reductionRate,-50*sin(angle-PI*2/3));
      vertex(30*cos(angle-PI/3)*reductionRate,-30*sin(angle-PI/3));
    }
    endShape(CLOSE);
    //目
    fill(0);
    ellipse(0,0,10*reductionRate,10);
    popMatrix();
  }

}