import processing.core.*;

public class Pipe {
    private FlappyBird p;
    private final float yMid, v = -6f;
    private float x;

    public Pipe (FlappyBird p) {
        this.p = p;
        // Start slightly off screen, pipe appears smoothly
        x = p.width + 100;
        yMid = p.random(200, 600);
    }

    public void update() {
        x += v;
    }

    public void draw() {
        p.pushMatrix();
        p.translate(x, yMid);
        p.rect(0, 0, 50, 200);
        p.popMatrix();
    }
}
