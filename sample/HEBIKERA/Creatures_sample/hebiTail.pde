class hebiTail extends BodyParts{
  
  float tailNum;
  
  hebiTail(float x, float y, int num){
    super(x, y);
    tailNum = map(num, 8, 0, 0.1, 0.8);
  }
  
  void display() {
    super.display();
    pushMatrix();
    translate(position.x, position.y);
    beginShape();
    if(angle <= PI/2 && angle >= -PI/2){
      vertex(30*cos(angle)*reductionRate*tailNum,-30*sin(angle)*tailNum);
      vertex(30*cos(angle+PI/3)*reductionRate*tailNum,-30*sin(angle+PI/3)*tailNum);
      vertex(35*cos(angle+PI*2/3)*reductionRate*tailNum,-35*sin(angle+PI*2/3)*tailNum);
      curveVertex(35*cos(angle+PI*2/3)*reductionRate*tailNum,-35*sin(angle+PI*2/3)*tailNum);
      curveVertex(30*cos(angle+PI*11/12)*reductionRate*tailNum,-30*sin(angle+PI*11/12)*tailNum);
      curveVertex(40*cos(angle+PI)*reductionRate*tailNum,-40*sin(angle+PI)*tailNum);
      curveVertex(40*cos(angle+PI)*reductionRate*tailNum,-40*sin(angle+PI)*tailNum);
      curveVertex(30*cos(angle+PI*13/12)*reductionRate*tailNum,-30*sin(angle+PI*13/12)*tailNum);
      curveVertex(35*cos(angle+PI*3/3)*reductionRate*tailNum,-35*sin(angle+PI*3/3)*tailNum);
      curveVertex(35*cos(angle+PI*3/3)*reductionRate*tailNum,-35*sin(angle+PI*3/3)*tailNum);
      vertex(30*cos(angle+PI*5/3)*reductionRate*tailNum,-30*sin(angle+PI*5/3)*tailNum);
    }else{
    //左向き
      vertex(30*cos(angle)*reductionRate*tailNum,-30*sin(angle)*tailNum);
      vertex(30*cos(angle-PI/3)*reductionRate*tailNum,-30*sin(angle-PI/3)*tailNum);
      vertex(35*cos(angle-PI*2/3)*reductionRate*tailNum,-35*sin(angle-PI*2/3)*tailNum);
      curveVertex(35*cos(angle-PI*2/3)*reductionRate*tailNum,-35*sin(angle-PI*2/3)*tailNum);
      curveVertex(30*cos(angle-PI*11/12)*reductionRate*tailNum,-30*sin(angle-PI*11/12)*tailNum);
      curveVertex(40*cos(angle-PI)*reductionRate*tailNum,-40*sin(angle-PI)*tailNum);
      curveVertex(40*cos(angle-PI)*reductionRate*tailNum,-40*sin(angle-PI)*tailNum);
      curveVertex(30*cos(angle-PI*13/12)*reductionRate*tailNum,-30*sin(angle-PI*13/12)*tailNum);
      curveVertex(35*cos(angle-PI*3/3)*reductionRate*tailNum,-35*sin(angle-PI*3/3)*tailNum);
      curveVertex(35*cos(angle-PI*3/3)*reductionRate*tailNum,-35*sin(angle-PI*3/3)*tailNum);
      vertex(30*cos(angle-PI*5/3)*reductionRate*tailNum,-30*sin(angle-PI*5/3)*tailNum);
    }
    endShape(CLOSE);
    popMatrix();
  }
}