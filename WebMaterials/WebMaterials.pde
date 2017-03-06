MenuIcon menu;
MenuDetail detail; 
DetailInfo info;
boolean menuIsset;
boolean detailIsset;
boolean infoIsset;
float infoSlide;
PFont font;

void setup() {
  background(0);
  size(640, 426);
  font = createFont("sword_art_online_font_by_darkblackswords-d5nssbp.otf",48);
  textFont(font);
  menuIsset = false;
  detailIsset = false;
  infoIsset = false;
  infoSlide = 0;
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
  }else{
    infoSlide = 0; 
  }
  fill(220,150);
  stroke(220, 150);
  textSize(48);
  textAlign(CENTER);
  text("Welcome to SandBox !!!",0, height/2, width,50);
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
          //メニュークリックした時の挙動はここ
        }else{
          menu = new MenuIcon();
          menuIsset = true;
          detailIsset = false;
        }
      }else{
        menu = new MenuIcon();
        menuIsset = true;
        detailIsset = false;
      }
    }else{
      // メニュー広げる処理
      int selectNum = menu.selectNum;
      detail = new MenuDetail(menu.iconSet[selectNum].positionX,menu.iconSet[selectNum].positionY,selectNum);
      detailIsset = true;
    }
  }
}