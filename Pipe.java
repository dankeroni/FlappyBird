import processing.core.*;

public class Pipe {
    private FlappyBird p;
    private PShape pipe;
    private final float yMid, v = -6f;
    private float x, left, right;
    public final float top, bottom;

    public Pipe (FlappyBird p) {
        this.p = p;
        // Start slightly off screen, pipe appears smoothly
        setX(p.width + 100);
        yMid = p.random(200, 600);
        top = yMid + 75;
        bottom = yMid - 75;
        pipe = p.createShape(p.GROUP);

        PShape topEnd = p.createShape(p.RECT, 0, -100, 78, 50);
        topEnd.setFill(0xff609b29);
        pipe.addChild(topEnd);
        PShape top = p.createShape(p.RECT, 0, -(yMid+125)/2, 70, yMid-125);
        top.setFill(0xff74bf2e);
        pipe.addChild(top);
        PShape bottomEnd = p.createShape(p.RECT, 0, 100, 78, 50);
        bottomEnd.setFill(0xff609b29);
        pipe.addChild(bottomEnd);
        PShape bottom = p.createShape(p.RECT, 0, (p.height-yMid+125)/2, 70, p.height-(yMid+125));
        bottom.setFill(0xff74bf2e);
        pipe.addChild(bottom);
        pipe.translate(x, yMid);
    }

    public void update(float timestep) {
        setX(x+v*timestep);
        pipe.translate(v*timestep, 0);
    }

    private void setX(float x) {
        this.x = x;
        left = x - 32;
        right = x + 32;
    }

    public void draw() {
        p.shape(pipe);
    }

    public float left() {
        return left;
    }

    public float right() {
        return right;
    }
}
