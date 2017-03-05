class MenuDetail {
 
  float positionX;
  float positionY;
  int slide;
  boolean appeared;
  PImage img;

  MenuDetail(float x, float y, int selectNum) {
    positionX = x + 30;
    positionY = y;
    slide = 0;
    img = loadImage("setting1.png");
    appeared = false;
  }
  
  boolean insideCheck() {
    return (dist(mouseX,mouseY,positionX,positionY) < 20);
  }
  
  void display() {
    fill(220);
    triangle(positionX, positionY, positionX+20, positionY+10, positionX+20, positionY-10);
    fill(0);
    ellipse(positionX+15,positionY,2,2);
    if (!appeared) {
      fill(220);
      rect(positionX+22, positionY+20, 100, -1-slide);
      slide += 10;
      if (slide > 86) { appeared = true; }
    }else{
      // insideCheck入れる
      fill(220);
      rect(positionX+22, positionY+20, 100, -42);
      tint(0,100);
      image(img, positionX+30, positionY-10, 20, 20);
      fill(220);
      rect(positionX+22, positionY-25, 100, -42);
      tint(0,100);
      image(img, positionX+30, positionY-55, 20, 20);
    }
      //if (insideCheck()) {
      //  fill(255,183,76);
      //  stroke(255,183,76);
      //  ellipse(positionX,positionY,40,40);
      //  strokeWeight(2);
      //  stroke(0);
      //  ellipse(positionX,positionY,38,38);
      //  noTint();
      //  //image(img, positionX-13, positionY-13, 26, 26);
      //}else{
      //  fill(200);
      //  stroke(200);
      //  ellipse(positionX,positionY,40,40);
      //  strokeWeight(2);
      //  stroke(0);
      //  ellipse(positionX,positionY,38,38);
      //  tint(0,100);
      //  //image(img, positionX-13, positionY-13, 26, 26);
      //}
  }
}