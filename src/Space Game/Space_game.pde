//Steven Babcock | Nov 29 | Spaceship
Ship s;
ArrayList<Rok> r = new ArrayList<Rok>();
ArrayList<Laser> pewpew = new ArrayList<Laser>();
ArrayList<PowerUp> pup = new ArrayList<PowerUp>();
Clock rt, put;

int score, level;
boolean play;
Ballofire[] sun = new Ballofire[100];
void setup() {
  size (800, 800);
  noCursor();
  noStroke();
  s = new Ship();
  play = false;
  rt = new Clock(500);
  rt.start();
  put = new Clock(20000);
  put.start();
  for (int i = 0; i<sun.length; i ++) {
    sun[i] = new Ballofire();
  }
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(50);
    //render stars
    for (int i = 0; i<sun.length; i ++) {
      sun[i].display();
      sun[i].move();
    }
    if (rt.isFinished()) {
      r.add(new Rok());
      rt.start();
    }
    //add rocks
    if (put.isFinished()) {
      pup.add(new PowerUp());
      put.start();
    }
    for (int i = 0; i < pup.size(); i++) {
      PowerUp p = pup.get(i);
      if (p.intersect(s)) {
        if (p.type == 'H') {
          s.health+=25;
        } else if (p.type == 'A') {
          s.laserCount += 100;
        } else {
          s.turretCount +=1;
        }
        pup.remove(p);
      }
      if (p.reachedBottom()) {
        r.remove(p);
      } else {
        p.display();
        p.move();
      }
    }

    for (int i = 0; i < r.size(); i++) {
      Rok rocks = r.get(i);
      if (s.intersect(rocks)) {
        s.health-=rocks.diam/10;
        score+=rocks.diam;
        r.remove(rocks);
      }
      if (rocks.reachedBottom()) {
        r.remove(rocks);
      } else {
        rocks.display();
        rocks.move();
      }
    }

    for (int e = 0; e < pewpew.size(); e++) {
      Laser l = pewpew.get(e);
      for (int q = 0; q < r.size(); q++) {
        Rok rocks = r.get(q);
        if (l.intersect(rocks)) {
          score+=rocks.diam;
          pewpew.remove(l);
          r.remove(rocks);
        }
      }
      if (l.bedrock()) {
        pewpew.remove(l);
      } else {
        l.display();
        l.move();
      }
    }

    s.display();
    s.move(mouseX, mouseY);

    infoPanel();

    if (s.health<1) {
      gameOver();
    }
  }
}
void mousePressed() {
  if (s.fire() && s.turretCount==1) {
    pewpew.add(new Laser(s.x, s.y));
  } else if (s.fire() && s.turretCount==2) {
    pewpew.add(new Laser(s.x+20, s.y));
    pewpew.add(new Laser(s.x-20, s.y));
  } else if (s.fire() && s.turretCount==3) {
    pewpew.add(new Laser(s.x, s.y));
    pewpew.add(new Laser(s.x-20, s.y));
    pewpew.add(new Laser(s.x+20, s.y));
  }
}
void keyPressed() {
}
void infoPanel() {
  fill(255, 100);
  rectMode(CENTER);
  rect(400, 25, width, 50);
  fill(80, 80, 80);
  textSize(40);
  textAlign(CENTER);
  text("Score: "+score+"   Level: "+
    level+" Ammo: "
    + s.laserCount
    +" Health " + s.health, 400, 40);
}

void startScreen() {
  background(0);
  fill(250);
  textAlign(CENTER);
  text("Press any key to Begin \n click to shoot and don't get shot", width/2, height/2);
  if (keyPressed) {
    play = true;
  }
}
void gameOver() {
  background(0);
  fill(250);
  textAlign(CENTER);
  text("Game Over", width/2, height/2);
  if (keyPressed) {
    noLoop();
  }
}
