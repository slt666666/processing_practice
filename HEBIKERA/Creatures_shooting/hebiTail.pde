class hebiTail extends BodyParts{
  
  float tailNum;
  
  hebiTail(float x, float y, int num){
    super(x, y);
    tailNum = map(num, 11, 0, 0.1, 1.0);
  }
  
  void display() {
    super.display();
    pushMatrix();
    translate(position.x, position.y);
    beginShape();
    if(angle <= PI/2 && angle >= -PI/2){
      vertex(12*cos(angle)*reductionRate*tailNum,-12*sin(angle)*tailNum);
      vertex(12*cos(angle+PI/3)*reductionRate*tailNum,-12*sin(angle+PI/3)*tailNum);
      vertex(14*cos(angle+PI*2/3)*reductionRate*tailNum,-14*sin(angle+PI*2/3)*tailNum);
      curveVertex(14*cos(angle+PI*2/3)*reductionRate*tailNum,-14*sin(angle+PI*2/3)*tailNum);
      curveVertex(12*cos(angle+PI*11/12)*reductionRate*tailNum,-12*sin(angle+PI*11/12)*tailNum);
      curveVertex(16*cos(angle+PI)*reductionRate*tailNum,-16*sin(angle+PI)*tailNum);
      curveVertex(16*cos(angle+PI)*reductionRate*tailNum,-16*sin(angle+PI)*tailNum);
      curveVertex(12*cos(angle+PI*13/12)*reductionRate*tailNum,-12*sin(angle+PI*13/12)*tailNum);
      curveVertex(14*cos(angle+PI*3/3)*reductionRate*tailNum,-14*sin(angle+PI*3/3)*tailNum);
      curveVertex(14*cos(angle+PI*3/3)*reductionRate*tailNum,-14*sin(angle+PI*3/3)*tailNum);
      vertex(12*cos(angle+PI*5/3)*reductionRate*tailNum,-12*sin(angle+PI*5/3)*tailNum);
    }else{
    //左向き
      vertex(12*cos(angle)*reductionRate*tailNum,-12*sin(angle)*tailNum);
      vertex(12*cos(angle-PI/3)*reductionRate*tailNum,-12*sin(angle-PI/3)*tailNum);
      vertex(14*cos(angle-PI*2/3)*reductionRate*tailNum,-14*sin(angle-PI*2/3)*tailNum);
      curveVertex(14*cos(angle-PI*2/3)*reductionRate*tailNum,-14*sin(angle-PI*2/3)*tailNum);
      curveVertex(12*cos(angle-PI*11/12)*reductionRate*tailNum,-12*sin(angle-PI*11/12)*tailNum);
      curveVertex(16*cos(angle-PI)*reductionRate*tailNum,-16*sin(angle-PI)*tailNum);
      curveVertex(16*cos(angle-PI)*reductionRate*tailNum,-16*sin(angle-PI)*tailNum);
      curveVertex(12*cos(angle-PI*13/12)*reductionRate*tailNum,-12*sin(angle-PI*13/12)*tailNum);
      curveVertex(14*cos(angle-PI*3/3)*reductionRate*tailNum,-14*sin(angle-PI*3/3)*tailNum);
      curveVertex(14*cos(angle-PI*3/3)*reductionRate*tailNum,-14*sin(angle-PI*3/3)*tailNum);
      vertex(12*cos(angle-PI*5/3)*reductionRate*tailNum,-12*sin(angle-PI*5/3)*tailNum);
    }
    endShape(CLOSE);
    popMatrix();
  }
}