class Ball {
 
  PVector position;
  float dx;
  float dy;
  
  Ball(){
    position = new PVector(random(width), random(height));
    dx = random(1,6);
    dy = random(1,6);
  }
  
  void move(){
  
    stroke( 0, 0, 255, 100 );
    fill( 0, 255, 255, 100 );
    //ellipse( position.x, position.y, 10, 10 );
   
    position.x += dx;
    position.y += dy;
  
    if( position.y > height || position.y < 0 )  dy = -dy;
    if( position.x > width || position.x < 0 )  dx = -dx;
  }
  
  
}