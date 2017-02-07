class CreatureFish extends Creature{
  
  CreatureFish(int num, fishHead head){
    super(num, head);
    for (int i = 0; i < num-1; i++){
      bodies.add(new Middle(head.position.x,head.position.y,head.position.z));
    }
    bodies.add(new Tail(head.position.x,head.position.y,head.position.z));
  }
  
  void update(){
    super.update();
    //その他のBodyパーツ更新
    for (int i = 1; i < bodies.size(); i++){
      bodies.get(i).update(bodies.get(i-1));
    }
  }
  
  void display(){
    bodies.get(bodies.size()-1).display();
    for (int i = bodies.size()-3; i >= 0; i--){
      bodies.get(i).display();
    }
  }
  
  void connect(){
    stroke(255);
    noFill();
    beginShape();
    for (int i = 1; i < bodies.size(); i++){
      vertex(bodies.get(i).position.x, bodies.get(i).position.y, bodies.get(i).position.z);
    }
    endShape();
  }
}