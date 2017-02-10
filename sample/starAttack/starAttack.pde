int _num = 10;
Circle[] _circleArr = {};

int vertex_num = 5*2;
float R;

void setup() {
  size(500, 300);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawCircle();
}

void draw() {
  //background(255);
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
  fill(255, 25);
  rect(-10,-10,width+20,height+20);
}

void mouseReleased() {
  drawCircle();
  //println(_circleArr.length);
}

void drawCircle() {
  for (int i = 0; i < _num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}

//=========================== objects

 class Circle {
   float x, y;
   float radius;
   color linecol, fillcol;
   float alph;
   float xmove, ymove;
   
   Circle() {
     x = random(width);
     y = random(height);
     radius = random(100) + 10;
     //linecol = color(random(255), random(255), random(255));
     linecol = color(255);
     //fillcol = color(random(255), random(255), random(255));
     fillcol = color(255);
     alph = random(255);
     xmove = random(10) - 5;
     ymove = random(10) - 5;
   }
   
   void drawMe() {
     noStroke();
     fill(fillcol, alph);
     ellipse(x, y, radius*2, radius*2);
     stroke(linecol, 150);
     noFill();
     ellipse(x, y, 10, 10);
   }
   
   void updateMe() {
     x += xmove;
     y += ymove;
     if (x > (width+radius)) {x = 0 - radius; }
     if (x < (0-radius)) {x = width + radius; }
     if (y > (height+radius)) {y = 0 - radius; }
     if (y < (0-radius)) {y = height + radius; }
     
     boolean touching = false;
     for (int i=0; i<_circleArr.length; i++) {
       Circle otherCirc = _circleArr[i];
       if (otherCirc != this) {
         float dis = dist(x, y, otherCirc.x, otherCirc.y);
         float overlap = dis - radius - otherCirc.radius;
         if (overlap < 0) {
           float midx, midy;
           midx = (x + otherCirc.x)/2;
           midy = (y + otherCirc.y)/2;
           stroke(200);
           noFill();
           overlap *= -1;
           //ellipse(midx, midy, overlap, overlap);

           pushMatrix();
           translate(midx, midy);
           rotate(radians(-90));
              beginShape();
              for (int j = 0; j < vertex_num; j++) {
                if (j%2 == 0) {
                  R = overlap;
                } else {
                  R = overlap/2;
                }
                vertex(R*cos(radians(360*j/vertex_num)), R*sin(radians(360*j/vertex_num)));
              }
              endShape(CLOSE);
              popMatrix();
         }
         //if ((dis - radius - otherCirc.radius) < 0) {
         //  touching = true;
         //  break;
         //}
       }
     }
     //if (touching) {
     //  if (alph > 0) { alph--; }
     //}else{
     //  if (alph < 255) { alph += 2; }
     //}
     
     //drawMe();
   }
 }