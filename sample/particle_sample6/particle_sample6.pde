import java.util.*;
ParticleSystem ps;
Random generator;

void setup() {
  size(640,360);
  generator = new Random();
  PImage img = loadImage("texture.png");
  ps = new ParticleSystem(0,new PVector(width/2,height-75), img);
  smooth();
}

void draw() {
  background(0);
  
  float dx = map(mouseX,0,width,-0.2,0.2);
  PVector wind = new PVector(dx,0);

  ps.applyForce(wind);
  ps.run();
  for (int i = 0; i < 2; i++){
    ps.addParticle();
  }
  drawVector(wind, new PVector(width/2,50,0),500);
}

void drawVector(PVector v, PVector pos, float scayl) {
  pushMatrix();
  float arrowsize = 4;
  translate(pos.x,pos.y);
  stroke(255);
  rotate(v.heading2D());
  float len = v.mag()*scayl;
  line(0,0,len,0);
  line(len,0,len-arrowsize,+arrowsize/2);
  line(len,0,len-arrowsize,-arrowsize/2);
  popMatrix();
}