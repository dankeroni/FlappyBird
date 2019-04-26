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
  fill(0);
  text(round(frameRate), 10, 10);

  // Predraw calculations (movement, collision detection, animation)
  if (frameCount % 75 == 2) {
    if (pipes.size() >= 4)
      pipes.poll();
    pipes.offer(new Pipe(this));
  }
  update(1);

  if (bird.top() <= 0) {
    try {
      update(-bird.top()/bird.v());
    } catch (ArithmeticException e) {}
    bird.hitCeiling();
  }

  if (bird.bottom() >= height) {
    //Stop game here
    try {
      update((height-bird.bottom())/bird.v());
    } catch (ArithmeticException e) {}
    noLoop();
  }

  for(Pipe pipe : pipes)
    pipe.draw();
  bird.draw();

  line(bird.left, bird.top(), bird.right, bird.top());
  line(bird.left, bird.bottom(), bird.right, bird.bottom());
  line(bird.left, bird.top(), bird.left, bird.bottom());
  line(bird.right, bird.top(), bird.right, bird.bottom());
}

void update(float timestep) {
  bird.update(timestep);
  for(Pipe pipe : pipes)
    pipe.update(timestep);
}

void mouseClicked() {
  bird.flap();
}

void keyPressed() {
  bird.flap();
}
