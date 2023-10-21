Screen screen;
Page pageRoot;

void setup() {
  size(1000, 1000);
  screen = new Screen(200, 200, 800, 800, 100, 100);
  pageRoot = new Page("root", screen);
  pageRoot.addPage(new Page("home", screen));
  pageRoot.getPage("home").addPage(new Page("quit", screen)).addPage(new Page("settings", screen));
  pageRoot.addPage(new Page("game", screen));
  pageRoot.getPage("game").addPage(new Page("quit", screen)).addPage(new Page("settings", screen));

  pageRoot.show();
}

void draw() {
  background(25);
  //pageRoot.show(); //
 


  // renders to screen
  screen.drawClear();
  screen.drawCircle(50, 100 + 50 * sin((frameCount / 40.0) % TAU), 9.8, 12.8, color(100));
  screen.drawRect(70.75 + frameCount / 5., 70, 1, 60, color(200));
  screen.show();
}
