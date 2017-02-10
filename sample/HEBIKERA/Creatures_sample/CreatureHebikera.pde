class CreatureHebikera {
  ArrayList<BodyParts> bodies;
  hebiHead brain;
  
  CreatureHebikera(int num, hebiHead head){
    bodies = new ArrayList<BodyParts>();
    brain = head;
    bodies.add(brain);
    for (int i = 0; i < num-1; i++){
      bodies.add(new hebiMiddle(head.position.x,head.position.y));
    }
    for (int i = 0; i < 9; i++){
      bodies.add(new hebiTail(head.position.x,head.position.y, i));
    }
  }
  
  void update(ArrayList<CreatureHebikera> creatures){
    //頭部の更新
    brain.update(creatures);
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
    stroke(255);
    noFill();
    beginShape();
    for (int i = 1; i < bodies.size(); i++){
      vertex(bodies.get(i).position.x, bodies.get(i).position.y);
    }
    endShape();
  }
}