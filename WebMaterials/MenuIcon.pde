class MenuIcon {
 
  boolean appeared;
  int selectNum;
  Icon[] iconSet;
  
  MenuIcon() {
    iconSet = new Icon[4];
    for (int i = 0; i < 4; i++){
      iconSet[i] = new Icon(mouseX,mouseY+i*50,i);
    }
    appeared = false;
  }
  
  boolean insideCheck() {
    
    for (int j = 0; j < 4; j++) {
      if (iconSet[j].insideCheck()){
        selectNum = j;
        return true;
      }
    }
    return false;
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