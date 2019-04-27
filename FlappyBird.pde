import java.util.*;

private Bird bird;
private Queue<Pipe> pipes = new LinkedList<Pipe>();

void setup() {
  size(700, 800);
  bird = new Bird(this);
  rectMode(CENTER);
  imageMode(CENTER);
  shapeMode(CENTER);
}

void draw() {
  background(0xff4cbcfc);

  // Predraw calculations (movement, collision detection, animation)
  if (frameCount % 75 == 2) {
    if (pipes.size() >= 4)
      pipes.poll();
    pipes.offer(new Pipe(this));
  }
  update(1);

  if (bird.top() <= 0) {
    update((bird.v()+sqrt(sq(bird.v())+2*bird.a*bird.top()))/bird.a);
    bird.hitCeiling();
  }

  if (bird.bottom() >= height) {
    //Stop game here
    update((bird.v()-sqrt(sq(bird.v())+2*bird.a*(bird.bottom()-height)))/bird.a);
    noLoop();
  }

  for(Pipe pipe : pipes)
    pipe.draw();
  bird.draw();

  line(bird.left, bird.top(), bird.right, bird.top());
  line(bird.left, bird.bottom(), bird.right, bird.bottom());
  line(bird.left, bird.top(), bird.left, bird.bottom());
  line(bird.right, bird.top(), bird.right, bird.bottom());
  fill(0);
  text(round(frameRate), 10, 10);
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
