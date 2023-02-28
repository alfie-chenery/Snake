Player snake;
PImage board;
Apple apple;
int res = 20;

boolean auto_grow = false; //grow once per frame
boolean crazy_apple = false; //apple moves every frame

void setup(){
  frameRate(15);
  size(800,800);
  board = createImage(width/res,height/res,RGB);
  snake = new Player(board.width/2,board.height/2);
  apple = new Apple();
}

void keyPressed(){
  if (key == 'w'){
    snake.xdir = 0; 
    snake.ydir = -1;
  }else if (key == 'a'){
    snake.xdir = -1; 
    snake.ydir = 0;
  }else if (key == 's'){
    snake.xdir = 0; 
    snake.ydir = 1;
  }else if (key == 'd'){
    snake.xdir = 1;  
    snake.ydir = 0;
  }
}

void draw(){
  if(auto_grow){
    snake.grow = true;
  }
  if(crazy_apple){
    apple = new Apple(); 
  }
  
  
  //show board
  snake.update();
  
  if (snake.alive()){
    
    snake.pushtoboard();
  
    board.loadPixels();
    for (int x = 0; x < board.width; x++){
      for (int y = 0; y < board.height; y++){
        color c = board.get(x,y);
        fill(c);
        
        if((x==0)||(x==board.width-1)||(y==0)||(y==board.height-1)){
          fill(255);//overide edges with white
        }
        
        rect(x*res,y*res,res,res);
      }
    }
    board.updatePixels();
    
  }else{
    death();
  }
}

void death(){
  String txt = "Score: " + str(snake.body.size());
  fill(255);
  textSize(80);
  textAlign(CENTER);
  text(txt, width/2,height/2);
  noLoop();
}
