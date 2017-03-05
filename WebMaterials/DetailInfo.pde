class DetailInfo{
 
  float positionX;
  float positionY;
  int selectNum;
  int infoNum;
  
  DetailInfo(int selectNum, int infoNum){
    positionX = detail.details[infoNum].positionX + 120;
    positionY = detail.details[infoNum].positionY - 42;
    selectNum = selectNum;
    infoNum = infoNum;
  }
  
  void display() {
    fill(255,150);
    triangle(positionX-20, positionY+21, positionX, positionY+31, positionX, positionY+11);
    fill(0,150);
    ellipse(positionX-5,positionY+21,2,2);
    fill(255,150);
    rect(positionX,positionY,200,500);
  }
}