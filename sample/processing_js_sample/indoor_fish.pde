Flock creatures;

void setup() {
  size(innerWidth,innerHeight);
  creatures = new Flock(1);
}

void draw() {
  fill(220, 120);
  rect(0,0,width,height);
  creatures.update();
  creatures.display();
  text("Click to generate new Indoor fish", 0, height-10);
}

void mousePressed(){
   creatures.addCreature();
}

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
    stroke(random(200));
    strokeWeight(2);
    fill(random(200));
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
    stroke(random(200));
    strokeWeight(2);
    fill(random(200));
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

class Creature {
  ArrayList<Body> bodies;
  float[] tailParts = new float[8];
  Head brain;

  Creature(int num, Head head){
    brain = head;
    bodies = new ArrayList<Body>();
    for (int i = 0; i < num; i++){
      bodies.add(new Body(head.position.x,head.position.y));
    }
  }

  void update(ArrayList<Creature> creatures){
    //頭部の更新
    brain.update(creatures);
    //頭部に接続してるBodyパーツ更新
    Body neck = bodies.get(0);
    neck.update(brain);
    //その他のBodyパーツ更新
    for (int i = 1; i < bodies.size(); i++){
      bodies.get(i).update2(bodies.get(i-1));
    }
  }

  void display(){
    bodies.get(bodies.size()-1).displayTail();
    for (int i = bodies.size()-3; i >= 0; i--){
      bodies.get(i).displayBody();
    }
    brain.display();
  }

  void connect(){
    stroke(255);
    noFill();
    beginShape();
    //vertex(brain.position.x,brain.position.y);
    for (int i = 0; i < bodies.size(); i++){
      vertex(bodies.get(i).position.x, bodies.get(i).position.y);
    }
    endShape();
  }
}

class Flock{
  ArrayList<Creature> creatures;

  Flock(int num){
    creatures = new ArrayList<Creature>();
    for (int i = 0; i < num; i++){
      Head brain = new Head(random(width), random(height));
      creatures.add(new Creature(7, brain));
    }
  }

  void addCreature(){
    Head brain = new Head(mouseX, mouseY);
    creatures.add(new Creature(6, brain));
  }

  void update(){
    for (Creature c: creatures){
      c.update(creatures);
    }
  }

  void display(){
    for (Creature c: creatures){
      c.display();
      c.connect();
    }
  }
}

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
    stroke(random(200));
    strokeWeight(2);
    pushMatrix();
    translate(position.x, position.y);
    fill(random(200));
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
    stroke(0);
    strokeWeight(2);
    fill(0);
    ellipse(0,0,10*reductionRate,10);
    popMatrix();
  }

}
