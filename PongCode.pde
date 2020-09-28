float dragY1 = 400;    // save point of player1's paddle 
float dragY2 = 400;    // save point of player2's paddle 

PongApp app; 
PongGame game;
PongBall ball;
PongPaddle player1;
PongPaddle player2;

void mouseDragged(){ //add drag event
  if((mousePressed) && (0 <= mouseX && mouseX <= 200)){ //area to drag
     dragY1 = mouseY;
  }
  if((mousePressed) && (800 <= mouseX && mouseX <= 1000)){ //area to drag
     dragY2 = mouseY;
  }
}

void setup(){
  size(1000, 800);
  app = new PongApp();       //create PongApp object
  ball = new PongBall();     //create PongBall object
}

void draw(){
  background(200);
  app.build();    // call PongApp method 
  ball.drawBall();    // call PongBall method
}

////////////////////////////////////////////////////////////////////////////////////////////////

class PongGame{    //game process class
  int score1 = 0;
  int score2 = 0;
  PFont f = createFont("Arial",16,true);
  float dragY1;
  float dragY2;
  
  PongGame(float dragY1, float dragY2){
    this.dragY1 = dragY1;
    this.dragY2 = dragY2;
  }
  
  void serveBall(){
    
  }
  void update(){    // counting score and show
    

    textFont(f,100);
    textAlign(LEFT);
    text(score1,200,100);
    textFont(f,100);
    textAlign(RIGHT);
    text(score2,800,100);
  }

  void onTouchMove(){ // create paddle for both player
    mouseDragged();
    player1 = new PongPaddle(15, this.dragY1);     // create PongPaddle object
    player2 = new PongPaddle(985, this.dragY2);    // create PongPaddle object
    player1.drawPaddle();    // call PongPaddle method 
    player2.drawPaddle();    // call PongPaddle method
  }
  
}

////////////////////////////////////////////////////////////////////////////////////////////////

class PongBall{    // ball class
  int height = 50;
  int width = 50;
  int pntX = 500;
  int pntY = 400;
  int stepX = 1;
  int stepY = 1;
  
  
  void drawBall(){    //draw ball and make movement
  
    if(pntY <= 25 || pntY >= 775){    // if hit top and bottom of screen
     stepY *= -1;    // let direction in axis Y reversed
    }
    
    fill(255);
    ellipse(pntX+stepX, pntY+stepY, 50, 50);
    
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////

class PongPaddle{    // paddle class 
  int width = 25;
  int height = 200;
  int dragY = 400;
  float xPnt;
  float yPnt;
  
  PongPaddle(float xPnt, float yPnt){ 
   this.xPnt = xPnt; 
   this.yPnt = yPnt;
  }
  
  void drawPaddle(){    // draw paddle
    rectMode(CENTER);
    rect(this.xPnt, this.yPnt, 30, 200);
  }
  
  void bounceBall(){    // condition if the ball hits the paddle
    
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////

class PongApp{    // app running class
  
  void build(){
    game = new PongGame(dragY1, dragY2);    // create PongGame object
    game.onTouchMove();    // call PongGame method 
    game.update();    // call PongGame method
    rectMode(CENTER);    // draw mid-line
    rect(500,400,10,810);
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////
