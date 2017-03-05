boolean menuIsset;
MenuIcon menu;

void setup() {
  background(0);
  size(640, 426);
  menuIsset = false;
  smooth();
}
 
void draw() {
  background(0);
  if (menuIsset) {
    menu.display();
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
    }
  }
}