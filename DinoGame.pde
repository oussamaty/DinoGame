float ground , scale , distanceInBetween , gameSpeed;
Player dino; Obstacle currentObstacle;Button startButton;
ArrayList<Obstacle> obstacles;
boolean started;

void setup() {
  size(800,400);
  ground = height - 75;
  scale = width/5;
  gameSpeed = scale*0.05;
  distanceInBetween = random(width/2 + 100,width/2 + 200);
  dino = new Player();
  obstacles = new ArrayList<Obstacle>();
  Obstacle firstObstacle = new Obstacle(width + distanceInBetween,floor(random(3)));
  Obstacle secondObstacle = new Obstacle(width + 2*distanceInBetween,floor(random(3)));
  obstacles.add(firstObstacle);
  obstacles.add(secondObstacle);
  startButton = new Button();
}

void draw() {
  background(255);
  stroke(0);
  line(0,ground,width,ground);
  started = startButton.clicked;
  dino.update();
  dino.render();
  if (!startButton.clicked) {
    startButton.show();
  } else {
    animateObstacles();
    generateObstacles();
    checkObstacles();
  }
  if (dino.dead) {
    startButton.clicked = false;
    obstacles.clear();
    Obstacle firstObstacle = new Obstacle(width + distanceInBetween,floor(random(3)));
    Obstacle secondObstacle = new Obstacle(width + 2*distanceInBetween,floor(random(3)));
    obstacles.add(firstObstacle);
    obstacles.add(secondObstacle);
    gameSpeed = scale*0.05;
    dino.dead = false;
  }
}

void keyPressed() {
  dino.jump();
}

void mousePressed() {
  if (!startButton.clicked) {
    startButton.checkClick(mouseX,mouseY);
  }
}

void animateObstacles() {
  for (int i = 0; i  < obstacles.size(); i++) {
    obstacles.get(i).show();
    obstacles.get(i).move(gameSpeed);
  }
  if (!dino.dead) {
    gameSpeed += scale*0.000015;
  }
}

void generateObstacles() {
  int type = floor(random(3));
  if (obstacles.get(0).x + (obstacles.get(0).w)/2 < 0) {
    distanceInBetween = random(width/2 + 100*(1 + gameSpeed*0.1 + type*0.4),width/2 + 200*(1 + gameSpeed*0.1+ type*0.4));
    Obstacle newObstacles = new Obstacle(obstacles.get(obstacles.size() - 1).x + distanceInBetween,type);
    obstacles.add(newObstacles);
    obstacles.remove(0);
  } 
}

void checkObstacles() {
  if (obstacles.get(0).x + obstacles.get(0).w/2 < dino.x - dino.w/2) {
    currentObstacle = obstacles.get(1);
  } else {
    currentObstacle = obstacles.get(0);
  }
  checkCollision(currentObstacle);
}

boolean checkCollision(Obstacle obstacle) {
  if (obstacle.x - dino.x <= (obstacle.w + dino.w)/2 && obstacle.y - dino.y <= (obstacle.h + dino.h)/2) {
    dino.dead = true;
    gameSpeed = 0;
    return true;
  }
  return false;
}
