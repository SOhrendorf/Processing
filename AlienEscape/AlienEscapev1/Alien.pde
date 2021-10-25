public class Alien {
  int x;
  int y;
  int dx;
  int dy;
  float StartPosX;
  float StartPosY;
  PImage AlienTexture;

  Alien(int pDx, int pDy, int pStartPosX, int pStartPosY) {
    //konstrucktor: Variabeln von oben mit Werten von Parametern füllen
    dx = pDx;
    dy = pDy;
    StartPosX = pStartPosX;
    StartPosY = pStartPosY;
    AlienTexture = loadImage("alien0.png"); // Bild laden
  }

  void setup() {
    x = parseInt(StartPosX);
    y = parseInt(StartPosY);
  }

  void draw() {
    y = y + dy;
    x = x + dx; 
    image(AlienTexture, x, y);
  }

  void checkBoundary() {
    if (x > 1366 - AlienTexture.width) { //Rechter Rand
      dx = dx * -1;
    } else if (y > 768 - AlienTexture.height) { //Unterer Rand
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
}
