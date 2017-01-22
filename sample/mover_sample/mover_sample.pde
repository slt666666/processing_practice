Mover[] movers = new Mover[100];

void setup(){
  size(640, 360);
  background(255);
  for (int i = 0; i < movers.length; i++){
    movers[i] = new Mover(random(0.1,5) ,0 ,0);
  }
}

void draw(){
  background(255);
  
  PVector wind = new PVector(0.003, 0);
  PVector gravity = new PVector(0, 0.1);
  
  for (int i = 0; i < movers.length; i++){
    
    float c = 0.01;
    PVector friction = movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);
    movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].checkEdge();
    movers[i].display();
  }
}