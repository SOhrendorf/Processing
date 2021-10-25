public class Alien {
  float x;
  float y;
  float dx;
  float dy;
  
  int collisionTimeout; // Damit die Aliens sich nicht ineinander verharken können sie sich nur alle 0.5 (z.B.) Sekunden abstoßen
  Alien lastAlienCollision; 
  
  float startPosX;
  float startPosY;
  PImage AlienTexture;

  Alien(float pDx, float pDy, float pStartPosX, float pStartPosY) {
    //konstrucktor: Variabeln von oben mit Werten von Parametern füllen
    dx = pDx;
    dy = pDy;
    startPosX = pStartPosX;
    startPosY = pStartPosY;
    AlienTexture = loadImage("alien0.png"); // Bild laden
  }
  
  void collisionWithAlien(Alien pCollidedAlien){
    if (pCollidedAlien!=lastAlienCollision || collisionTimeout < 0){    // Wenn zwei Aliens innerhalb von 30 Frames zweimal miteinander kollidieren, soll die Collision einfach ignoriert werden //<>//
      dx = dx * (-1); //<>//
      dy = dy * (-1);
      collisionTimeout = 30;
      lastAlienCollision = pCollidedAlien;
    }
  }

  void setup() {
    x = startPosX;
    y = startPosY;
  }

  void draw() {
    y = y + dy;
    x = x + dx; 
    collisionTimeout -= 1;
    image(AlienTexture, x, y);
  }

  void checkBoundary() {
    if (x > width - AlienTexture.width) { //Rechter Rand
      dx = dx * -1;
    } else if (y > height - AlienTexture.height) { //Unterer Rand
      dy = dy * -1;
    } else if (x < 0) { //Linker Rand
      dx = dx * -1;
    } else if (y < 0) { //Oberer Rand
      dy = dy * -1;
    }
  }

  boolean checkCollision(Alien pCheckObject) {
    if (dist(pCheckObject.x, pCheckObject.y, mouseX, mouseY) < 45) {
      return true;
    } else {
      return false;
    }
  }

  boolean checkCollisionWithAlien(Alien pAlien1, Alien pAlien2) {
    if (dist(pAlien1.x, pAlien1.y, pAlien2.x, pAlien2.y) < 40){
      return true;
    } else {
      return false;
    }
  }
}
