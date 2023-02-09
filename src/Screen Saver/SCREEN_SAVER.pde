//Steven Babcock | Screen Saver | oct. 11

float xpos, ypos, strokeW, pointCount;

void setup() {
  size(displayWidth, displayHeight);
  frameRate(20);
  background(0);
  xpos=random(width);
  ypos=random(height);
}

void draw() {
  stroke(random(255),255,255);
  strokeW = (random(5, 20));
  pointCount = (random(10, 100));
  if (xpos>width || xpos <0 ||ypos > height || ypos <0) {
    xpos = random(width);
    ypos = random(height);
  } 
    if (random(100)>70) {
      strokeWeight(strokeW);
      moveLeft(xpos, ypos, pointCount);
    } else if (random(100)>65) {
      strokeWeight(strokeW);
      moveUp(xpos, ypos, pointCount);
    } else if (random(100)>55) {
      strokeWeight(strokeW);
      moveDown(xpos, ypos, pointCount);
    } else {
      strokeWeight (strokeW);
      moveRight(xpos, ypos, pointCount);
    }
  }
void moveRight(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY);
    xpos = startX + i;
    ypos = startY;
  }
}

void moveLeft(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY);
    xpos = startX - i;
    ypos = startY;
  }
}

void moveUp(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY-i);
    xpos = startX;
    ypos = startY - i;
  }
}

void moveDown(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY + i);
    xpos = startX ;
    ypos = startY + i;
  }
}
