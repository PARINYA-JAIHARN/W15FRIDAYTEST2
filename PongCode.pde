float moveY1 = 400;    // save point of player1's paddle 
float moveY2 = 400;    // save point of player2's paddle 

PongGame game;
PongBall ball;
PongPaddle player1;
PongPaddle player2;


void mouseMoved() {    //add move event
  if (0 < mouseX && mouseX < 500) {    // left side
    moveY1 = mouseY;
  }
  if (500 < mouseX && mouseX < 1000) {    // right side
    moveY2 = mouseY;
  }
}

void setup() {
  size(1000, 800);
  ball = new PongBall();    // create PongBall object
  game = new PongGame();    // create PongGame object
  
  ball.vx = round(random(-1,1));    // random speed in X axis between -1, 0, 1 (go to  left or right)
  if(ball.vx == 0){    // if random and get 0
    ball.vx = 1;    // then assign vx to 1
  }
  
  ball.stepX = 5;    // distance in X axis increaser
  ball.stepY = random(-3,3);    // distance in Y axis increaser (when hit paddle, stepY won't flip 100% in vertical)
}

void draw() {
  background(200);
  rectMode(CENTER);
  rect(500, 400, 10, 810);    // mid-line
  game.update();    // call PongGame method
  ball.drawBall();    // call PongBall method
  player1 = new PongPaddle(12.5, moveY1);    // create PongPaddle object
  player2 = new PongPaddle(987.5, moveY2);    // create PongPaddle object
  player1.drawPaddle();    // call PongPaddle method
  player2.drawPaddle();    // call PongPaddle method
  
  if(ball.pntX - 25 < 0){    // if the ball out of screen at left side, start at default position
    ball.stepX = 5;
    ball.pntX = 500;
    ball.pntY = 400;
  }
  
  if(ball.pntX + 25 > 1000){    // if the ball out of screen at right side, start at default position
    ball.stepX = 5;
    ball.pntX = 500;
    ball.pntY = 400;
  }
  
  if(ball.pntY - 25 < 0){    // if the ball hit the top of screen, bounce by reverse direction in Y axis 
    ball.vy *= -1;    // flip vertical
  }
  
  if(ball.pntY + 25 > 800){    // if the ball hit the bottop of screen, bounce by reverse direction in Y axis 
    ball.vy *= -1;    // flip vertical
  }
  
  // if the ball hit the left paddle, bounce by reverse direction in X axis
  if( ball.pntX-25 < player1.cenX+12.5 && ball.pntY+25 > player1.cenY-100 && ball.pntY-25 < player1.cenY+100){
    ball.vx *= -1;    // flip horizonal
    ball.stepY = random(-5,5);    // when hit paddle, stepY won't flip 100% in vertical
  }
  
  // if the ball hit the right paddle, bounce by reverse direction in X axis
  if( ball.pntX+25 > player2.cenX-12.5 && ball.pntY+25 > player2.cenY-100 && ball.pntY-25 < player2.cenY+100){
    ball.vx *= -1;    // flip horizonal
    ball.stepY = random(-5,5);    // when hit paddle, stepY won't flip 100% in vertical
  }
  
}

////////////////////////////////////////////////////////////////////////////////////////////////

class PongGame {    // game running class
  int score1 = 0;
  int score2 = 0;
  PFont f = createFont("Arial", 16, true);
  
  void update() {
    
    // player1's score report
    fill(0);
    textFont(f, 100);
    textAlign(CENTER);
    text(score1, 250, 100);
    
    // player2's score report
    fill(0);
    textFont(f, 100);
    textAlign(CENTER);
    text(score2, 750, 100);

  }
}

////////////////////////////////////////////////////////////////////////////////////////////////

class PongBall {    // ball class
  float pntX = 500;    // default position 
  float pntY = 400;    // default position 
  int vx = 1;    // direction changer in horizonal
  int vy = 1;    // direction changer in vertical
  float stepX;    // distance increaser in X axis
  float stepY;    // distance increaser in Y axis

  void drawBall() {    // draw ball and make movement

    pntX += (stepX * vx);    // default position add with distance increaser  
    pntY += (stepY * vy);    // default position add with distance increaser  

    fill(255);
    ellipse(pntX, pntY, 50, 50);
  }
  
}

////////////////////////////////////////////////////////////////////////////////////////////////

class PongPaddle {    // paddle class
  float cenX;
  float cenY;

  PongPaddle(float cenX, float cenY) {    // constructor to receive parameters (there're 2 paddles to draw)
    this.cenX = cenX; 
    this.cenY = cenY;
  }

  void drawPaddle() {    // draw paddle 
    rectMode(CENTER);
    rect(this.cenX, this.cenY, 25, 200);
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////
