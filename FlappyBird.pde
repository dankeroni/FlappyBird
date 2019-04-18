PImage[] sprites = new PImage[3];
static float gBird = 0.4;
float vBird = 0, yBird;
int animationState = 0, animationFrame = 27;

void setup() {
  size(700, 800);
  yBird = height*0.5;
  rectMode(CENTER);
  imageMode(CENTER);

  // Sprites loading
  PImage sheet = loadImage("spritesheet.png");
  int spriteWidth = sheet.width/3;
  for (int i = 0; i < 3; i++) {
    sprites[i] = sheet.get(i*spriteWidth, 0, spriteWidth, sheet.height);
  }
}

void draw() {
  background(127);
  text(round(frameRate), 10, 10);

  // Predraw calculations (collision detection, animationState)
  vBird += gBird;
  yBird += vBird;
  if (animationFrame < 27)
    animationState = animationFrame++/13;

  pushMatrix();
  translate(width*0.5, yBird);
  rotate(radians(vBird*1.5));
  image(sprites[animationState], 0, 0);
  popMatrix();
}

void mouseClicked() {
  vBird = -10.5;
  animationFrame = 0;
}

void keyPressed() {
  mouseClicked();
}
