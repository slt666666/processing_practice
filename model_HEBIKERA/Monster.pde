class Monster extends VerletParticle2D{
  
  Monster(float x, float y){
    super(x, y);
  }
  
  void display(){
    fill(127);
    stroke(0);
    ellipse(x,y,16,16);
  }
}