MenuIcon menu;
MenuDetail detail; 
DetailInfo info;
boolean menuIsset;
boolean detailIsset;
boolean infoIsset;
float infoSlide;

PFont font;
PFont font2;
PImage user;
PImage menu0_0, menu0_1, menu0_2, menu1_0, menu1_1, menu2_0, menu3_0, menu3_1;
String content0_0,content0_1,content0_2,content1_0,content1_1,content2_0,content3_0,content3_1;
PImage[][] contentImages;
String[][] contentStrs;

void setup() {
  user = loadImage("user.png");
  menu0_0 = loadImage("menu0_0.png");
  menu0_1 = loadImage("menu0_1.png");
  menu0_2 = loadImage("menu0_2.png");
  menu1_0 = loadImage("menu1_0.png");
  menu1_1 = loadImage("menu1_1.png");
  menu2_0 = loadImage("menu2_0.png");
  menu3_0 = loadImage("menu3_0.png");
  menu3_1 = loadImage("menu3_1.png");
  contentImages = new PImage[4][3];
  contentImages[0][0] = menu0_0;
  contentImages[0][1] = menu0_2;
  contentImages[0][2] = menu0_1;
  contentImages[1][0] = menu1_0;
  contentImages[1][1] = menu1_1;
  contentImages[2][0] = menu2_0;
  contentImages[3][0] = menu3_0;
  contentImages[3][1] = menu3_1;
  content0_0 = "Info";
  content0_1 = "Player";
  content0_2 = "Code";
  content1_0 = "Touring Log";
  content1_1 = "Route Map";
  content2_0 = "Please Wait...";
  content3_0 = "Settings";
  content3_1 = "Log Out";
  contentStrs = new String[4][3];
  contentStrs[0][0] = content0_0;
  contentStrs[0][1] = content0_2;
  contentStrs[0][2] = content0_1;
  contentStrs[1][0] = content1_0;
  contentStrs[1][1] = content1_1;
  contentStrs[2][0] = content2_0;
  contentStrs[3][0] = content3_0;
  contentStrs[3][1] = content3_1;
    
  background(0);
  size(1000, 640);
  font = createFont("sword_art_online_font_by_darkblackswords-d5nssbp.otf",48);
  font2 = createFont("Sarif",12);
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
  textFont(font);
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