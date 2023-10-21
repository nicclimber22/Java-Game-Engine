class Screen {
  int renderWidth, renderHeight;    // dimension of renderspace
  int screenWidth, screenHeight;    // dimension of screenspace
  int posX, posY;                   // top left corner of screenspace
  color renderPixels[];
  int[] screenToRenderX;
  int[] screenToRenderY;
  PGraphics renderBuffer;          // image first created in render buffer
  PGraphics screenBuffer;          // then upscaled without smoothing to screen buffer

  Screen(int rW, int rH, int sW, int sH, int pX, int pY) {
    renderWidth = rW;
    renderHeight = rH;
    screenWidth = sW;
    screenHeight = sH;
    posX = pX;
    posY = pY;
    renderPixels = new color[renderWidth * renderHeight];
    screenToRenderX = new int[screenWidth];
    for (int i = 0; i < screenWidth; i++) {
      screenToRenderX[i] = i * renderWidth / screenWidth;
    }
    screenToRenderY = new int[screenHeight];
    for (int i = 0; i < screenHeight; i++) {
      screenToRenderY[i] = i * renderHeight / screenHeight;
    }
    drawClear();
  }

  Screen(int rW, int rH) {
    this(rW, rH, width, height, 0, 0);
  }

  void show() {
    colorMode(ARGB);
    loadPixels();
    for (int i = 0; i < screenWidth; i++) {
      for (int j = 0; j < screenHeight; j++) {
        pixels[i + posX + width * (j + posY)] = renderPixels[screenToRenderX[i] + renderWidth * screenToRenderY[j]];
      }
    }
    updatePixels();
  }

  void drawClear() {
    for (int i = 0; i < renderPixels.length; i++) {
      renderPixels[i] = 0xff000000;
    }
  }

  void drawCircle(float x, float y, float r, color c) {
    int i0 = max(floor(x - r), 0);
    int i1 = min(ceil(x + r), renderWidth - 1);
    int j0 = max(floor(y - r), 0);
    int j1 = min(ceil(y + r), renderHeight - 1);
    float r0 = r * r;
    for (int i = i0; i <= i1; i++) {
      float x0 = x - i;
      for (int j = j0; j <= j1; j++) {
        float y0 = y - j;
        if (x0 * x0 + y0 * y0 > r0) {
          continue;
        }
        renderPixels[i + renderWidth * j] = c;
      }
    }
  }

  void drawCircle(float x, float y, float rin, float rout, color c) {
    int i0 = max(floor(x - rout), 0);
    int i1 = min(ceil(x + rout), renderWidth - 1);
    int j0 = max(floor(y - rout), 0);
    int j1 = min(ceil(y + rout), renderHeight - 1);
    float r0 = rin * rin;
    float r1 = rout * rout;
    float x0, y0, dist;
    int i, j;
    for (i = i0; i <= i1; i++) {
      x0 = x - i;
      x0 *= x0;
      for (j = j0; j <= j1; j++) {
        y0 = y - j;
        dist = x0 + y0 * y0;
        if (dist > r1 || dist < r0) {
          continue;
        }
        renderPixels[i + renderWidth * j] = c;
      }
    }
  }

  void drawRect(float x, float y, float w, float h, color c) {
    int i0 = round(x);
    int i1 = round(x + w);
    int j0 = round(y);
    int j1 = round(y + h);
    for (int i = i0; i < i1; i++) {
      for (int j = j0; j < j1; j++) {
        renderPixels[i + renderWidth * j] = c;
      }
    }
  }
}
