float moveY1 = 400;
float moveY2 = 400;

PongGame game;
PongBall ball;
PongPaddle player1;
PongPaddle player2;


void mouseMoved() {
  if (0 < mouseX && mouseX < 500) {
    moveY1 = mouseY;
  }
  if (500 < mouseX && mouseX < 1000) {
    moveY2 = mouseY;
  }
}

void setup() {
  size(1000, 800);
  ball = new PongBall();
  game = new PongGame();
  ball.vx = round(random(-1,1));
  if(ball.vx == 0){
    ball.vx = 1;
  }
  ball.stepX = 5;
  ball.stepY = random(-3,3);
}

void draw() {
  background(200);
  rectMode(CENTER);
  rect(500, 400, 10, 810);
  game.update();
  ball.drawBall();
  //player1 = new PongPaddle(12.5, moveY1);
  player2 = new PongPaddle(987.5, moveY2);
  //player1.drawPaddle();
  player2.drawPaddle();
  
  /*if(ball.pntX - 25 < 0){
    game.score2 += 1;
    ball.stepX = 5;
    game.speed = 5;
    game.hitStack = 0;
    ball.pntX = 500;
    ball.pntY = 400;
  }*/
  
  if(ball.pntX + 25 > 1000){
    game.score1 += 1;
    ball.stepX = 5;
    game.speed = 5;
    game.hitStack = 0;
    ball.pntX = 500;
    ball.pntY = 400;
  }
  
  if(ball.pntY - 25 < 0){
    ball.vy *= -1;
  }
  
  if(ball.pntY + 25 > 800){
    ball.vy *= -1;
  }
  
  /*if( ball.pntX-25 < player1.cenX+12.5 && ball.pntY+25 > player1.cenY-100 && ball.pntY-25 < player1.cenY+100){
    ball.vx *= -1;
    ball.stepX += 0.5;
    game.speed += 0.5;
    game.hitStack += 1;
    ball.stepY = random(-5,5);
  }*/
  
  if(ball.pntX - 25 < 0){
    ball.vx *= -1;
  }
  
  if( ball.pntX+25 > player2.cenX-12.5 && ball.pntY+25 > player2.cenY-100 && ball.pntY-25 < player2.cenY+100){
    ball.vx *= -1;
    ball.stepX += 0.5;
    game.speed += 0.5;
    game.hitStack += 1;
    game.score2 += 1;
    ball.stepY = random(-5,5);
  }
  
}

////////////////////////////////////////////////////////////////////////////////////////////////

class PongGame {
  int score1 = 0;
  int score2 = 0;
  PFont f = createFont("Arial", 16, true);
  float dragY1;
  float dragY2;
  float hitStack = 0;
  float speed = 5;
  
  
  void update() {

    /*fill(0);
    textFont(f, 100);
    textAlign(CENTER);
    text(score1, 250, 100);*/
    
    fill(0);
    textFont(f, 100);
    textAlign(CENTER);
    text(score2, 750, 100);
    
    fill(255);
    rectMode(CENTER);
    rect(500, 175, 200, 150);
    
    fill(0);
    textFont(f, 20);
    textAlign(CENTER);
    text("Speed "+str(speed), 500, 150);
    
    fill(0);
    textFont(f, 20);
    textAlign(CENTER);
    text("Hit Stack "+str(hitStack), 500, 200);
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////

class PongBall {
  float pntX = 500;
  float pntY = 400;
  int vx = 1;
  int vy = 1;
  float stepX;
  float stepY;

  void drawBall() {

    pntX += (stepX * vx);
    pntY += (stepY * vy);

    fill(255);
    ellipse(pntX, pntY, 50, 50);
  }
  
}

////////////////////////////////////////////////////////////////////////////////////////////////

class PongPaddle {
  float cenX;
  float cenY;

  PongPaddle(float cenX, float cenY) {
    this.cenX = cenX; 
    this.cenY = cenY;
  }

  void drawPaddle() {
    rectMode(CENTER);
    rect(this.cenX, this.cenY, 25, 200);
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////
