pathfinder[] paths;
ArrayList<float[]> dataSet = new ArrayList<float[]>();
int k = 0;
int h = 0;
int treenum = 0;

void setup() {
  size(innerWidth, innerHeight);
  background(0);
  ellipseMode(CENTER);
  fill(255);
  noStroke();
  smooth();
  paths = new pathfinder[1];
  paths[0] = new pathfinder();
  float[] data = new float[30000];
  dataSet.add(data);
}
void draw() {
  background(0);
  if (k < 10000){
    for (int i=0;i<paths.length;i++) {
      PVector loc = paths[i].location;
      float diam = paths[i].diameter;
      //ellipse(loc.x, loc.y, diam, diam);
      if (k < 10000){
        dataSet.get(treenum)[k*3] = loc.x;
        dataSet.get(treenum)[k*3+1] = loc.y;
        dataSet.get(treenum)[k*3+2] = diam;
      }
      paths[i].update();
      k += 1;
    }
    for (int j = 0;j < dataSet.get(treenum).length/3; j++){
      ellipse(dataSet.get(treenum)[3*j],dataSet.get(treenum)[3*j+1],dataSet.get(treenum)[3*j+2],dataSet.get(treenum)[3*j+2]);
    }
  }else{
    background(0);
    for (int j = 0;j < dataSet.get(treenum).length/3-h*100; j++){
      ellipse(dataSet.get(treenum)[3*j],dataSet.get(treenum)[3*j+1],dataSet.get(treenum)[3*j+2],dataSet.get(treenum)[3*j+2]);
    }
    h += 1;
  }
}
void mousePressed() {
  k = 0;
  h = 0;
  treenum += 1;
  float[] data = new float[30000];
  dataSet.add(data);
  fill(random(255),random(255),random(255));
  background(0);
  paths = new pathfinder[1];
  paths[0] = new pathfinder();
}

class pathfinder {
  PVector location;
  PVector velocity;
  float diameter;
  pathfinder() {
    location = new PVector(width/2, height);
    velocity = new PVector(0, -1);
    diameter = 16;
  }
  pathfinder(pathfinder parent) {
    location = parent.location.get();
    velocity = parent.velocity.get();
    float area = PI*sq(parent.diameter/2);
    float newDiam = sqrt(area/2/PI)*2;
    diameter = parent.diameter*0.7;
    parent.diameter = parent.diameter*0.7;
  }
  void update() {
    if (diameter>0.5) {
      location.add(velocity);
      PVector bump = new PVector(random(-1, 1), random(-1, 1));
      bump.mult(0.1);
      velocity.add(bump);
      velocity.normalize();
      //velocity.mult(2);
      if (random(0, 1)<0.02) {
        paths = (pathfinder[]) append(paths, new pathfinder(this));
      }
    }
  }
}
