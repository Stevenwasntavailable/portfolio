//Steven Babcock | Nov 2022 | calc project
Button[] numButtons  = new Button [10];
Button[] opButtons = new Button[18];
String dVal = "0.0";
float l, r, result;
char op = ' ';
boolean left = true;

void setup() {
  size(900, 1000);
  textSize(50);
  numButtons[0]  = new Button(300, 675, 75, 50, '7');
  numButtons[1]  = new Button(400, 675, 75, 50, '8');
  numButtons[2]  = new Button(500, 675, 75, 50, '9');
  numButtons[3]  = new Button(300, 750, 75, 50, '4');
  numButtons[4]  = new Button(400, 750, 75, 50, '5');
  numButtons[5]  = new Button(500, 750, 75, 50, '6');
  numButtons[6]  = new Button(300, 825, 75, 50, '1');
  numButtons[7]  = new Button(400, 825, 75, 50, '2');
  numButtons[8]  = new Button(500, 825, 75, 50, '3');
  numButtons[9]  = new Button(400, 900, 75, 50, '0');
  opButtons[0]  = new Button(500, 900, 75, 50, '.');
  opButtons[1]  = new Button(300, 900, 75, 50, '_');
  opButtons[2]  = new Button(600, 900, 75, 50, '=');
  opButtons[3]  = new Button(600, 825, 75, 50, '-');
  opButtons[4]  = new Button(600, 750, 75, 50, '+');
  opButtons[5]  = new Button(600, 675, 75, 50, '/');
  opButtons[6]  = new Button(600, 600, 75, 50, '*');
  opButtons[7]  = new Button(500, 600, 75, 50, ')');
  opButtons[8]  = new Button(400, 600, 75, 50, '(');
  opButtons[9]  = new Button(300, 600, 75, 50, 'x');
  opButtons[10]  = new Button(400, 525, 75, 50, '←');
  opButtons[11]  = new Button(500, 525, 75, 50, '↓');
  opButtons[12]  = new Button(600, 525, 75, 50, '→');
  opButtons[13]  = new Button(500, 450, 75, 50, '↑');
  opButtons[14]  = new Button(600, 450, 75, 50, 'C');
  opButtons[15]  = new Button(400, 450, 75, 50, '␈');
  opButtons[16]  = new Button(300, 450, 75, 50, '>');
  opButtons[17]  = new Button(300, 525, 75, 50, '<');
}
void draw() {
  background(128, 200, 200);
  updateDisplay();
  fill(0);
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
}

void mouseReleased() {
  for (int i = 0; i<numButtons.length; i++) {
    if (numButtons[i].on && dVal.length() < 10) {
    handleEvent(str(numButtons[i].val),true);
    }
  }
  for (int i = 0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val =='C') {
      dVal = "0.0";
      l = 0.0;
      r=0.0;
      result =0.0;
      left = true;
      op = ' ';
    } else if (opButtons[i].on && opButtons[i].val =='+') {
      op = '+';
      left = false;
      dVal = "0.0";
    } else if (opButtons[i].on && opButtons[i].val =='-') {
      op = '-';
      left = false;
      dVal = "0.0";
    } else if (opButtons[i].on && opButtons[i].val =='/') {
      op = '/';
      left = false;
      dVal = "0.0";
    } else if (opButtons[i].on && opButtons[i].val =='*') {
      op = '*';
      left = false;
      dVal = "0.0";
    } else if (opButtons[i].on && opButtons[i].val =='=') {
      preformCalculation ();
    } else if (opButtons[i].on && opButtons[i].val =='_') {
      if (left) {
        l=l*-1;
        dVal = str(l);
      } else {
        r=r*-1;
        dVal = str(r);
      }
    }
  }
  println("l:" + l+ " op: " + op + " R " + r + "Result: " + result +  "Left: "+  left);
}

void updateDisplay() {
  rectMode(CENTER);
  fill(255, 175, 0);
  textSize(70);
  rect(width/2, 200, width-100, 200);
  fill(255);
  textAlign(RIGHT);
  if (dVal.length() <10) {
    textSize(65);
  } else if (dVal.length() <11) {
    textSize(60);
  } else {
    textSize(55);
  }
  text(dVal, width-150, 200);
  textSize(30);
}
void keyPressed() {
  println("key: " + key);
  println("keyCode: " + keyCode);
  if (keyCode == 49 || keyCode== 98) {
    handleEvent("1",true);
  } else if (keyCode == 50 || keyCode == 98) {
    // this is number 2
  }
}
void handleEvent(String val, boolean num) {
  if (num && dVal.length() < 10) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
        l = float(dVal);
      } else {
        r = float(dVal);
      }
  } else {
  }
}

void preformCalculation () {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '/') {
    result = l / r;
  } else if (op == '*') {
    result = l * r;
  }
  dVal = str(result);
  l = result;
}
