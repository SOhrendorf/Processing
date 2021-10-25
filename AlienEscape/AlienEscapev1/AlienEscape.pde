Alien alienList[];
UFO ufo;
int score;
String highscore[];
int seconds;

void setup() {
  //size(1920,1080);
  size(1366, 768);
  background(0);
  //noCursor();

  score = 0; //einrichten des Textes mit dem Score 
  textSize(30);
  textAlign(RIGHT);

  highscore = new String[1];//Highscore einrichten
  highscore[0] = "" + score;

  alienList = new Alien[5];

  for (int i = 0; i < alienList.length; i++) { //erstellen der Aliens mit random StartPosition
    int posX = parseInt(random(100, 1220));
    int posY = parseInt(random(100, 700));

    Alien alien = new Alien(2, 2, posX, posY);
    alienList[i] = alien;
    alien.setup();
  }

  ufo = new UFO();
}

void draw() {
  background(0); //ständig neuer schwarzer Hintergurnd

  for (int i = 0; i < alienList.length; i++) { //for itteration für alle Alliens
    alienList[i].draw();
    alienList[i].checkBoundary();
    if (alienList[i].checkCollision(alienList[i])) {
      noLoop();
      if (score > Integer.parseInt(highscore[0])) {
        saveStrings("highscore.txt", highscore);
      }
    }
  }

  ufo.draw(); //drwa funktion von UFO

  if (second() != seconds) { //score pro Sekunde erhöhen
    score++;
    seconds = second();
  }
  text("score: " + score, 1300, 40);
}
