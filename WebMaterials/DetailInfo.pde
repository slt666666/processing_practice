class DetailInfo{
 
  float positionX;
  float positionY;
  int selectNum;
  int infoNum;
  int infoSize;
  String infoTitle;
  String infoStr;
  
  DetailInfo(int select, int info){
    positionX = detail.details[info].positionX + 170;
    positionY = detail.details[info].positionY - 42;
    selectNum = select;
    infoNum = info;
    
    switch (selectNum) {
     case 0:
       switch (infoNum) {
         case 0:
           infoTitle = "About This Site";
           infoStr = "about this site";
           break;
         case 1:
           infoTitle = "Languages/Frameworks";
           infoStr = "使われてる技術";
           break;
         case 2:
           infoTitle = "About Me";
           infoStr = "about me";         
           break;
       }
      break;
     case 1:
       switch (infoNum) {
         case 0:
           infoTitle = "Touring Log";
           infoStr = "touring Log";                  
           break;
         case 1:
           infoTitle = "Log Setting";
           infoStr = "設定の画面";
           break;
       }
      break;        
     case 3:
       switch (infoNum) {
         case 0:
           infoTitle = "Administrator Page";
           infoStr = "管理者メニュー";
           break;
       }
      break;      
    }
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
      fill(50,150);
      textFont(font);
      textSize(24);
      text(infoTitle,positionX,positionY+10,200,40);
      line(positionX+10,positionY+34,positionX+190,positionY+34);
      textFont(font2);
      fill(0,150);
      text(infoStr,positionX,positionY+40,200,300);
    }else{
      fill(255,150);
      rect(positionX,positionY,200*infoSlide,300*infoSlide);
      infoSlide += 0.1;
    }
  }
}