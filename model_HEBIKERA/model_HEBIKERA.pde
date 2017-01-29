import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

VerletPhysics2D physics;

Flock flock;

ArrayList<Monster> particles = new ArrayList<Monster>();
ArrayList<ArrayList> parts = new ArrayList<ArrayList>();

float len = 10;
float strength = 0.2;
int numParticles = 10;

void setup(){
  size(640, 360);
  flock = new Flock();
  
  //物理ライブラリー設定
  physics = new VerletPhysics2D();
  //physics.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.5)));
  physics.setWorldBounds(new Rect(0,0,width,height));
  
  for (int i = 0; i < 1; i++){
    Monster m = new Monster(width/2, height/2);
    flock.addMonster(m);
    physics.addParticle(m);
    for (int j = 0; j < 5; j++){
      Monster particle = new Monster(width/2, j*len+height/2);
      physics.addParticle(particle);
      particles.add(particle);
      if (j == 0){
        Monster previous = m;
        VerletSpring2D spring = new VerletSpring2D(particle,previous,len,strength);
        physics.addSpring(spring);
      }else{
        Monster previous = particles.get(j-1);
        VerletSpring2D spring = new VerletSpring2D(particle,previous,len,strength);
        physics.addSpring(spring);
      }
    }
  }
}

void draw(){
  physics.update();
  
  background(255);
  flock.run();
 
  background(255);
  
  stroke(0);
  noFill();
  beginShape();
  for (Monster p : particles){
    vertex(p.x,p.y);
  }
  endShape();
  for (Monster p : particles){
    p.display();
  }
}