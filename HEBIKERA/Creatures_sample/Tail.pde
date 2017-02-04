class Tail extends BodyParts{
  
  Tail(float x, float y){
    super(x, y);
  }
  
  void display() {
    super.display();
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