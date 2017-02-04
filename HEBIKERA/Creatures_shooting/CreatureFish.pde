class CreatureFish extends Creature{
  Head fish_head;
  
  CreatureFish(int num, Head head){
    super(num, head);
    fish_head = head;
    bodies.add(head);
    for (int i = 0; i < num-1; i++){
      bodies.add(new Middle(head.position.x,head.position.y));
    }
    bodies.add(new Tail(head.position.x,head.position.y));
  }
  
  void update(){
    super.update();
    fish_head.update();
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
      vertex(bodies.get(i).position.x, bodies.get(i).position.y);
    }
    endShape();
  }
}