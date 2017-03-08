class DetailInfo{
 
  float positionX;
  float positionY;
  int selectNum;
  int infoNum;
  int infoSize;
  String infoTitle;
  String infoStr;
  
  DetailInfo(int select, int info){
    positionX = detail.details[info].positionX + 170;
    positionY = detail.details[info].positionY - 42;
    selectNum = select;
    infoNum = info;
    
    switch (selectNum) {
     case 0:
       switch (infoNum) {
         case 0:
           infoTitle = "About This Site";
           infoStr = "\n趣味開発中のWEBアプリのテストや\nサーバー連携が必要な物の\nチェック用ついでに作ったサイト。\n\n何かを作ってて試したくなったり、残しておきたい作品とかが出来たらここに残していく。いわゆる砂場。";
           infoSize = 220;
           break;
         case 1:
           infoTitle = "Languages/Frameworks";
           infoStr = "\nサイトはPythonのDjangoで構築。\n\nデザイン周りは基本的にprocessingにJavaScriptを入れ込んで作ってみました。あとはjQueryとかleaflet.jsとかcolorBoxとか\n\n基本的に仕事ではiOSアプリ屋さんなので、WEB周りはいまいち。Djangoもお試しって感じで、PHPのPhalconかElixirのPhoenixを使ってみたい。";
           infoSize = 300;
           break;
         case 2:
           infoTitle = "About Me";
           infoStr = "\n農学部出身エンジニア。\n今年はプログラマー+院生\n\n普段はアプリ(Swift)作る仕事が多め\nJavaScriptで可視化したりとかも。\n\n好きなもの:\nトマト・バイク・ボクシング\nアルゴリズムを考えること";   
           infoSize = 260;
           break;
       }
      break;
     case 1:
       switch (infoNum) {
         case 0:
           infoTitle = "Touring Log";
           infoStr = "\nツーリングログのデモを開く。\n\n●機能(まだまだ初期段階)\n走ったルートを記録し、\n地図上にルートが表示される。\nルートと画像を連携表示。\n\n●課題\nGPSロガー等との連携\nUIデザイン...etc"; 
           infoSize = 270;
           break;
         case 1:
           infoTitle = "Log Setting";
           infoStr = "\nTouring Logの設定画面\n\n現在管理者のみアクセス可能\n使いやすくなるまで...";
           infoSize = 160;
           break;
       }
      break;
     case 2:
      infoTitle = "Hobby";
      infoStr = "修行中";
      infoSize = 60;
      break;
     case 3:
       switch (infoNum) {
         case 0:
           infoTitle = "Administrator Page";
           infoStr = "管理者専用メニュー\nadminページに飛ぶ";
           infoSize = 80;
           break;
       }
      break;      
    }
  }
  
  void display() {
    fill(255,150);
    stroke(0,150);
    strokeWeight(2);
    triangle(positionX-20, positionY+21, positionX, positionY+31, positionX, positionY+11);
    fill(0,150);
    ellipse(positionX-5,positionY+21,2,2);
    
    if (infoSlide < 1.0) {
      infoSlide += 0.1; 
    }
    fill(255,150);
    textAlign(CENTER);
    rect(positionX,positionY,200,infoSize*infoSlide);
    fill(50,150);
    textFont(font);
    textSize(24);
    text(infoTitle,positionX,positionY+10,200,40);
    line(positionX+10,positionY+34,positionX+190,positionY+34);
    textFont(font2);
    fill(0,150);
    text(infoStr,positionX,positionY+40,200,infoSize);
  }
}