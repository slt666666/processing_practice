Flock creatures;

void setup() {
  size(640,360);
  //loadPixels ();
  //float xoff = 0.0;
  //for (int x = 0; x < width; x++) {
  //    float yoff = 0.0;
  //    for (int y = 0; y < height; y++) {
  //        float bright = map (noise (xoff, yoff), 0, 1, 0, 255);
  //        pixels[x + y * width] = color (bright);
  //        yoff += 0.01;
  //    }
  //    xoff += 0.01;
  //}
  //updatePixels ();
  creatures = new Flock(1);
}

void draw() {
  fill(220, 120);
  rect(0,0,width,height);
  creatures.update();
  creatures.display();
  text("Click to generate new Indoor fish", 0, height-10);
}

void mousePressed(){
   creatures.addCreature();
}