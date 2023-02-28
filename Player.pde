class Player{
  int x;
  int y;
  int xdir;
  int ydir;
  IntList body;
  Boolean grow;
  
  //constructor
  Player(int X, int Y){
    x = X;
    y = Y;
    xdir = 1;
    ydir = 0;
    body = new IntList();
    grow = true; //initially grow to a size of 1
  }
  
  void update(){
    x += xdir;
    y += ydir;
    int head = x+(y*board.width);
    body.append(head);
    if (head == apple.pos){
      grow = true;
      apple = new Apple();
    }
    
    if (grow==false){
      body.remove(0);
    }
    grow = false;
  }

  void pushtoboard(){
    board.loadPixels();
    board = createImage(board.width,board.height,RGB);
    for(int i : body){
      board.pixels[i]=color(0,255,0);
    }
    apple.show();
    board.updatePixels(); 
    //printArray(body);
  }

  boolean alive(){
    //if off edge
    for(int i=0; i<body.size(); i++){
      for(int j=0; j<body.size(); j++){
        
        //edges
        if (((body.get(i) < board.width)&&(ydir == -1))||((body.get(i) > board.pixels.length-board.width)&&(ydir == 1))||((body.get(i) % board.width==0)&&(xdir == -1))||((body.get(i) % board.width == board.width-1)&&(xdir == 1))){
        //if (top edge) or (bottom edge) or (left edge) or (right edge)
          return false;
        }
        
        //self-colission
        if(i!=j){
          if (body.get(i) == body.get(j)){
            return false; 
          }
        }
      }
    }
    return true;
    
  }




}
