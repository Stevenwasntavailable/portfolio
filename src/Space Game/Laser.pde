class Laser {
  int x, y, w, h, speed;

  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w=2;
    h=8;
    speed=7;
  }
  void display() {
    fill(0, 255, 0);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    y -= speed;
  }

  boolean bedrock() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rok rok) {
   float d = dist(x, y, rok.x, rok.y);
    if (d<40) {
      return true;
    } else {
      return false;
    }
  }
}
