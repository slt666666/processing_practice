PImage img; // 光る球体の画像
PImage Star; // 光る星の画像

float velocity = 0;
float acceleration = 0.05;

void setup() {
  fullScreen(P3D);
  // zテストを無効化
  hint(DISABLE_DEPTH_TEST);
  // 加算合成
  blendMode(ADD);
  imageMode(CENTER);
  // 画像の生成
  img = createLight(random(0.5, 0.8), random(0.5, 0.8), random(0.5, 0.8));
  Star = createStar();
  Star.resize(Star.width/5, Star.height/5);
  noCursor();
}

// 光る球体の画像を生成する関数
PImage createLight(float rPower, float gPower, float bPower) {
  int side = 100; // 1辺の大きさ
  float center = side / 2.0; // 中心座標

  // 画像を生成
  PImage img = createImage(side, side, RGB);

  // 画像の一つ一つのピクセルの色を設定する
  for (int y = 0; y < side; y++) {
    for (int x = 0; x < side; x++) {
      float distance = (sq(center - x) + sq(center - y)) / 50.0;
      int r = int( (255 * rPower) / distance );
      int g = int( (255 * gPower) / distance );
      int b = int( (255 * bPower) / distance );
      img.pixels[x + y * side] = color(r, g, b);
    }
  }
  return img;
}

PImage createStar() {
  background(0);
  int starSide = 300;
  
  PImage Star = createImage(starSide, starSide, RGB);
  int vertex_num = 5*2; //頂点数(星を描画、トゲの数*2)
  int R; //中心から頂点までの距離(半径)
  int R_out = 50; //中心からとげまでの距離(半径)
  int R_in = R_out/2; //中心から谷までの距離(半径)
  float startX, startY, nextX, nextY;
  int nexti;
  int pointNum = 2; //辺あたりの点密度
  int starPix = 0;
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(-90));
  for (int i = 0; i < vertex_num; i++) {
    if (i%2 == 0) {
      R = R_out;
    } else {
      R = R_in;
    }
    //image(img,R*cos(radians(360*i/vertex_num)), R*sin(radians(360*i/vertex_num)));
    startX = R*cos(radians(360*i/vertex_num));
    startY = R*sin(radians(360*i/vertex_num));
    
    nexti = i + 1;
    if (i == vertex_num) { nexti = 0; }
    if (nexti%2 == 0) {
      R = R_out;
    } else {
      R = R_in;
    }
    nextX = R*cos(radians(360*(nexti)/vertex_num));
    nextY = R*sin(radians(360*(nexti)/vertex_num));
    
    for (int k=0; k<pointNum; k++){
      image(img,startX+(nextX-startX)*k/pointNum,startY+(nextY-startY)*k/pointNum);
    }
  }
  popMatrix();
  
  //Pixels[]で作成した星のrgb取得→Starに反映
  loadPixels();
  for (int q=0; q<starSide; q++){
    for (int r=0; r<starSide; r++){
      int v = (height - starSide)/2*width+(width - starSide)/2 + q*width + r;
      Star.pixels[starPix] = pixels[v];
      starPix++;
    }
  }
  return Star;
}

void draw() {
  background(0, 15, 30);
  //fill(255);
  //text(frameRate, 50, 50);
  translate(width/2, height/2, 0);
  rotateX(frameCount*0.01);
  rotateY(frameCount*0.01);

  float lastX = 0, lastY = 0, lastZ = 0;
  float radius = 280;
  float s = 0, t = 0;

  while (s <= 180) {
    float radianS = radians(s);
    float radianT = radians(t);
    float x = radius * sin(radianS) * cos(radianT);
    float y = radius * sin(radianS) * sin(radianT);
    float z = radius * cos(radianS);

    stroke(128);
    if (lastX != 0) {
      strokeWeight(1);
      line(x, y, z, lastX, lastY, lastZ);
    }

    pushMatrix();
    // 画像の座標へ原点を移動
    translate(x, y, z);
    // 画像の向きを元に戻す
    rotateY(-frameCount*0.01);
    rotateX(-frameCount*0.01);
    // 画像を描画
    image(Star, 0, 0);
    popMatrix();

    lastX = x;
    lastY = y;
    lastZ = z;

    s++;
    t += velocity;
  }
  velocity += acceleration;
}

void mousePressed() {
  img = createLight(random(0.5, 0.8), random(0.5, 0.8), random(0.5, 0.8));
}