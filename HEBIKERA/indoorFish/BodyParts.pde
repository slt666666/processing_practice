class BodyParts {

  PVector position;
  PVector velocity;
  float topspeed;
  float reductionRate;
  float angle;
  
  BodyParts(float x, float y) {
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    topspeed = 5;
  }

  void update(BodyParts target) {
    
    velocity = PVector.sub(target.position, position);
    float distance = velocity.mag();
    velocity.normalize();
    if (distance < 30){
      velocity.mult(map(distance,0,100,0,topspeed));
    }else{
      velocity.mult(topspeed);
    }
    
    position.add(velocity);
    
  }

  void display() {
    // processingでは上ほどyが小さく、下ほどyが大きい。
    // radian、角度を使う計算を取り入れるときは注意
    // 今回は正規の座標系で計算してからprocessing座標に変換する
    
    angle = atan2(-velocity.y, velocity.x);
    float mapAngle = abs(angle);
    if (mapAngle >= PI/2){ 
      reductionRate = map(mapAngle,PI/2,PI,0,1);
    }else{
      reductionRate = map(mapAngle,0,PI,1,0);
    }
    stroke(random(200));
    strokeWeight(2);
    fill(random(200));
    
  }

}