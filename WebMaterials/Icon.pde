class Icon {
 
  float positionX;
  float positionY;
  int slide;
  boolean appeared;
  PImage img;

  Icon(float x, float y) {
    positionX = x;
    positionY = y;
    slide = 1;
    img = loadImage("setting1.png");
    appeared = false;
  }
  
  void appear() {
    
    stroke(200);
    ellipse(positionX,positionY-50+slide,40,40);
    slide += 10;
    if (slide > 49){
      appeared = true; 
    }
    
  }
  
  void display() {
    if (dist(mouseX,mouseY,positionX,positionY) < 20) {
      fill(255,183,76);
      stroke(255,183,76);
      ellipse(positionX,positionY,40,40);
      strokeWeight(2);
      stroke(0);
      ellipse(positionX,positionY,38,38);
      noTint();
      image(img, positionX-13, positionY-13, 26, 26);
    }else{
      fill(200);
      stroke(200);
      ellipse(positionX,positionY,40,40);
      strokeWeight(2);
      stroke(0);
      ellipse(positionX,positionY,38,38);
      tint(0,100);
      image(img, positionX-13, positionY-13, 26, 26);
    }
  }
}