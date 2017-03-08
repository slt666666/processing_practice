class MenuDetail {
  
  Detail[] details;
  float positionX;
  float positionY;
  int menuNum;
  int infoNum;
  int contentNum;
  int userSlide;
  int underSlide;
  
  MenuDetail(float x, float y, int selectNum) {
    positionX = x + 30;
    positionY = y;
    menuNum = selectNum;
    contentNum = getContentNum(menuNum);
    details = new Detail[contentNum];
    for (int i = 0; i < contentNum; i++){
      details[i] = new Detail(x + 52, y + 20 - i * 46, selectNum, i);
    }
    userSlide = 0;
    underSlide = 0;
  }
  
  int getContentNum(int select) {
    
    int returnNum = 0;
    switch(select) {
      case 0:
        returnNum = 3;
        break;
      case 1:
        returnNum = 2;
        break;
      case 2:
        returnNum = 1;
        break;
      case 3:
        returnNum = 2;
        break;
    }
    return returnNum;
    
  }
  
  boolean insideCheck() {
    for (int i = 0; i < contentNum; i++) {
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
    strokeWeight(2);
    triangle(positionX, positionY, positionX+20, positionY+10, positionX+20, positionY-10);
    fill(0,150);
    ellipse(positionX+15,positionY,2,2);
    infoIsset = false;
    for (int j = 0; j < contentNum; j++){
      details[j].display(); 
    }
    
    if (menuNum == 0){
      
      if (userSlide < 220) {
        userSlide += 10;
      }else{
        if (underSlide < 80) {
          underSlide += 10; 
        }
      }
      fill(220,150);
      noStroke();
      triangle(positionX-60, positionY, positionX-80, positionY+10, positionX-80, positionY-10);
      beginShape();
      vertex(positionX-80,positionY-100);
      vertex(positionX-280,positionY-100);
      vertex(positionX-280,positionY-100+userSlide);
      vertex(positionX-240,positionY-100+userSlide);
      vertex(positionX-235,positionY-100+userSlide+8);
      vertex(positionX-230,positionY-100+userSlide);
      vertex(positionX-80,positionY-100+userSlide);
      endShape(CLOSE);
      fill(70,150);
      stroke(70,150);
      line(positionX-100,positionY-60,positionX-260,positionY-60);
      textFont(font);
      textSize(36);
      textAlign(CENTER);
      text("Toshiyuki",positionX-180,positionY-65);
      tint(0,100);
      image(user, positionX-260, positionY-40, 160, 160);
      fill(240,150);
      noStroke();
      beginShape();
      vertex(positionX-80, positionY-100+userSlide);
      vertex(positionX-230, positionY-100+userSlide);
      vertex(positionX-235, positionY-100+userSlide+8);
      vertex(positionX-240, positionY-100+userSlide);
      vertex(positionX-280, positionY-100+userSlide);
      vertex(positionX-280, positionY-100+userSlide+underSlide);
      vertex(positionX-80, positionY-100+userSlide+underSlide);
      endShape(CLOSE);
      textSize(25);
      fill(70,150);
      textAlign(RIGHT);
      if (underSlide >= 80){
        text("[ slt666666 ]",positionX-180,positionY+160);
        text("SNS icon ... etc",positionX-150,positionY+190);
      }
    }
  }
}