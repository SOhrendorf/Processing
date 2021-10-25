public class Alien {
  int x;
  int y;
  int dx;
  int dy;
  float startPosX;
  float startPosY;
  PImage AlienTexture;

  Alien(int pDx, int pDy, int pStartPosX, int pStartPosY) {
    //konstrucktor: Variabeln von oben mit Werten von Parametern füllen
    dx = pDx;
    dy = pDy;
    startPosX = pStartPosX;
    startPosY = pStartPosY;
    AlienTexture = loadImage("alien0.png"); // Bild laden
  }

  void setup() {
    x = parseInt(startPosX);
    y = parseInt(startPosY);
    println(startPosX, startPosY);
  }

  void draw() {
    y = y + dy;
    x = x + dx; 
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
    if (dist(pCheckObject.x, pCheckObject.y, mouseX, mouseY) < 70) {
      return true;
    } else {
      return false;
    }
  }

  boolean checkCollisionWithAlien(Alien pAlien1, Alien pAlien2) {
    if (dist(pAlien1.x, pAlien1.y, pAlien2.x, pAlien2.y) < 70) {
      return true;
    } else {
      return false;
    }
  }
}
