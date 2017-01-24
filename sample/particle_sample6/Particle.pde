class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  PImage img;
  
  float mass = 1;
  
  Particle(PVector l, PImage img_){
    position = l.get();
    acceleration = new PVector(0, 0);
    float vx = (float) generator.nextGaussian()*0.3;
    float vy = (float) generator.nextGaussian()*0.3 - 1.0;
    
    velocity = new PVector(vx, vy);
    lifespan = 100.0;
    img = img_;
  }

  void run(){
    update();
    display();
  }
  
  void update(){
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.5;
  }
  
  void display(){
    noStroke();
    fill(127, lifespan);
    ellipse(position.x, position.y, img.width, img.height);
  }
  
  boolean isDead(){
    if (lifespan < 0.0){
      return true;
    }else{
      return false;
    }
  }
  
  void applyForce(PVector force){
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
}