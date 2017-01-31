class Creature {
  ArrayList<Body> bodies;
  Head brain;
  
  Creature(int num, Head head){
    brain = head;
    bodies = new ArrayList<Body>();
    for (int i = 0; i < num; i++){
      bodies.add(new Body(head.position.x,head.position.y));
    }
  }
  
  void update(ArrayList<Creature> creatures){
    //頭部の更新
    brain.update(creatures);
    //頭部に接続してるBodyパーツ更新
    Body neck = bodies.get(0);
    neck.update(brain);
    //その他のBodyパーツ更新
    for (int i = 1; i < bodies.size(); i++){
      bodies.get(i).update2(bodies.get(i-1));
    }
  }
  
  void display(){
    for (int i = 0; i < bodies.size(); i++){
      if (i%2 == 0){
        bodies.get(i).display();
      }else{
        bodies.get(i).display2();
      }
    }
    brain.display();
  }
  
  void connect(){
    stroke(0);
    noFill();
    beginShape();
    vertex(brain.position.x,brain.position.y);
    for (int i = 0; i < bodies.size(); i++){
      vertex(bodies.get(i).position.x, bodies.get(i).position.y);
    }
    endShape();
  }
}