Ball ball;
int time = 0;

void setup() {
  size(800, 800);
  
  ball = new Ball();
}

void draw() {
  background(128);
  
  ball.draw();
  
  fill(200);
  circle(400, 400, 64);
  
  time++;
  if (time == 100) {
    time = 0;
    // Neuen Ball erzeugen...

  }
}
