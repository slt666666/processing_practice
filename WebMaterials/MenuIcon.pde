class MenuIcon {
 
  float positionX;
  float positionY;
  boolean appeared;
  Icon[] iconSet;
  
  MenuIcon() {
    positionX = mouseX;
    positionY = mouseY;
    iconSet = new Icon[4];
    for (int i = 0; i < 4; i++){
      iconSet[i] = new Icon(positionX,positionY+i*50);
    }
    appeared = false;
  }
  
  void display() {
    iconSet[0].appeared = true;
    for (int i = 3; i > 0; i--){
      if (iconSet[i-1].appeared) {
        if (iconSet[i].appeared) {
          iconSet[i].display();
        }else{
          iconSet[i].appear(); 
        }
      }
    }
    iconSet[0].display();
  }
}