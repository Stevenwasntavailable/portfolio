class  Button {
  //Member Variable
  int x, y, w, h;
  color c1, c2;
  char val;
  boolean on;

  // Constructor
  Button(int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(128,222,255);
    c2 = color(178, 222, 255);
    on = false;
  }
  //member methods
  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h);
    textAlign(CENTER);
    fill(0);
    text(val, x, y+15);
  }

  void hover(int mx, int my) {
    on = (mx>x-w/2 && mx<x+w/2 && my>y-h/2 && my<y+h/2);
  }
}
