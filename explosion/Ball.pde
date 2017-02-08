class Ball {
 
  PVector position;
  float dx;
  float dy;
  float dz;
  
  Ball(){
    position = new PVector(width/2, height/2, -150);
    dx = random(-6,6);
    dy = random(-6,6);
    dz = random(-6,6);
  }
  
  void move(){
  
    stroke( 0, 0, 255, 100 );
    fill( 0, 255, 255, 100 );
    //ellipse( position.x, position.y, 10, 10 );
    pushMatrix();
    translate(position.x, position.y, position.z);
    sphere(map(position.z,-300,300,1,20));
    popMatrix();
    
    position.x += dx;
    position.y += dy;
    position.z += dz;
    
    if ( position.x > width || position.x < 0 ) dx = -dx;
    if ( position.z > 0 || position.z < -300 ) dz = -dz;
  }
  
  boolean outSide(){
    if( position.y > height+2000 ) {
       return true;
    }else{
       return false;
    }
  }
  
}