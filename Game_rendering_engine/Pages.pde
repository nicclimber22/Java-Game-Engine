class Page {

  Screen screen;

  ArrayList<Page> subPages;
  boolean visable; // true if page is rendering to screen
  String name = "";

  Page(String name, Screen screen) {
    this.name = name;
    this.screen = screen;
    this.subPages = new ArrayList<Page>(0);
    this.visable = true;
  }

  Page addPage(Page page) {
    this.subPages.add(page);
    return this;
  }

  Page getPage(String target) {
    Page currentPage;
    for (int i = 0; i < subPages.size(); i++) {
      currentPage = this.subPages.get(i);
      if (currentPage.name == target) {
        return currentPage;
      }
    }
    return null;
  }

  void show() {
    if (!this.visable) {
      return;
    }
    // show page to screen here
    println("showing page:", this.name);
    // show page to screen here
    for (int i = 0; i < subPages.size(); i++) {
      subPages.get(i).show();
    }
  }
}
