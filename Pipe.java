import processing.core.*;

public class Pipe {
    private PApplet p;
    private final float yMid, v = -6f;
    private float x;

    public Pipe (PApplet p) {
        this.p = p;
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
