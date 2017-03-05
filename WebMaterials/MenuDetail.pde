class MenuDetail {
  
  Detail[] details;
  float positionX;
  float positionY;
  int selectNum;
  int infoNum;

  MenuDetail(float x, float y, int selectNum) {
    
    positionX = x + 30;
    positionY = y;
    selectNum = selectNum;
    details = new Detail[2];
    details[0] = new Detail(x + 52, y + 20, selectNum, 0);
    details[1] = new Detail(x + 52, y - 26, selectNum, 1);

  }
  
  boolean insideCheck() {
    for (int i = 0; i < 2; i++) {
      if (details[i].insideCheck()){
        infoNum = i;
        return true;
      }
    }
    return false;
  }
  
  void display() {
        // 矢印
    fill(220,150);
    triangle(positionX, positionY, positionX+20, positionY+10, positionX+20, positionY-10);
    fill(0,150);
    ellipse(positionX+15,positionY,2,2);
    infoIsset = false;
    details[0].display();
    details[1].display();
  }
}