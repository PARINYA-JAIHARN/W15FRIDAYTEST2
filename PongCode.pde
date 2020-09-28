float dragY1 = 400;    // save point of player1's paddle 
float dragY2 = 400;    // save point of player2's paddle 
float stpX = 1;
float stpY = 1;
float yPad1;
float yPad2;

PongApp app;
PongGame game;
PongBall ball;
PongPaddle player1;
PongPaddle player2;

void mouseDragged() {    //add drag event
  if ((mousePressed) && (0 <= mouseX && mouseX <= 200)) {
    dragY1 = mouseY;
  }
  if ((mousePressed) && (800 <= mouseX && mouseX <= 1000)) {
    dragY2 = mouseY;
  }
}

void setup() {
  size(1000, 800);
  app = new PongApp();    //create PongApp object
}

void draw() {
  background(200);
  app.build();    // call PongApp method 
  stpX+=3;
  stpY+=1;
  ball = new PongBall(stpX, stpY, dragY1, dragY2);    //create PongBall object
  ball.drawBall();    // call PongBall method
}

////////////////////////////////////////////////////////////////////////////////////////////////

class PongGame {    //game process class
  int score1 = 0;
  int score2 = 0;
  PFont f = createFont("Arial", 16, true);
  float dragY1;
  float dragY2;

  PongGame(float dragY1, float dragY2) {
    this.dragY1 = dragY1;
    this.dragY2 = dragY2;
  }

  void serveBall() {
    
  }
  void update() {    // counting score and show


    textFont(f, 100);
    textAlign(LEFT);
    text(score1, 200, 100);
    textFont(f, 100);
    textAlign(RIGHT);
    text(score2, 800, 100);
  }

  void onTouchMove() {    // create paddle for both player
    player1 = new PongPaddle(12.5, this.dragY1);     // create PongPaddle object
    player2 = new PongPaddle(987.5, this.dragY2);    // create PongPaddle object
    player1.drawPaddle();    // call PongPaddle method 
    player2.drawPaddle();    // call PongPaddle method 
 
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////

class PongBall {    // ball class
  float pntX = 500;
  float pntY = 400;
  float vx = 1;
  float vy = 1;
  float stpX;
  float stpY;
  float dragY1;
  float dragY2;

  PongBall(float stpX, float stpY, float dragY1, float dragY2) {
    this.stpX = stpX;
    this.stpY = stpY;
    this.dragY1 = dragY1;
    this.dragY2 = dragY2;
  }

  void drawBall() {    //draw ball and make movement
    
    pntX += (this.stpX * vx);    // current position increase from parameter stpX and vx use for reverse direction
    pntY += (this.stpY * vy);    // current position increase from parameter stpY and vy use for reverse direction

    if (pntX < 50 && pntY >= this.dragY1 - 100 && pntY <= this.dragY1 + 100){   // if hit paddle left, but not work
      vx *= -1;    // let direction in axis X reversed
    }
      
    if (pntX > 950 && pntY >= this.dragY2 - 100 && pntY <= this.dragY2 + 100){  // if hit paddle left, but not work
      vx *= -1;    // let direction in axis X reversed
    }
  
    if ((pntY <= 25 || pntY >= 775) ) {
      vy *= -1;    // let direction in axis Y reversed
    }

    fill(255);
    ellipse(pntX, pntY, 50, 50);
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////

class PongPaddle {    // paddle class 
  float xPnt;
  float yPnt;

  PongPaddle(float xPnt, float yPnt) {
    this.xPnt = xPnt; 
    this.yPnt = yPnt;
  }

  void drawPaddle() {    // draw paddle
    rectMode(CENTER);
    rect(this.xPnt, this.yPnt, 25, 200);
  }
  
  float getPad(){    // to return level of paddle 
    float yPad;
    yPad = this.yPnt;
    return yPad;
  }
  
}

////////////////////////////////////////////////////////////////////////////////////////////////

class PongApp {    // app running class

  void build() {
    game = new PongGame(dragY1, dragY2);    // create PongGame object
    game.onTouchMove();    // call PongGame method 
    game.update();    // call PongGame method
    rectMode(CENTER);    // draw mid-line0.0
    rect(500, 400, 10, 810);
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////
