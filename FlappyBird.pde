import java.util.*;

private Bird bird;
private Queue<Pipe> pipes = new LinkedList<Pipe>();

void setup() {
  size(700, 800);
  bird = new Bird(this);
  rectMode(CENTER);
  imageMode(CENTER);
}

void draw() {
  background(127);
  text(round(frameRate), 10, 10);

  // Predraw calculations (movement, collision detection, animation)
  bird.update();
  if (frameCount % 75 == 2) {
    if (pipes.size() >= 4)
      pipes.poll();
    pipes.offer(new Pipe(this));
  }
  for(Pipe pipe : pipes)
    pipe.update();

  if (bird.top() <= 0) {
    bird.hitCeiling();
  }

  if (bird.bottom() >= height) {
    //Stop game here
    bird.hitFloor();
    noLoop();
  }

  line(bird.left, bird.top(), bird.right, bird.top());
  line(bird.left, bird.bottom(), bird.right, bird.bottom());
  line(bird.left, bird.top(), bird.left, bird.bottom());
  line(bird.right, bird.top(), bird.right, bird.bottom());


  bird.draw();
  for(Pipe pipe : pipes)
    pipe.draw();
}

void mouseClicked() {
  bird.flap();
}

void keyPressed() {
  bird.flap();
}
