class Detail {
  
  float positionX;
  float positionY;
  int selectNum;
  int detailNum;
  int slide;
  String content;
  boolean appeared;
  PImage img;

  Detail(float x, float y, int select, int detail) {
    positionX = x;
    positionY = y;
    if (select == 3){
      positionY = y + detail * 2 * 46;
    }
    selectNum = select;
    detailNum = detail;
    slide = 0;
    img = contentImages[select][detail];
    content = contentStrs[select][detail];
    appeared = false;
  }
  
  boolean insideCheck() {
    return (mouseX > positionX && mouseX < positionX+150 && mouseY < positionY && mouseY > positionY - 42);
  }
  
  void display() {
    menu.iconSet[selectNum].displaySelect();
    
    if (!appeared) {
      
      fill(255,150);
      rect(positionX, positionY, 150, -1-slide);
      slide += 10;
      if (slide > 41) { appeared = true; }
      
    }else{
      // insideCheck入れる
      if (!insideCheck()){
        fill(255,150);
        rect(positionX, positionY, 150, -42);
        tint(0,100);
        image(img, positionX+8, positionY-32, 24, 24);
        fill(0,150);
        textSize(20);
        textAlign(CENTER);
        text(content,positionX+40,positionY-29,90,42);
      }else{
        fill(255,183,76,150);
        rect(positionX, positionY, 150, -42);
        noTint();
        image(img, positionX+8, positionY-32, 24, 24);
        fill(255,150);
        textSize(20);
        textAlign(CENTER);
        text(content,positionX+40,positionY-29,90,42);
        info = new DetailInfo(selectNum,detailNum);
        infoIsset = true;
      }
    }
  }
}