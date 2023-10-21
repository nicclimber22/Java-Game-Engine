class Screen {
  int posX, posY;      // top left corner of screenspace
  PGraphics render;    // image first created in render buffer
  PImage screen;       // then upscaled without smoothing to screen image

  Screen(int renderWidth, int renderHeight, int screenWidth, int screenHeight, int posX, int posY) {
    this.render = createGraphics(renderWidth, renderHeight);
    this.screen = createImage(screenWidth, screenHeight, ARGB);
    this.posX = posX;
    this.posY = posY;
  }

  void show() {
    screen.loadPixels();
    for (int i = 0; i < screen.width; i++) {
      for (int j = 0; j < screen.height; j++) {
        int sbIndex = i + screen.width * j;
        int rbIndex = i * render.width / screen.width + render.width * (j * render.width / screen.width);
        screen.pixels[sbIndex] = render.pixels[rbIndex];
      }
    }
    screen.updatePixels();
    image(screen, posX, posY);
  }

  void drawClear() {
    render.loadPixels();
    for (int i = 0; i < render.pixels.length; i++) {
      render.pixels[i] = 0x00000000;
    }
    render.updatePixels();
  }

  void drawCircle(float x, float y, float r) {
    render.circle(x, y, r);
  }

  void drawRect(float x, float y, float w, float h) {
    render.rect(x, y, w, h);
  }
}
