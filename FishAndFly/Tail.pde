class Tail extends BodyParts{
  
  Tail(float x, float y){
    super(x, y);
  }
  
  void display() {
    super.display();
    pushMatrix();
    translate(position.x, position.y);
    beginShape();
    vertex(8*cos(angle)*reductionRate,-8*sin(angle));
    vertex(4*cos(angle+PI/2)*reductionRate,-4*sin(angle+PI/2));
    vertex(24*cos(angle+PI)*reductionRate,-24*sin(angle+PI));
    vertex(4*cos(angle+PI*3/2)*reductionRate,-4*sin(angle+PI*3/2));
    endShape(CLOSE);
    popMatrix();
  }
}