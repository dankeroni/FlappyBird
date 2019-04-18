PImage[] sprites = new PImage[3];
static float gBird = 0.4;
float vBird = 0, yBird;
int animationState = 0, animationStartFrame;

void setup() {
  size(700, 800);
  yBird = height*0.5;
  rectMode(CENTER);
  imageMode(CENTER);
  PImage sheet = loadImage("spritesheet.png");
  int spriteWidth = sheet.width/3;
  for (int i = 0; i < 3; i++) {
    sprites[2-i] = sheet.get(i*spriteWidth, 0, spriteWidth, sheet.height);
  }
}

void draw() {
  background(127);
  text(round(frameRate), 10, 10);

  pushMatrix();
  vBird += gBird;
  yBird += vBird;
  translate(width*0.5, yBird);
  rotate(radians(vBird*1.5));
  image(sprites[animationState], 0, 0);

  if (animationState > 0 && (frameCount-animationStartFrame) % 13 == 0) {
    if (animationState == 2)
      animationState = 0;
    else
      animationState++;
  }

  popMatrix();
}

void mouseClicked() {
  vBird = -10.5;
  animationState = 1;
  animationStartFrame = frameCount;
}

void keyPressed() {
  mouseClicked();
}
