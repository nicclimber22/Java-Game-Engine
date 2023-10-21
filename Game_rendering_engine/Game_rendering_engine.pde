Screen screen;
Page pageRoot;

String pagesFileName = "pages.txt";

void setup() {
  size(1000, 1000);
  frameRate(120);
  screen = new Screen(200, 200, 800, 800, 100, 100);
  pageRoot = new Page("root", screen);
  pageRoot.addPage(new Page("home", screen));
  pageRoot.getPage("home").addPage(new Page("quit", screen)).addPage(new Page("settings", screen));
  pageRoot.addPage(new Page("game", screen));
  pageRoot.getPage("game").addPage(new Page("quit", screen)).addPage(new Page("settings", screen));
  pageRoot.show();
  savePages(pageRoot);
}

float theta = 0;
void draw() {
  background(25);
  //pageRoot.show(); //
  theta = theta + 1/frameRate;
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
