class Apple{
  int pos;
  
  //constructor
  Apple(){
    boolean flag = true;
    while(flag == true){
      flag = false;
      int X = int(random(1,board.width-1));
      int Y = int(random(1,board.height-1));
      pos = X + (Y*board.width);
      for(int i : snake.body){
        if (i == pos){
          flag = true;
        }
      }
    }
  }
  
  void show(){
    board.loadPixels();
    board.pixels[pos] = color(255,0,0);
    board.updatePixels();
  }
}
