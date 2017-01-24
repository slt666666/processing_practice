class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
   Particle(PVector l){
    position = l.get();
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    lifespan = 255.0;
   }

  void run(){
    update();
    display();
  }
  
  void update(){
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0;
  }
  
  void display(){
    stroke(0, lifespan);
    fill(127, lifespan);
    ellipse(position.x, position.y, 8, 8);
  }
  
  boolean isDead(){
    if (lifespan < 0.0){
      return true;
    }else{
      return false;
    }
  }
}