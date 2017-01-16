
class Landscape {

  int scl;             //一辺の長さ
  int w, h;            //幅、高さ
  int rows, cols;      //行列数
  float zoff = 0.0;    //パーリンノイズのキー初期値
  float[][] z;         //各頂点の高さの配列

  Landscape(int scl_, int w_, int h_) {
    scl = scl_;
    w = w_;
    h = h_;
    cols = w/scl;
    rows = h/scl;
    z = new float[cols][rows];
  }

  // 各頂点の高さをノイズで求める。
  // drawで周回するごとにちょっとずつ変わる。
  void calculate() {
    float xoff = 0;
    for (int i = 0; i < cols; i++)
    { 
      float yoff = 0;
      for (int j = 0; j < rows; j++)
      {
        z[i][j] = map(noise(xoff, yoff, zoff), 0, 1, -120, 120);
        yoff += 0.1;
      }
      xoff += 0.1;
    }
    zoff+=0.01;
  }

  // 各頂点を結ぶ四角形を書いていく。
  void render() {
    for (int x = 0; x < z.length-1; x++)
    {
      for (int y = 0; y < z[x].length-1; y++)
      {
        stroke(0);
        fill(100, 100);
        pushMatrix();
        beginShape(QUADS);
        translate(x*scl-w/2, y*scl-h/2, 0);
        vertex(0, 0, z[x][y]);
        vertex(scl, 0, z[x+1][y]);
        vertex(scl, scl, z[x+1][y+1]);
        vertex(0, scl, z[x][y+1]);
        endShape();
        popMatrix();
      }
    }
  }
}