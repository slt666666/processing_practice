class Bullet {
 
  PVector position;
  float dx = 4;
  
  Bullet(){
    position = new PVector(mouseX, mouseY);
  }
  
  void move(){
  
    stroke( 0, 0, 255, 100 );
    fill( 0, 255, 255, 100 );
    ellipse( position.x, position.y, 10, 10 );
    position.x += dx;
    
  }
  
  boolean removeCheck(){
    if (position.x > width){
      return true; 
    }
    return false;
  }
}