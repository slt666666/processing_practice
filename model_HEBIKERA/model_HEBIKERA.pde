import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

VerletPhysics2D physics;

ArrayList<Monster> Monsters = new ArrayList<Monster>();

float len = 10;
float strength = 0.2;
int numMonsters = 20;

void setup(){
  size(640, 360);
  physics = new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.5)));
  physics.setWorldBounds(new Rect(0,0,width,height));
  
  for (int i = 0; i < numMonsters; i++){
    Monster Monster = new Monster(i*len, 10);
    physics.addParticle(Monster);
    Monsters.add(Monster);
    if (i != 0){
      Monster previous = Monsters.get(i-1);
      VerletSpring2D spring = new VerletSpring2D(Monster,previous,len,strength);
      physics.addSpring(spring);
    }
  }
  
  Monster head = Monsters.get(0);
  head.lock();
}

void draw(){
  physics.update();
  background(255);
  
  stroke(0);
  noFill();
  beginShape();
  for (Monster p : Monsters){
    vertex(p.x,p.y);
  }
  endShape();
  for (Monster p : Monsters){
    p.display();
  }
}