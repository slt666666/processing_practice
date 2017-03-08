class Icon {
 
  float positionX;
  float positionY;
  int selectNum;
  int slide;
  boolean appeared;
  PImage img;

  Icon(float x, float y, int menuNum) {
    positionX = x;
    positionY = y;
    slide = 1;
    selectNum = menuNum;
    String imageUrl = ("menu"+menuNum+".png");
    img = loadImage(imageUrl);
    appeared = false;
  }
  
  boolean insideCheck() {
    return (dist(mouseX,mouseY,positionX,positionY) < 20);
  }
  
  void appear() {
    
    noStroke();
    fill(200,150);
    ellipse(positionX,positionY-50+slide,40,40);
    slide += 15;
    if (slide > 49){
      appeared = true;
    }
    
  }
  
  void display() {
    if (insideCheck()) {
      fill(255,183,76,150);
      stroke(255,183,76,150);
      ellipse(positionX,positionY,40,40);
      strokeWeight(2);
      stroke(0,150);
      ellipse(positionX,positionY,38,38);
      noTint();
      image(img, positionX-13, positionY-13, 26, 26);
    }else{
      fill(200,150);
      stroke(200,150);
      ellipse(positionX,positionY,40,40);
      strokeWeight(2);
      stroke(0,150);
      ellipse(positionX,positionY,38,38);
      tint(0,100);
      image(img, positionX-13, positionY-13, 26, 26);
    }
  }
  
  void displaySelect(){
      fill(255,183,76,150);
      stroke(255,183,76,150);
      ellipse(positionX,positionY,40,40);
      strokeWeight(2);
      stroke(0,150);
      ellipse(positionX,positionY,38,38);
      noTint();
      image(img, positionX-13, positionY-13, 26, 26); 
  }
  
  void displayUser(){
    
  }
}