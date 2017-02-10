class CreatureHebikera extends Creature{
  
  CreatureHebikera(int num, hebiHead head){
    super(num, head);
    for (int i = 0; i < num-1; i++){
      bodies.add(new hebiMiddle(head.position.x,head.position.y));
    }
    for (int i = 0; i < 12; i++){
      bodies.add(new hebiTail(head.position.x,head.position.y, i));
    }
  }
  
  void update(){
    super.update();
    //その他のBodyパーツ更新
    for (int i = 1; i < bodies.size(); i++){
      bodies.get(i).update(bodies.get(i-1));
    }
  }
  
  void display(){
    for (int i = bodies.size()-1; i >= 0; i--){
      bodies.get(i).display();
    }
  }
  
  void connect(){

  }
}