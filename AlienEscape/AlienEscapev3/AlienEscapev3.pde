Alien alienList[];
UFO ufo;
String highscoreStorage[];
int score;
int highscore;
int seconds; 

void setup() {
  //size(1920, 1080);
  size(1366, 768);
  background(0);
  //noCursor();
  highscoreStorage = new String[1];
  score = 0; //einrichten des Textes mit dem Score 
  highscoreStorage = loadStrings("highscore.txt");
  highscore = Integer.parseInt(highscoreStorage[0]);
  textSize(30);
  textAlign(RIGHT);

  alienList = new Alien[10];

  //erstellen der Aliens mit random StartPosition
  for (int i = 0; i < alienList.length; i++) {
    int sectorMaxXPixel = width/alienList.length;
    int posX = parseInt(random(i*sectorMaxXPixel,(i*sectorMaxXPixel)+50));
    int posY = parseInt(random(70,height-70));
    int dx = parseInt(random(-5, 5));
    int dy = parseInt(random(-5, 5));
    dx = variableNotNull(dx); 
    dy = variableNotNull(dy);

    Alien alien = new Alien(dx, dy, posX, posY);
    alienList[i] = alien;
    alien.setup();
  }

  ufo = new UFO();
}


void draw() {
  background(0); //ständig neuer schwarzer Hintergurnd

  ufo.draw(); //drwa funktion von UFO

  if (second() != seconds) { //score pro Sekunde erhöhen
    score++;
    seconds = second();
  }

  //Highscore
  text("score: " + score, width-100, 40); 
  if (score>highscore) {
    highscoreStorage[0] = "" + score; 
    saveStrings("highscore.txt", highscoreStorage);
  }
  text("highscore: "+ highscore, width-100, 70 );

  //for intteration für alle Alliens
  for (int i = 0; i < alienList.length; i++) {
    alienList[i].draw();
    alienList[i].checkBoundary();

    //Check collision with other aliens
    for (int y=i; y < alienList.length; y++) {
      if (y < alienList.length) {
        if (alienList[i].checkCollisionWithAlien(alienList[i], alienList[y])) {
          alienList[y].dx = alienList[y].dx * (-1);
          alienList[y].dy = alienList[y].dy * (-1);
          alienList[i].dx = alienList[i].dx * (-1);
          alienList[i].dy = alienList[i].dy * (-1);
        }
      }
    }

    if (alienList[i].checkCollision(alienList[i])) {
      noLoop();
      background(0);
      textSize(60);
      textAlign(CENTER);
      text("Game over", width/2, height/2-30 );
      textSize(40);
      text("score:"+score, width/2, height/2+10);
      text("highscore: "+highscore, width/2, height/2+50);
      textSize(30);
      text("press any key to continue", width/2, height-20);
    }
  }
}

void keyPressed() { //Restart
  setup();
  loop();
}

int variableNotNull(int p) {
  if (p == 0) {
    p = 1; 
    return p;
  } else {
    return p;
  }
}
