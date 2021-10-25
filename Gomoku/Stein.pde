public class Stein {
  int farbe; 

  //lerer Konstruktor
  Stein() {
  }

  void zeichnen(int pPosX, int pPosY) {
    //Farbauswahl
    if (feld[pPosX][pPosY] == 1) {
      fill(255, 255, 255);
    } else if (feld[pPosX][pPosY] == 2) {
      fill(255, 50, 0);
    } else {
      noFill();
    }
    //Kreis zeichnen
    circle(pPosX*64+32, pPosY*64+32, 30);
  }
}
