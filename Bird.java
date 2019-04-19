import processing.core.*;

public class Bird {
    private PApplet p;
    private PImage[] sprites = new PImage[3];
    private float y, top, bottom, v = 0, a = 0.4f;
    private int animationState = 2, animationFrame = 27;
    public final float left, right;

    public Bird (PApplet p) {
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

    public void update() {
        v += a;
        setY(y+v);
        if (animationFrame < 27)
            animationState = animationFrame++/13;
    }

    public void draw() {
        p.pushMatrix();
        p.translate(p.width*0.5f, y);
        p.rotate(p.radians(v*1.5f));
        p.image(sprites[animationState], 0, 0);
        p.popMatrix();
    }

    private void setY(float y) {
        this.y = y;
        top = y - 32;
        bottom = y + 32;
    }

    public void flap() {
        v = -10.5f;
        animationFrame = 0;
    }

    public void hitFloor() {
        setY(p.height - 32);
    }

    public void hitCeiling() {
        v = 0;
        setY(32);
    }

    public float bottom() {
        return bottom;
    }

    public float top() {
        return top;
    }
}
