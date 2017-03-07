class DetailInfo{
 
  float positionX;
  float positionY;
  int selectNum;
  int infoNum;
  
  DetailInfo(int select, int info){
    positionX = detail.details[info].positionX + 170;
    positionY = detail.details[info].positionY - 42;
    selectNum = select;
    infoNum = info;
  }
  
  void display() {
      fill(255,150);
      stroke(0,150);
      strokeWeight(2);
      triangle(positionX-20, positionY+21, positionX, positionY+31, positionX, positionY+11);
      fill(0,150);
      ellipse(positionX-5,positionY+21,2,2);
    if (infoSlide > 0.9) { 
      fill(255,150);
      rect(positionX,positionY,200,300);
      textFont(font2);
      fill(0);
      text("このHPはDjangoで作られている。デザインは主にProcessing.jsで行っており、ツーリングのルート検索はleaf-let.jsの地図上にjavascriptで描写や写真表示を加えてみた。",positionX,positionY,200,300);
    }else{
      fill(255,150);
      rect(positionX,positionY,200*infoSlide,300*infoSlide);
      infoSlide += 0.1;
    }
  }
}