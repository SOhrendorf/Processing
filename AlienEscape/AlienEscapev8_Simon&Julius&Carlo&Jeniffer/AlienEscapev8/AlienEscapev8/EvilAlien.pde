public class EvilAlien extends Alien{
  float speedMultipler;
  public EvilAlien(float pDx, float pDy, float pStartPosX, float pStartPosY, float pSpeedMultipler){
    super(pDx, pDy, pStartPosX, pStartPosY);
    speedMultipler = pSpeedMultipler;
  }
  void draw(){
    dx=(mouseX-x)*speedMultipler;
    dy=(mouseY-y)*speedMultipler;
    y= y+dy;
    x=x+dx;
    image(EvilAlien,x,y);
  }
}
