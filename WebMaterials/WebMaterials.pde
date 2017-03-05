MenuIcon menu;
MenuDetail detail; 
boolean menuIsset;
boolean detailIsset;

void setup() {
  background(0);
  size(640, 426);
  menuIsset = false;
  detailIsset = false;
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
}

void mousePressed(){
  if (!menuIsset){
    menu = new MenuIcon();
    menuIsset = true;
  }else{
    if (!menu.insideCheck()) {
      menu = new MenuIcon();
      menuIsset = true;
      detailIsset = false;
    }else{
      // メニュー広げる処理
      int selectNum = menu.selectNum;
      detail = new MenuDetail(menu.iconSet[selectNum].positionX,menu.iconSet[selectNum].positionY,menu.selectNum);
      detailIsset = true;
    }
  }
}