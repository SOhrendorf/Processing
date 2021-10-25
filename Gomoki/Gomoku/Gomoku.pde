int feld[][];
int player;
Stein stein;

void setup() {
  size(832, 832);
  feld = new int [13][13];
  player = 1;
  stein = new Stein();
}

void draw() {
  //Feld zeichnen
  for (int y = 0; y <13; y++) {
    for (int x = 0; x < 13; x++) {
      fill(0, 64, 0);
      stroke(0, 100, 0);
      rect(x*64, y*64, 64, 64);
      noStroke();
      fill(0, 16, 0, 128);
      rect(x*64+1, y*64+1, 63, 5);
      rect(x*64+1, y*64+6, 5, 58);
      
      //Felder auf Inhalt überprüfen und ggf. zeichen
      stein.zeichnen(x,y);
      }
    }
  }

void mousePressed() {
  println("klick");
  int x = mouseX/64;
  int y = mouseY/64;
  if (feld[x][y] == 0) {
    feld [x][y] = player;
    player = 3-player;
  }
}
