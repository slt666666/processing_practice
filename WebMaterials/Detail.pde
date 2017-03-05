class Detail {
  
  float positionX;
  float positionY;
  int selectNum;
  int detailNum;
  int slide;
  boolean appeared;
  PImage img;

  Detail(float x, float y, int selectNum, int detailNum) {
    positionX = x;
    positionY = y;
    selectNum = selectNum;
    detailNum = detailNum;
    slide = 0;
    String url = ("setting1"+".png");
    img = loadImage(url);
    appeared = false;
  }
  
  boolean insideCheck() {
    return (mouseX > positionX && mouseX < positionX+100 && mouseY < positionY && mouseY > positionY - 42);
  }
  
  void display() {
    
    if (!appeared) {
      
      fill(255,150);
      rect(positionX, positionY, 100, -1-slide);
      slide += 10;
      if (slide > 41) { appeared = true; }
      
    }else{
      // insideCheck入れる
      if (!insideCheck()){
        fill(255,150);
        rect(positionX, positionY, 100, -42);
        tint(0,100);
        image(img, positionX+8, positionY-30, 20, 20);
        fill(0,150);
        textSize(30);
        text("aaaa",positionX+40,positionY-12);
      }else{
        fill(255,183,76,150);
        rect(positionX, positionY, 100, -42);
        noTint();
        image(img, positionX+8, positionY-30, 20, 20);
        fill(255,150);
        textSize(30);
        text("aaaa",positionX+40,positionY-12);
      }
    }
  }
}