class Button {
    float x , y , w , r;
    boolean clicked;
  Button() {
    x = width/2;
    y = height/2;
    w = 100;
    r = w*3/8;
    clicked = false;
  }
  
  void show() {
    if (!clicked) {
      noStroke();
      fill(200);
      ellipseMode(CENTER);
      ellipse(x,y,w+10,w+10);
      stroke(0);
      fill(0);
      ellipseMode(CENTER);
      ellipse(x,y,w,w);
      fill(255);
      beginShape();
      for (int i = 0; i < 3 ; i++) {
        vertex(x + r*cos(i*2*PI/3),y + r*sin(i*2*PI/3));
      }
      endShape();
    }
  }
  
  void checkClick(float mousex,float mousey) {
    if ((mousex - x)*(mousex - x) + (mousey - y)*(mousey - y) < w*w) {
      clicked = true;
    }
  }  
}
