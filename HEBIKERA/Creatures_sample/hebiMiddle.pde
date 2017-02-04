class hebiMiddle extends BodyParts {

  hebiMiddle(float x, float y) {
    super(x, y);
  }

  void update(BodyParts target) {
    
    velocity = PVector.sub(target.position, position);
    float distance = velocity.mag();
    velocity.normalize();
    if (distance < 40){
      velocity.mult(map(distance,0,100,0,topspeed));
    }else{
      velocity.mult(topspeed);
    }
    
    position.add(velocity);
    
  }

  void display() {
    super.display();
    pushMatrix();
    translate(position.x, position.y);
    if(angle <= PI/2 && angle >= -PI/2){
    //右向き
      beginShape();
      vertex(30*cos(angle)*reductionRate,-30*sin(angle));
      vertex(30*cos(angle+PI/3)*reductionRate,-30*sin(angle+PI/3));
      vertex(35*cos(angle+PI*2/3)*reductionRate,-35*sin(angle+PI*2/3));
      curveVertex(35*cos(angle+PI*2/3)*reductionRate,-35*sin(angle+PI*2/3));
      curveVertex(30*cos(angle+PI*11/12)*reductionRate,-30*sin(angle+PI*11/12));
      curveVertex(40*cos(angle+PI)*reductionRate,-40*sin(angle+PI));
      curveVertex(40*cos(angle+PI)*reductionRate,-40*sin(angle+PI));
      curveVertex(30*cos(angle+PI*13/12)*reductionRate,-30*sin(angle+PI*13/12));
      curveVertex(35*cos(angle+PI*4/3)*reductionRate,-35*sin(angle+PI*4/3));
      curveVertex(35*cos(angle+PI*4/3)*reductionRate,-35*sin(angle+PI*4/3));
      vertex(30*cos(angle+PI*5/3)*reductionRate,-30*sin(angle+PI*5/3));
      endShape(CLOSE);
      //羽
      beginShape();
      curveVertex(30*cos(angle+PI/2)*reductionRate,-30*sin(angle+PI/2)*reductionRate);
      curveVertex(30*cos(angle+PI/2)*reductionRate,-30*sin(angle+PI/2)*reductionRate);
      curveVertex(200*cos(angle+PI/2)*reductionRate,-200*sin(angle+PI/2)*reductionRate);
      curveVertex(75*cos(angle+PI*3/5)*reductionRate,-75*sin(angle+PI*3/5)*reductionRate);
      curveVertex(30*cos(angle+PI/2)*reductionRate,-30*sin(angle+PI/2)*reductionRate);
      curveVertex(30*cos(angle+PI/2)*reductionRate,-30*sin(angle+PI/2)*reductionRate);
      endShape(CLOSE);
      beginShape();
      curveVertex(30*cos(angle-PI/2)*reductionRate,-30*sin(angle-PI/2)*reductionRate);
      curveVertex(30*cos(angle-PI/2)*reductionRate,-30*sin(angle-PI/2)*reductionRate);
      curveVertex(200*cos(angle-PI/2)*reductionRate,-200*sin(angle-PI/2)*reductionRate);
      curveVertex(75*cos(angle-PI*3/5)*reductionRate,-75*sin(angle-PI*3/5)*reductionRate);
      curveVertex(30*cos(angle-PI/2)*reductionRate,-30*sin(angle-PI/2)*reductionRate);
      curveVertex(30*cos(angle-PI/2)*reductionRate,-30*sin(angle-PI/2)*reductionRate);
      endShape(CLOSE);
    }else{
    //左向き
      beginShape();
      vertex(30*cos(angle)*reductionRate,-30*sin(angle));
      vertex(30*cos(angle-PI/3)*reductionRate,-30*sin(angle-PI/3));
      vertex(35*cos(angle-PI*2/3)*reductionRate,-35*sin(angle-PI*2/3));
      curveVertex(35*cos(angle-PI*2/3)*reductionRate,-35*sin(angle-PI*2/3));
      curveVertex(30*cos(angle-PI*11/12)*reductionRate,-30*sin(angle-PI*11/12));
      curveVertex(40*cos(angle-PI)*reductionRate,-40*sin(angle-PI));
      curveVertex(40*cos(angle-PI)*reductionRate,-40*sin(angle-PI));
      curveVertex(30*cos(angle-PI*13/12)*reductionRate,-30*sin(angle-PI*13/12));
      curveVertex(35*cos(angle-PI*4/3)*reductionRate,-35*sin(angle-PI*4/3));
      curveVertex(35*cos(angle-PI*4/3)*reductionRate,-35*sin(angle-PI*4/3));
      vertex(30*cos(angle-PI*5/3)*reductionRate,-30*sin(angle-PI*5/3));
      endShape(CLOSE);
      //羽
      beginShape();
      curveVertex(30*cos(angle-PI/2)*reductionRate,-30*sin(angle-PI/2)*reductionRate);
      curveVertex(30*cos(angle-PI/2)*reductionRate,-30*sin(angle-PI/2)*reductionRate);
      curveVertex(200*cos(angle-PI/2)*reductionRate,-200*sin(angle-PI/2)*reductionRate);
      curveVertex(75*cos(angle-PI*3/5)*reductionRate,-75*sin(angle-PI*3/5)*reductionRate);
      curveVertex(30*cos(angle-PI/2)*reductionRate,-30*sin(angle-PI/2)*reductionRate);
      curveVertex(30*cos(angle-PI/2)*reductionRate,-30*sin(angle-PI/2)*reductionRate);
      endShape(CLOSE);
      beginShape();
      curveVertex(30*cos(angle+PI/2)*reductionRate,-30*sin(angle+PI/2)*reductionRate);
      curveVertex(30*cos(angle+PI/2)*reductionRate,-30*sin(angle+PI/2)*reductionRate);
      curveVertex(200*cos(angle+PI/2)*reductionRate,-200*sin(angle+PI/2)*reductionRate);
      curveVertex(75*cos(angle+PI*3/5)*reductionRate,-75*sin(angle+PI*3/5)*reductionRate);
      curveVertex(30*cos(angle+PI/2)*reductionRate,-30*sin(angle+PI/2)*reductionRate);
      curveVertex(30*cos(angle+PI/2)*reductionRate,-30*sin(angle+PI/2)*reductionRate);
      endShape(CLOSE);
    }
    popMatrix();
  }

}