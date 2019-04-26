import processing.core.*;

public class Pipe {
    private FlappyBird p;
    private PShape pipe;
    private final float yMid, v = -6f;
    private float x, left, right;

    public Pipe (FlappyBird p) {
        this.p = p;
        // Start slightly off screen, pipe appears smoothly
        x = p.width + 100;
        yMid = p.random(200, 600);
        pipe = p.createShape(p.GROUP);
        pipe.translate(x, 0.5f*p.height);
    }

    public void update() {
        setX(x+v);
        pipe.translate(v, 0);
    }

    private void setX(float x) {
        this.x = x;
        left = x - 32;
        right = x + 32;
    }

    public void draw() {
        /*
        p.fill(0xff08aa0b);
        p.pushMatrix();
        p.translate(0, -100);
        p.rect(0, 0, 75, 50);
        p.popMatrix();

        p.pushMatrix();
        p.translate(0, 100);
        p.rect(0, 0, 75, 50);
        p.popMatrix();

        p.fill(0xff3bef3f);
        p.pushMatrix();
        p.translate(0, -(yMid+125)/2);
        p.rect(0, 0, 75, 50);
        p.popMatrix();
        */
        p.shape(pipe);
    }

    public float left() {
        return left;
    }

    public float right() {
        return right;
    }
}
