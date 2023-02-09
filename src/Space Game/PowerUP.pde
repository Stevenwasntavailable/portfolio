class PowerUp {
  int x, y, diam, speed;
  char type;
  

  PowerUp() {
    x=int(random(width));
    y=-100;
    diam=int(random(100));
    speed=int(random(2));
    int rand = int(random(3));
    if(rand == 0){
    type = 'H';
    }else if(rand == 1){
      type='A';
    }else{
      type = 'T';
  }
  }
  void display() {
    fill(0,222,0);
    rect(x,y,diam,diam);
    fill(0);
    textAlign(CENTER);
    text(type,x,y);
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
  boolean intersect(Ship s) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
