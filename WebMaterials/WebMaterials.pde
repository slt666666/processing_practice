MenuIcon menu;
MenuDetail detail; 
DetailInfo info;
boolean menuIsset;
boolean detailIsset;
boolean infoIsset;
PFont font;

void setup() {
  background(0);
  size(640, 426);
  font = createFont("sword_art_online_font_by_darkblackswords-d5nssbp.otf",48);
  textFont(font);
  menuIsset = false;
  detailIsset = false;
  infoIsset = false;
  smooth();
}
 
void draw() {
  background(0);
  if (menuIsset) {
    menu.display();
  }
  if (detailIsset) {
    detail.display(); 
  }
  if (infoIsset) {
    info.display(); 
  }
  fill(220,150);
  stroke(220, 150);
  text("Welcome to SandBox !!!",0, height/2);
}

void mousePressed(){
  if (!menuIsset){
    menu = new MenuIcon();
    menuIsset = true;
  }else{
    if (!menu.insideCheck()) {
      //メニュークリック時
      if (detailIsset){
        if (detail.insideCheck()){
          int selectMenuNum = detail.selectNum;
          int infoNum = detail.infoNum;
          info = new DetailInfo(selectMenuNum,infoNum);
          infoIsset = true;
        }else{
          menu = new MenuIcon();
          menuIsset = true;
          detailIsset = false;
          infoIsset = false; 
        }
      }else{
        menu = new MenuIcon();
        menuIsset = true;
        detailIsset = false;
        infoIsset = false; 
      }
    }else{
      // メニュー広げる処理
      int selectNum = menu.selectNum;
      detail = new MenuDetail(menu.iconSet[selectNum].positionX,menu.iconSet[selectNum].positionY,selectNum);
      infoIsset = false;
      detailIsset = true;
    }
  }
}