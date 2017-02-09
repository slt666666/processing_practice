Flock fishes;
pathfinder[] paths;

void setup(){
  size(720, 480, P3D);
  background(0);
  fishes = new Flock(5,2);
  paths = new pathfinder[1];
  paths[0] = new pathfinder(width/2, height, -150);
}

void draw() {

  fill(0,0,0,10);
  beginShape();
  vertex(-width*2,height*2,-400);
  vertex(-width*2,-height*2,-400);
  vertex(width*2,-height*2,-400);  
  vertex(width*2,height*2,-400);
  endShape(CLOSE);

  fishes.deadCheck();
  fishes.update();
  fishes.display();
  
  stroke(255);
  beginShape();
  vertex(0,height,0);
  vertex(width,height,0);
  vertex(width,height,-300);  
  vertex(0,height,-300);
  endShape(CLOSE);
  
  beginShape();
  vertex(0,0,0);
  vertex(width,0,0);
  vertex(width,0,-300);  
  vertex(0,0,-300);
  endShape(CLOSE);
  
  for (int i=0;i<paths.length;i++) {
    PVector loc = paths[i].location;
    float diam = paths[i].diameter;
    pushMatrix();
    translate(0,0,paths[i].zPos);
    ellipse(loc.x, loc.y, diam, diam);
    popMatrix();
    paths[i].update();
  }
}

void mousePressed(){
   fishes.addFish(5);  
}