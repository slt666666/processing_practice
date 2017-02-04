class Creature{
  ArrayList<BodyParts> bodies;
  Head brain;
  
  Creature(int num, Head head){
    bodies = new ArrayList<BodyParts>();
    brain = head;
    bodies.add(head);
  }
  
  void update(){
    //頭部の更新
    brain.update();
    //その他のBodyパーツ更新
    //for (int i = 1; i < bodies.size(); i++){
    //  bodies.get(i).update(bodies.get(i-1));
    //}
  }
  
  void display(){

  }
  
  void connect(){

  }
}