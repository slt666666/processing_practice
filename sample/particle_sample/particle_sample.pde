import java.util.*;
ArrayList<Particle> particles;

void setup(){
  size(640, 360);
  particles = new ArrayList<Particle>();
}

void draw(){
  background(255);
  particles.add(new Particle(new PVector(width/2, 50)));
  
  Iterator<Particle> it = particles.iterator();
  
  while (it.hasNext()){
    Particle p = it.next();
    p.run();
    if (p.isDead()){
      it.remove();
    }
  }
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  Particle(PVector l){
    location = l.get();
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    lifespan = 255;
  }
  
  void run(){
    update();
    display();
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }
  
  void display(){
    stroke(0, lifespan);
    fill(175, lifespan);
    ellipse(location.x, location.y, 8, 8);
  }
  
  boolean isDead(){
    if (lifespan < 0.0){
      return true;
    }else{
      return false;
    }
  }
}