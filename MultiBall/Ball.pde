public class Ball {
  float x, y;
  float dx, dy;

  public Ball() {
    // Konstruktor
    // Ball mit zufaelliger Richtung erzeugen
    x = 400;
    y = 400;
    dx = random(1, 5);
    dy = random(1, 5);
    if (random(0, 1)<0.5) {
      dx = -dx;
    }
    if (random(0, 1)<0.5) {
      dy = -dy;
    }
  }

  public void draw() {
    // Ball zeichnen
    fill(255);
    circle(x, y, 32);

    // Ball bewegen,
    x += dx;
    y += dy;
    
    // Wandkollision pruefen
    if (x <= 16 || x >= 784) {
      dx = -dx;
    }
    if (y <= 16 || y >= 784) {
      dy = -dy;
    }
  }
}
