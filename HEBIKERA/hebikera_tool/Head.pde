class Head {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Head() {
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
    float angle = velocity.heading();
    stroke(0);
    strokeWeight(2);
    noFill();
    pushMatrix();
    translate(position.x, position.y);
    beginShape();
    vertex(10*cos(angle),10*sin(angle));
    vertex(10*cos(angle+radians(120)),10*sin(angle+radians(120)));
    vertex(10*cos(angle-radians(120)),10*sin(angle-radians(120)));
    endShape(CLOSE);
    popMatrix();
  }

}