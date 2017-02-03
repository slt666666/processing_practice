class Middle extends BodyParts {

  Middle(float x, float y) {
    super(x, y);
  }

  void display() {
    super.display();
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

}