Screen screen;
Page pageRoot;

String pagesFileName = "pages.txt";

void setup() {
  size(1000, 1000);
  frameRate(120);
  screen = new Screen(200, 200, 800, 800, 100, 100);
  pageRoot = loadPages(pageRoot); // idk this works but it does and dont fuck with it 
  pageRoot.visable = true;
  pageRoot.show();
  savePages(pageRoot);
}

float theta = 0;
void draw() {
  background(25);
  //pageRoot.show(); //
  theta = theta + 2 / frameRate;
  theta = theta % TAU;


  // renders to screen
  screen.render.noStroke();
  screen.render.colorMode(ARGB);
  screen.render.beginDraw();
  screen.drawClear();
  screen.drawCircle(50, 100 + 50 * sin(theta), 16);
  screen.drawRect(70.75 + 10 * cos(theta), 70, .125, 60);
  screen.render.endDraw();
  screen.show();
}
