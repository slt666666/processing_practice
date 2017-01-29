class Monster extends VerletParticle2D{
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;   
  float maxspeed; 
  
  Monster(float x, float y){
    super(x, y);
    position = new PVector(x,y);
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-1,1),random(-1,1));
    r = 3.0;
    maxspeed = 3;
    maxforce = 0.05;
  }

  void run(ArrayList<Monster> monsters) {
    flock(monsters);
    update();
    borders();
    render();
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void flock(ArrayList<Monster> monsters) {
    PVector sep = separate(monsters);   
    PVector ali = align(monsters);      
    PVector coh = cohesion(monsters);  
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    position.add(velocity);
    acceleration.mult(0);
  }

  PVector seek(PVector target) {
    PVector desired = PVector.sub(target,position); 
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce); 
    return steer;
  }
  
  void render() {
    float theta = velocity.heading2D() + radians(90);
    fill(175);
    stroke(0);
    pushMatrix();
    translate(position.x,position.y);
    rotate(theta);
    triangle(-4,4,0,-4,4,4);
    popMatrix();
  }
  
  void display(){
    fill(127);
    stroke(0);
    triangle(x-8,y+8,x,y,x+8,y+8);
  }
  
  void borders() {
    if (position.x < -r) position.x = width+r;
    if (position.y < -r) position.y = height+r;
    if (position.x > width+r) position.x = -r;
    if (position.y > height+r) position.y = -r;
  }

  PVector separate (ArrayList<Monster> monsters) {
    float desiredseparation = 25.0f;
    PVector steer = new PVector(0,0,0);
    int count = 0;
    for (Monster other : monsters) {
      float d = PVector.dist(position,other.position);
      if ((d > 0) && (d < desiredseparation)) {
        PVector diff = PVector.sub(position,other.position);
        diff.normalize();
        diff.div(d);       
        steer.add(diff);
        count++;
      }
    }
    if (count > 0) {
      steer.div((float)count);
    }

    if (steer.mag() > 0) {
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }

  PVector align (ArrayList<Monster> monsters) {
    float neighbordist = 50;
    PVector sum = new PVector(0,0);
    int count = 0;
    for (Monster other : monsters) {
      float d = PVector.dist(position,other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum,velocity);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0,0);
    }
  }

  PVector cohesion (ArrayList<Monster> monsters) {
    float neighbordist = 50;
    PVector sum = new PVector(0,0);   
    int count = 0;
    for (Monster other : monsters) {
      float d = PVector.dist(position,other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.position); 
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);
    } else {
      return new PVector(0,0);
    }
  }
}