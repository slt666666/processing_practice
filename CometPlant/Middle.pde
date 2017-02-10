class Middle extends BodyParts {

  Middle(float x, float y, float z, float col) {
    super(x, y, z, col);
  }

  void display() {
    super.display();
    pushMatrix();
    translate(position.x, position.y, position.z);
    beginShape();
    if(angle <= PI/2 && angle >= -PI/2){
      vertex(8*cos(angle)*reductionRate,-8*sin(angle));
      vertex(18*cos(angle+PI*3/5)*reductionRate,-18*sin(angle+PI*3/5));
      vertex(8*cos(angle+PI/2)*reductionRate,-8*sin(angle+PI/2));
      vertex(12*cos(angle+PI*9/10)*reductionRate,-12*sin(angle+PI*9/10));
      vertex(8*cos(angle+PI*7/6)*reductionRate,-8*sin(angle+PI*7/6));
      vertex(12*cos(angle+PI*13/10)*reductionRate,-12*sin(angle+PI*13/10));
      vertex(8*cos(angle+PI*13/10)*reductionRate,-8*sin(angle+PI*13/10));
      vertex(8*cos(angle+PI*8/5)*reductionRate,-8*sin(angle+PI*8/5));
    }else{
    //左向き
      vertex(8*cos(angle)*reductionRate,-8*sin(angle));
      vertex(18*cos(angle-PI*3/5)*reductionRate,-18*sin(angle-PI*3/5));
      vertex(8*cos(angle-PI/2)*reductionRate,-8*sin(angle-PI/2));
      vertex(12*cos(angle-PI*9/10)*reductionRate,-12*sin(angle-PI*9/10));
      vertex(8*cos(angle-PI*7/6)*reductionRate,-8*sin(angle-PI*7/6));
      vertex(12*cos(angle-PI*13/10)*reductionRate,-12*sin(angle-PI*13/10));
      vertex(8*cos(angle-PI*13/10)*reductionRate,-8*sin(angle-PI*13/10));
      vertex(8*cos(angle-PI*8/5)*reductionRate,-8*sin(angle-PI*8/5));
    }
    endShape(CLOSE);
    popMatrix();
  }

}