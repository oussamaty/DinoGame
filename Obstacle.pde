class Obstacle {
    float x , y , w , h , baseLine , bigRatio , smallRatio;
    PImage smallCactus , bigCactus , packageCactus , currentCactus;
    int type;
  Obstacle(float x ,int type) {
    this.type = type;
    this.x = x;
    bigRatio = 0.42;
    smallRatio = 0.3;
    smallCactus = loadImage("cactusBig0000.png");
    bigCactus = loadImage("cactusSmall0000.png");
    packageCactus = loadImage("cactusSmallMany0000.png");
    checkType(type);
    baseLine = ground - h/2;
    y = baseLine;
  }
    
  void show() {
    image(currentCactus,x,y,w,h);
  }
  
  void move(float Speed) {
    x -= Speed;
  }

  void checkType(int typeInput) {
      switch(typeInput) {
        case 0:
          currentCactus = smallCactus;
          w = scale*(smallRatio/2);
          h = scale*smallRatio;
          break;
        case 1:
          currentCactus = bigCactus;
          w = scale*(bigRatio/2);
          h = scale*bigRatio;
          break;
        case 2:
          currentCactus = packageCactus;
          w = scale*(smallRatio*3/2);
          h = scale*smallRatio;
          break;
        default:
          currentCactus = smallCactus;
          w = scale*(smallRatio/2);
          h = scale*smallRatio;
          break;
      }
  }

}
