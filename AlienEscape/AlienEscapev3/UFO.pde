class UFO {
  int x;
  int y;
  UFO() {
    //Konstruktor: noch leer und keine Idee
  }


  public void draw() {
    fill(#318FB9);
    ellipse(mouseX, mouseY-10, 30, 45);
    fill(#A031B9);
    quad(mouseX-20, mouseY-10, mouseX+20, mouseY-10, mouseX+35, mouseY+10, mouseX-35, mouseY+10);
    fill(#7B31B9);
    quad(mouseX-22, mouseY+10, mouseX+22, mouseY+10, mouseX+15, mouseY+18, mouseX-15, mouseY+18);
    //diese zeichnet das komplette UFO
  }

}
