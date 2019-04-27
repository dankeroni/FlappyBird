import java.util.*;

private Bird bird;
private LinkedList<Pipe> pipes;
private int score;
private boolean running = false;

void setup() {
  size(700, 800);
  rectMode(CENTER);
  imageMode(CENTER);
  shapeMode(CENTER);
  textAlign(CENTER, CENTER);
  reset();
}

void draw() {
  background(0xff4cbcfc);

  // Predraw calculations (movement, collision detection, animation)
  if (bird.alive()&&frameCount % 90 == 1) {
    if (pipes.size() >= 2)
      pipes.remove();
    pipes.add(new Pipe(this));
    score++;
  }
  update(1);

  if (bird.top() <= 0) {
    update((bird.v()+sqrt(sq(bird.v())+2*bird.a*bird.top()))/bird.a);
    bird.hitCeiling();
  }

  if (bird.bottom() >= height) {
    //Stop game here
    update((bird.v()-sqrt(sq(bird.v())+2*bird.a*(bird.bottom()-height)))/bird.a);
    running = false;
    noLoop();
  }

  Pipe p = pipes.getLast();
  if(bird.alive()&&!(bird.left>p.right()||bird.right<p.left()||bird.top()>p.bottom&&bird.bottom()<p.top)) {
    update(max(new float[]{
          //Bird hits left side of pipe
          (bird.right-p.left())/p.v(),
          //Bird hits top side of pipe
          -abs((bird.v()-sqrt(sq(bird.v())+2*bird.a*(bird.bottom()-p.top)))/bird.a),
          //Bird hits bottom side of pipe
          -abs((bird.v()+sqrt(sq(bird.v())+2*bird.a*(bird.top()-p.bottom)))/bird.a)
          }));
    bird.hitPipe();
    for(Pipe pipe : pipes)
      pipe.stop();
  }

  for(Pipe pipe : pipes)
    pipe.draw();
  bird.draw();

  fill(0);
  text(round(frameRate), 10, 6);
  text(score-1, width*0.5, height*0.9);
}

void update(float timestep) {
  bird.update(timestep);
  for(Pipe pipe : pipes)
    pipe.update(timestep);
}

void reset() {
  if (running) return;
  score = 0;
  bird = new Bird(this);
  pipes = new LinkedList<Pipe>();
  frameCount = 0;
  running = true;
  loop();
}

void mouseClicked() {
  keyPressed();
}

void keyPressed() {
  if (running)
    bird.flap();
  else
    reset();
}
