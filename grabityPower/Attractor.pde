class Attractor {
  float mass;
  PVector position;
  float G;
  
  Attractor() {
    position = new PVector(width/2, height/2);
    mass = 20;
    G = 1;
  }
  
  void display() {
    stroke(0);
    fill(175, 200);
    ellipse(position.x, position.y, mass*2, mass*2);
  }
  
  PVector attract(Mover m) {
    PVector force = PVector.sub(position, m.position);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);
    force.normalize();
    float strength = (G * mass * m.mass)/(distance * distance);
    force.mult(strength);
    
    return force;
  }
}