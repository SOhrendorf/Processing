public class EvilAlien extends Alien{
  public EvilAlien(int pDx, int pDy, int pStartPosX, int pStartPosY){
    super(pDx, pDy, pStartPosX, pStartPosY);
  }
  void draw(){
    dx=(mouseX-x)*0.02;
    dy=(mouseY-x)*0.02;
    y= y+dy;
    x=x+dy;
    image(EvilAlien,x,y);
  }
}
