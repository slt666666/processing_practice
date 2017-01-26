import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;

Box2DProcessing box2d;    

void setup() {
  size(640, 360);
  box2d = new Box2DProcessing(this);  
  box2d.createWorld();

  boxes = new ArrayList<Box>();
}

void draw() {
  background(255);

  box2d.step();    // 各ボディの処理方法を解決

  Box p = new Box(mouseX, mouseY);
  boxes.add(p);

  for (Box b: boxes) {
    b.display();
  }
}