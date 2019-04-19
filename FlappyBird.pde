Bird bird;

void setup() {
  size(700, 800);
  bird = new Bird();
  rectMode(CENTER);
  imageMode(CENTER);

}

void draw() {
  background(127);
  text(round(frameRate), 10, 10);

  // Predraw calculations (collision detection, animationState)
  bird.update();

  if (bird.top <= 0) {
    bird.v = 0;
    bird.setY(32);
  }

  if (bird.bottom >= height) {
    bird.a = 0;
    bird.v = 0;
    bird.setY(height - 32);
  }

  line(bird.left, bird.top, bird.right, bird.top);
  line(bird.left, bird.bottom, bird.right, bird.bottom);
  line(bird.left, bird.top, bird.left, bird.bottom);
  line(bird.right, bird.top, bird.right, bird.bottom);


  bird.draw();
}

void mouseClicked() {
  bird.v = -10.5;
  bird.animationFrame = 0;
}

void keyPressed() {
  mouseClicked();
}

class Bird {
  PImage[] sprites = new PImage[3];
  final float left = width*0.5 - 32, right = width*0.5 + 32;
  private float y;
  float v = 0, a = 0.4, top, bottom;
  int animationState = 2, animationFrame = 27;

  Bird () {
    setY(height*0.5);

    // Sprites loading
    PImage sheet = loadImage("spritesheet.png");
    int spriteWidth = sheet.width/3;
    for (int i = 0; i < 3; i++) {
      sprites[i] = sheet.get(i*spriteWidth, 0, spriteWidth, sheet.height);
    }
  }

  void setY(float y) {
    this.y = y;
    top = y - 32;
    bottom = y + 32;
  }

  void update() {
    v += a;
    setY(y+v);
    if (animationFrame < 27)
      animationState = animationFrame++/13;
  }

  void draw() {
    pushMatrix();
    translate(width*0.5, y);
    rotate(radians(v*1.5));
    image(sprites[animationState], 0, 0);
    popMatrix();
  }
}
