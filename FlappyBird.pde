PImage[] sprites = new PImage[3];
static float g = 0.4;
float v = 0, birdY;

void setup() {
  size(700, 800);
  birdY = height*0.5;
  rectMode(CENTER);
  imageMode(CENTER);
  PImage sheet = loadImage("spritesheet.png");
  int spriteWidth = sheet.width/3;
  for (int i = 0; i < 3; i++) {
    sprites[i] = sheet.get(i*spriteWidth, 0, spriteWidth, sheet.height);
  }
}

void draw() {
  background(127);
  text(round(frameRate), 10, 10);

  pushMatrix();
  v += g;
  birdY += v;
  translate(width*0.5, birdY);
  image(sprites[0], 0, 0);
  popMatrix();
}

void mouseClicked() {
  v = -10.5;
}

void keyPressed() {
  v = -10.5;
}
