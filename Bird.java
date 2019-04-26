import processing.core.*;

public class Bird {
    private FlappyBird p;
    private PImage[] sprites = new PImage[3];
    private float y, top, bottom, v = 0, a = 0.5f;
    private int animationState = 2, animationFrame = 27;
    public final float left, right;

    public Bird (FlappyBird p) {
        this.p = p;
        left = p.width*0.5f - 32;
        right = p.width*0.5f + 32;
        setY(p.height*0.5f);

        // Sprites loading
        PImage sheet = p.loadImage("spritesheet.png");
        int spriteWidth = sheet.width/3;
        for (int i = 0; i < 3; i++) {
            sprites[i] = sheet.get(i*spriteWidth, 0, spriteWidth, sheet.height);
        }
    }

    public void update(float timestep) {
        v += a*timestep;
        setY(y+v*timestep);
        // Maybe we should calculate this from velocity
        // 0-12 => 0, 13-25 => 1, 26 => 2
        if (animationFrame < 27)
            animationState = animationFrame++/13;
    }

    public void draw() {
        p.pushMatrix();
        p.translate(p.width*0.5f, y);
        // Bird's tilt is based on its velocity
        p.rotate(p.radians(v*1.5f));
        p.image(sprites[animationState], 0, 0);
        p.popMatrix();
    }

    private void setY(float y) {
        this.y = y;
        top = y - 32;
        bottom = y + 32;
    }

    // Start animation and moving upward
    public void flap() {
        v = -10.5f;
        animationFrame = 0;
    }

    public void hitCeiling() {
        v = 0;
    }

    public float bottom() {
        return bottom;
    }

    public float top() {
        return top;
    }

    public float v() {
        return v;
    }
}
