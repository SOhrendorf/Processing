import ddf.minim.*;
//Deklaration
Alien alienList[];
UFO ufo;
String highscoreStorage[];
int score=0;
int state=0;
int highscore;
int seconds; 
PImage backgroundTexture;
PImage EvilAlien;
PImage friendlyAlien;

// Sound
AudioPlayer player;
AudioPlayer gameOverplayer;
Minim minim;
Minim GameOver;

void setup() {
  size(1920, 1080);
  backgroundTexture= loadImage("SpaceBackground.jpg");
  EvilAlien = loadImage("EvilAlien.png");
  friendlyAlien= loadImage("friendlyalien.png");
  frameRate(60);
  highscoreStorage = new String[1]; 
  highscoreStorage = loadStrings("highscore.txt");
  highscore = Integer.parseInt(highscoreStorage[0]);
  textSize(30);
  textAlign(RIGHT);

  alienList = new Alien[100];
  int pAnzahlAliens = 2;

  //erstellen der Aliens mit random StartPosition
  for (int i = 0; i < pAnzahlAliens; i++) {
    int sectorMaxXPixel = width/pAnzahlAliens;
    int posX = parseInt(random(i*sectorMaxXPixel, (i*sectorMaxXPixel)+50));
    int posY = parseInt(random(70, height-70));
    int dx = parseInt(random(-5, 5));
    int dy = parseInt(random(-5, 5));
    dx = variableNotNull(dx); 
    dy = variableNotNull(dy);
    if(i==0){
      EvilAlien alien= new EvilAlien(dx,dy,posX,posY);
      alienList[i]=alien;
      alien.setup();
    }else{
      Alien alien = new Alien(dx, dy, posX, posY);
      alienList[i] = alien;
      alien.setup();
    }
  }
  ufo = new UFO();
  // Sound
  minim = new Minim(this);
  gameOverplayer= minim.loadFile("GameOverSound.mp3");
  player = minim.loadFile("Hintergrund(Sound).mp3");
  player.play(); //Musik starten
}


void draw() {
  if(state>1){
    state=1;
  }
  if(state ==0){//Startscreen
    startScreen();
    }else if(state==1){
  image(backgroundTexture,0,0); //ständig neuer schwarzer Hintergurnd
  ufo.draw(); //drwa funktion von UFO

  if (second() != seconds) { //score pro Sekunde erhöhen
    score++;
    seconds=second();
  }

  //Highscore
  text("score: " + score, width-100, 40); 
  if (score>highscore) {
    highscoreStorage[0] = "" + score; 
    saveStrings("highscore.txt", highscoreStorage);
  }
  if (frameCount%600 == 0){
    for (int i=0; i<alienList.length; i++){
      if (alienList[i] == null){
        int posX = parseInt(0);
        int posY = parseInt(0);
        int dx = parseInt(random(1, 5));
        int dy = parseInt(random(1, 5));
        Alien alien = new Alien(dx, dy, posX, posY);
        alien.setup();
        alienList[i] = alien;
        break;
      }
    }
  }
  text("highscore: "+ highscore, width-100, 70 );

  //for intteration für alle Alliens
  for (int i = 0; i < alienList.length; i++) {
    if (alienList[i] == null){break;}
    alienList[i].draw();

    if (second() != seconds) { //geschwindigkeit pro Sekunde erhöhen
      if (alienList[i].dx<0 && alienList[i].dx > (-9)) {
         alienList[i].dx -= 0.02; 
      } else if (alienList[i].dx < 9) {
        alienList[i].dx += 0.02;
      }

      if (alienList[i].dy<0 && alienList[i].dy > (-9)) {
         alienList[i].dy -= 0.02; 
      } else if (alienList[i].dx < 9) {
        alienList[i].dy += 0.02;
      }
    }

    alienList[i].checkBoundary();

    //Check collision with other aliens
    for (int y=i+1; y < alienList.length; y++) {    // Für jedes Alien was noch nach dem 
      if (alienList[y] == null){break;}
      if (alienList[i].checkCollisionWithAlien(alienList[i], alienList[y])) {    // Check collision with every alien


        alienList[y].collisionWithAlien(alienList[y]);
        //alienList[y+1].dX = alienList[y].dx * (-1);
        alienList[i].collisionWithAlien(alienList[i]);
        //alienList[i].dx = alienList[i].dy * (-1);
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
}
void startScreen(){
  background(0);
  textAlign(CENTER);
  textSize(80);
  text("Alien", width/2, height/2);
  text("Escape", width/2, height/2+80);
  textSize(30);
  text("press mouse to start", width/2, height-50);
}
void mousePressed(){
  state++;
}
void keyPressed() { //Restart
  player.pause();
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
