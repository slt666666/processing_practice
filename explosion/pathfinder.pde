class pathfinder {
  
  PVector location;
  PVector velocity;
  float zPos;
  float colNum;
  float diameter;
  
  pathfinder(float x, float y, float z) {
    location = new PVector(x, y);
    velocity = new PVector(0, -1);
    diameter = 16;
    colNum = random(255);
    zPos = z;
  }
  
   pathfinder(pathfinder parent) {
     location = parent.location.get();
     zPos = parent.zPos;
     colNum = parent.colNum;
     velocity = parent.velocity.get();
     diameter = parent.diameter*0.7;
     parent.diameter = parent.diameter*0.7;
   }
   
   void update(){
     if ( diameter > 0.5 ) {
       location.add(velocity);
       PVector bump = new PVector(random(-1, 1), random(-1, 1), 0);
       bump.mult(0.1);
       velocity.add(bump);
       velocity.normalize();
       if (random(0,1)<0.02){
         paths = (pathfinder[])append(paths, new pathfinder(this));
       }
     }
   }
}