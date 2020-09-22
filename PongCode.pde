PongGame game;
PongBall ball;
PongPaddle[] player;
class PongGame{
  int score1 = 0;
  int score2 = 0;
  PFont f = createFont("Arial",16,true);
  
  void serveBall(){
    ball = new PongBall();
  }
  void update(){
    
    

    textFont(f,100);
    textAlign(LEFT);
    text(score1,200,100);
    textFont(f,100);
    textAlign(RIGHT);
    text(score2,800,100);
  }
  void onTouchMove(){
    
  }
  
  
}

class PongBall{
  int height = 50;
  int width = 50;
  int velocity = -1;
  
  void drawBall(){
    
  }
  
  void move(){
    
  }
}

class PongPaddle{
  int width = 25;
  int height = 200;
  float curMouse1 = 400;
  float curMouse2 = 400;
  
  void drawPaddle1(){
    if(mousePressed){
      if(0 <= mouseX && mouseX <= 200){
        curMouse1 = mouseY;
      }
    }
    rectMode(CENTER);
    rect(15,curMouse1,30,200);
  }
  
  void drawPaddle2(){
    if(mousePressed){
      if(800 <= mouseX && mouseX <= 1000){
        curMouse2 = mouseY;
      }
    }
    rectMode(CENTER);
    rect(984,curMouse2,30,200);
  }
  
  void bounceBall(){
    
  }
}

class PongApp{
  
  void build(){
    game = new PongGame();
    player[0] = new PongPaddle();
    player[1] = new PongPaddle();
    game.update();
    rectMode(CENTER);
    rect(500,400,20,800);
  }
}


PongApp app;

void setup(){
  size(1000, 800);
  app = new PongApp();
  player = new PongPaddle[2];
}

void draw(){
  background(200);
  app.build();
  player[0].drawPaddle1();
  player[1].drawPaddle2();
}
