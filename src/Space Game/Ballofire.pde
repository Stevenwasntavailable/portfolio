class Ballofire {
  int x, y, diam, speed;


  Ballofire() {
    x = int(random(width));
    y = int(random(height));
    diam = int(random(1, 3));
    speed = int(random(2, 5));
  }
  void display() {
    fill(220, 255, 0);
    circle(x, y, diam);
  }

  void move() {
    if (y>height+10) {
      y=  -10;
    } else {
      y+= speed;
    }
  }

  boolean bedrock() {
    return true;
  }
}
