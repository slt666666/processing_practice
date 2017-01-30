class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    position = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    topspeed = 5;
  }

  void update() {
    
    PVector mouse = new PVector(mouseX,mouseY);
    PVector acceleration = PVector.sub(mouse,position);
    acceleration.setMag(0.2);
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    position.add(velocity);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(position.x,position.y,48,48);
  }
  
  void display2() {
    float angle = velocity.heading();
    stroke(0);
    strokeWeight(2);
    noFill();
    pushMatrix();
    translate(position.x, position.y);
    beginShape();
    vertex(48*cos(angle),48*sin(angle));
    vertex(48*cos(angle+radians(120)),48*sin(angle+radians(120)));
    vertex(48*cos(angle-radians(120)),48*sin(angle-radians(120)));
    endShape(CLOSE);
    popMatrix();
  }

}