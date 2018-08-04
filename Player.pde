class Player {
    float x , y , w , h;
    float gravity , velocity , jumpUnit , baseLine;
    PImage dino , dinoRun1 , dinoRun2 , dinoJump , dinoDead , currentImage;
    boolean jumped , dead;
  Player() {
    w = scale*0.35;
    h = scale*0.4;
    baseLine = ground - h/2;
    x = 70;
    y = baseLine;
    gravity = scale*0.00833333333;
    velocity = 0;
    jumpUnit = scale*0.12;
    dino = loadImage("dino0000.png");
    dinoRun1 = loadImage("dinorun0000.png");
    dinoRun2 = loadImage("dinorun0001.png"); 
    dinoJump = loadImage("dinoJump0000.png");
    dinoDead = loadImage("dinoDead0000.png");
  }

  void render() {
    if (!jumped && !dead && started) {
      if (millis() % 200 < 100) {
        currentImage = dinoRun1;
      } else {
        currentImage = dinoRun2; 
      }
    } else if (jumped) {
      currentImage = dinoJump;
    } else if (dead) {
      currentImage = dinoDead;
    } else {
      currentImage = dino;
    }
    imageMode(CENTER);
    image(currentImage,x,y,w,h);
  }
  
  void update() {
    y += velocity;
    if (y < baseLine) {
      jumped = true;
      velocity += gravity;
    } else {
      y = baseLine;
      velocity = 0;
      jumped =false;
    }
    if (dead) {
      velocity = 0;
      jumped = false;
    }
  }
  
  void jump() {
    if ( y == baseLine) {
      velocity -= jumpUnit;
    }
  }

}
