class Confetti extends Particle {
  
  Confetti(PVector l) {
    super(l);
  }
  
  void display() {
    float theta = map(position.x, 0, width, 0, TWO_PI*2);
    
    rectMode(CENTER);
    fill(0, lifespan);
    stroke(0, lifespan);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    rect(0,0,8,8);
    popMatrix();
    rect(position.x, position.y, 8, 8);
  }
}