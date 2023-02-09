class Rok {
  int x, y, diam, speed;
  PImage rok;

  Rok() {
    x=int(random(width));
    y=-100;
    diam=int(random(50, 100));
    speed=int(random(3, 5));
    rok = loadImage("Rok.png");
  }
  void display() {
    imageMode(CENTER);
    rok.resize(diam, diam);
    image(rok, x, y);
  }

  void move() {
    y+= speed;
  }

  boolean reachedBottom() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
}
