class Ship {
  int x, y, w, laserCount, turretCount, health;
  PImage photo;
  Ship() {
    x=400;
    y=700;
    w=90;
    laserCount= 1000;
    turretCount = 1;
    health = 100;
    photo = loadImage("spaceship.png");
  }


  void display() {
    photo.resize(90, 90);
    imageMode(CENTER);
    image(photo, x, y);
  }
  void move(int tempx, int tempy) {
    x = tempx;
    y = tempy;
  }

  boolean fire() {
    if (laserCount>0) {
      laserCount--;
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
