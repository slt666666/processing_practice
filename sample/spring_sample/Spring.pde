class Spring { 

  PVector anchor;

  float len;
  float k = 0.2;
  
  Bob a;
  Bob b;

  Spring(Bob a_, Bob b_, int l) {
    a = a_;
    b = b_;
    len = l;
  } 

  void update() {
    PVector force = PVector.sub(a.position, b.position);
    float d = force.mag();
    float stretch = d - len;

    force.normalize();
    force.mult(-1 * k * stretch);
    a.applyForce(force);
    force.mult(-1);
    b.applyForce(force);
  }


  void display() {
    strokeWeight(2);
    stroke(0);
    line(a.position.x, a.position.y, b.position.x, b.position.y);
  }
}