class hebiHead extends Head {
  
  hebiHead(float x, float y, int num){
    super(x, y, num);
  }
  
  void display() {
    angle = atan2(-velocity.y,velocity.x);
    reductionRate = map(abs(velocity.x),0,5,0,1);
    stroke(random(200));
    strokeWeight(2);
    pushMatrix();
    translate(position.x, position.y);
    fill(random(200));
    if(angle <= PI/2 && angle >= -PI/2){
      //右向き
      beginShape();
      vertex(10*cos(angle)*reductionRate,-10*sin(angle));
      vertex(12.8*cos(angle+PI/3)*reductionRate,-12.8*sin(angle+PI/3));
      curveVertex(12.8*cos(angle+PI/3)*reductionRate,-12.8*sin(angle+PI/3));
      curveVertex(11.2*cos(angle+PI/2)*reductionRate,-11.2*sin(angle+PI/2));
      curveVertex(19.2*cos(angle+PI*2/3)*reductionRate,-19.2*sin(angle+PI*2/3));
      curveVertex(19.2*cos(angle+PI*2/3)*reductionRate,-19.2*sin(angle+PI*2/3));
      vertex(12.8*cos(angle+PI*2/3)*reductionRate,-12.8*sin(angle+PI*2/3));
      curveVertex(12.8*cos(angle+PI*2/3)*reductionRate,-12.8*sin(angle+PI*2/3));
      curveVertex(12.8*cos(angle+PI*2/3)*reductionRate,-12.8*sin(angle+PI*2/3));
      curveVertex(11.2*cos(angle+PI*11/12)*reductionRate,-11.2*sin(angle+PI*11/12));
      curveVertex(16*cos(angle+PI)*reductionRate,-16*sin(angle+PI));
      curveVertex(16*cos(angle+PI)*reductionRate,-16*sin(angle+PI));
      curveVertex(11.2*cos(angle+PI*13/12)*reductionRate,-11.2*sin(angle+PI*13/12));
      curveVertex(12.8*cos(angle+PI*4/3)*reductionRate,-12.8*sin(angle+PI*4/3));
      curveVertex(12.8*cos(angle+PI*4/3)*reductionRate,-12.8*sin(angle+PI*4/3));
      vertex(19.2*cos(angle+PI*4/3)*reductionRate,-19.2*sin(angle+PI*4/3));
      curveVertex(19.2*cos(angle+PI*4/3)*reductionRate,-19.2*sin(angle+PI*4/3));
      curveVertex(11.2*cos(angle+PI*3/2)*reductionRate,-11.2*sin(angle+PI*3/2));
      curveVertex(12.8*cos(angle+PI*5/3)*reductionRate,-12.8*sin(angle+PI*5/3));
      curveVertex(12.8*cos(angle+PI*5/3)*reductionRate,-12.8*sin(angle+PI*5/3));
      vertex(12.8*cos(angle+PI*5/3)*reductionRate,-12.8*sin(angle+PI*5/3));
      endShape(CLOSE);
      
      //触手的な
      fill(0);
      beginShape();
      curveVertex(12.8*cos(angle+PI/3)*reductionRate,-12.8*sin(angle+PI/3));
      curveVertex(12.8*cos(angle+PI/3)*reductionRate,-12.8*sin(angle+PI/3));
      curveVertex(32*cos(angle+PI*2/9)*reductionRate,-32*sin(angle+PI*2/9));
      curveVertex(44.8*cos(angle+PI/9)*reductionRate,-44.8*sin(angle+PI/9));
      curveVertex(44.8*cos(angle+PI/9)*reductionRate,-44.8*sin(angle+PI/9));
      curveVertex(32*cos(angle+PI/5)*reductionRate,-32*sin(angle+PI/5));
      curveVertex(11.2*cos(angle+PI*2/9)*reductionRate,-11.2*sin(angle+PI*2/9));  
      curveVertex(11.2*cos(angle+PI*2/9)*reductionRate,-11.2*sin(angle+PI*2/9));  
      endShape(CLOSE);
      beginShape();
      curveVertex(12.8*cos(angle-PI/3)*reductionRate,-12.8*sin(angle-PI/3));
      curveVertex(12.8*cos(angle-PI/3)*reductionRate,-12.8*sin(angle-PI/3));
      curveVertex(32*cos(angle-PI*2/9)*reductionRate,-32*sin(angle-PI*2/9));
      curveVertex(44.8*cos(angle-PI/9)*reductionRate,-44.8*sin(angle-PI/9));
      curveVertex(44.8*cos(angle-PI/9)*reductionRate,-44.8*sin(angle-PI/9));
      curveVertex(32*cos(angle-PI/5)*reductionRate,-32*sin(angle-PI/5));
      curveVertex(11.2*cos(angle-PI*2/9)*reductionRate,-11.2*sin(angle-PI*2/9));  
      curveVertex(11.2*cos(angle-PI*2/9)*reductionRate,-11.2*sin(angle-PI*2/9));  
      endShape(CLOSE);
      //目
      stroke(0);
      strokeWeight(3);
      noFill();
      ellipse(12*cos(angle+PI*2/9)*reductionRate,-12*sin(angle+PI*2/9),4*reductionRate,4);
      ellipse(12*cos(angle+PI*16/9)*reductionRate,-12*sin(angle+PI*16/9),4*reductionRate,4);
    }else{
      //左向き
      beginShape();
      vertex(10*cos(angle)*reductionRate,-10*sin(angle));
      vertex(12.8*cos(angle-PI/3)*reductionRate,-12.8*sin(angle-PI/3));
      curveVertex(12.8*cos(angle-PI/3)*reductionRate,-12.8*sin(angle-PI/3));
      curveVertex(11.2*cos(angle-PI/2)*reductionRate,-11.2*sin(angle-PI/2));
      curveVertex(19.2*cos(angle-PI*2/3)*reductionRate,-19.2*sin(angle-PI*2/3));
      curveVertex(19.2*cos(angle-PI*2/3)*reductionRate,-19.2*sin(angle-PI*2/3));
      vertex(12.8*cos(angle-PI*2/3)*reductionRate,-12.8*sin(angle-PI*2/3));
      curveVertex(12.8*cos(angle-PI*2/3)*reductionRate,-12.8*sin(angle-PI*2/3));
      curveVertex(12.8*cos(angle-PI*2/3)*reductionRate,-12.8*sin(angle-PI*2/3));
      curveVertex(11.2*cos(angle-PI*11/12)*reductionRate,-11.2*sin(angle-PI*11/12));
      curveVertex(16*cos(angle-PI)*reductionRate,-16*sin(angle-PI));
      curveVertex(16*cos(angle-PI)*reductionRate,-16*sin(angle-PI));
      curveVertex(11.2*cos(angle-PI*13/12)*reductionRate,-11.2*sin(angle-PI*13/12));
      curveVertex(12.8*cos(angle-PI*4/3)*reductionRate,-12.8*sin(angle-PI*4/3));
      curveVertex(12.8*cos(angle-PI*4/3)*reductionRate,-12.8*sin(angle-PI*4/3));
      vertex(19.2*cos(angle-PI*4/3)*reductionRate,-19.2*sin(angle-PI*4/3));
      curveVertex(19.2*cos(angle-PI*4/3)*reductionRate,-19.2*sin(angle-PI*4/3));
      curveVertex(11.2*cos(angle-PI*3/2)*reductionRate,-11.2*sin(angle-PI*3/2));
      curveVertex(12.8*cos(angle-PI*5/3)*reductionRate,-12.8*sin(angle-PI*5/3));
      curveVertex(12.8*cos(angle-PI*5/3)*reductionRate,-12.8*sin(angle-PI*5/3));
      vertex(12.8*cos(angle-PI*5/3)*reductionRate,-12.8*sin(angle-PI*5/3));
      endShape(CLOSE);
      
      //触手的な
      fill(0);
      beginShape();
      curveVertex(12.8*cos(angle-PI/3)*reductionRate,-12.8*sin(angle-PI/3));
      curveVertex(12.8*cos(angle-PI/3)*reductionRate,-12.8*sin(angle-PI/3));
      curveVertex(32*cos(angle-PI*2/9)*reductionRate,-32*sin(angle-PI*2/9));
      curveVertex(44.8*cos(angle-PI/9)*reductionRate,-44.8*sin(angle-PI/9));
      curveVertex(44.8*cos(angle-PI/9)*reductionRate,-44.8*sin(angle-PI/9));
      curveVertex(32*cos(angle-PI/5)*reductionRate,-32*sin(angle-PI/5));
      curveVertex(11.2*cos(angle-PI*2/9)*reductionRate,-11.2*sin(angle-PI*2/9));  
      curveVertex(11.2*cos(angle-PI*2/9)*reductionRate,-11.2*sin(angle-PI*2/9));  
      endShape(CLOSE);
      beginShape();
      curveVertex(12.8*cos(angle+PI/3)*reductionRate,-12.8*sin(angle+PI/3));
      curveVertex(12.8*cos(angle+PI/3)*reductionRate,-12.8*sin(angle+PI/3));
      curveVertex(32*cos(angle+PI*2/9)*reductionRate,-32*sin(angle+PI*2/9));
      curveVertex(44.8*cos(angle+PI/9)*reductionRate,-44.8*sin(angle+PI/9));
      curveVertex(44.8*cos(angle+PI/9)*reductionRate,-44.8*sin(angle+PI/9));
      curveVertex(32*cos(angle+PI/5)*reductionRate,-32*sin(angle+PI/5));
      curveVertex(11.2*cos(angle+PI*2/9)*reductionRate,-11.2*sin(angle+PI*2/9));  
      curveVertex(11.2*cos(angle+PI*2/9)*reductionRate,-11.2*sin(angle+PI*2/9));  
      endShape(CLOSE);
      //目
      stroke(0);
      strokeWeight(3);
      noFill();
      ellipse(12*cos(angle-PI*2/9)*reductionRate,-12*sin(angle-PI*2/9),4*reductionRate,4);
      ellipse(12*cos(angle-PI*16/9)*reductionRate,-12*sin(angle-PI*16/9),4*reductionRate,4);
    }
  
  popMatrix();
  }
}