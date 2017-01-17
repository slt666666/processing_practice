Mover[] movers = new Mover[20];

void setup(){
  size(640, 360, P3D);
  background(255);
  for (int i = 0; i < movers.length; i++){
    movers[i] = new Mover();
  }
}

void draw(){
  background(255);
  
  for (int i = 0; i < movers.length; i++){
    movers[i].update();
    movers[i].checkEdge();
    movers[i].display();
  }
}

class Mover{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  Mover(){
    location = new PVector(random(width), random(height), random(-1000,0));
    velocity = new PVector(0,0,0);
    topspeed = 4;
  }
  
  void update(){
    PVector mouse = new PVector(mouseX, mouseY, random(100));
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(0.5);
    acceleration = dir;
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  void display(){
    stroke(0);
    fill(175);
    pushMatrix();
    translate(location.x, location.y, location.z);
    sphere(15);
    popMatrix();
  }
  
  void checkEdge(){
    if (location.x > width){
      location.x = 0;
    }else if (location.x < 0){
      location.x = width;
    }
    
    if (location.y > height){
      location.y = 0;
    }else if(location.y < 0){
      location.y = height;
    }
    
    if (location.z > 0){
      location.x = random(width);
      location.y = random(height);
      location.z = -1000;
    }
  }
}