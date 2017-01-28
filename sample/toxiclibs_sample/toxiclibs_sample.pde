import toxi.geom.*;
import toxi.physics2d.*;

VerletPhysics2D physics;

Cluster cluster;

boolean showPhysics = true;
boolean showParticles = true;

PFont f;

void setup() {
  size(640, 360);
  f = createFont("Georgia", 12, true);

  physics=new VerletPhysics2D();
  physics.setWorldBounds(new Rect(10, 10, width-20, height-20));

  cluster = new Cluster(8, 100, new Vec2D(width/2, height/2));
}

void draw() {

  physics.update();

  background(255);

  if (showParticles) {
    cluster.display();
  }

  if (showPhysics) {
    cluster.showConnections();
  }

  fill(0);
  textFont(f);
  text("'p' to display or hide particles\n'c' to display or hide connections\n'n' for new graph",10,20);
}

void keyPressed() {
  if (key == 'c') {
    showPhysics = !showPhysics;
    if (!showPhysics) showParticles = true;
  } 
  else if (key == 'p') {
    showParticles = !showParticles;
    if (!showParticles) showPhysics = true;
  } 
  else if (key == 'n') {
    physics.clear();
    cluster = new Cluster(int(random(2, 20)), random(10, width/2), new Vec2D(width/2, height/2));
  }
}