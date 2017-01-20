class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x, float y) {
    mass = m;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(0,100);
    ellipse(position.x, position.y, mass*25, mass*25);
  }
  
  PVector attract(Mover m){
    PVector force = PVector.sub(position, m.position);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);
    force.normalize();
    
    float strength = (g * mass * mass)/(distance * distance);
    force.mult(strength);
    return force;
  }
}