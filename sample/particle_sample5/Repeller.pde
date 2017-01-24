class Repeller{
  float strength = 100;
  PVector position;
  float r = 10;
  
  Repeller(float x, float y){
    position = new PVector(x, y);
  }
  
  void display(){
    stroke(255);
    fill(255);
    ellipse(position.x, position.y, r*2, r*2);
  }
  
  PVector repel(Particle p){
    PVector dir = PVector.sub(position, p.position);
    float d = dir.mag();
    d = constrain(d,5,100);
    dir.normalize();
    float force = -1*strength/(d*d);
    dir.mult(force);
    return dir;
  }
}