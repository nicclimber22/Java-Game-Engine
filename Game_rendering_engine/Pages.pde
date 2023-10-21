class Page {

  Screen screen;
  Page parent;
  ArrayList<Page> children;
  boolean visable; // true if page is rendering to screen
  String name;

  Page(String name, Screen screen) {
    this.name = name;
    this.screen = screen;
    this.children = new ArrayList<Page>(0);
    this.visable = true;
  }

  Page addPage(Page page) {
    this.children.add(page); // adds subpage and sets parent to this
    page.parent = this;
    return this;
  }

  Page getPage(String target) {
    Page currentPage;
    for (int i = 0; i < children.size(); i++) {
      currentPage = this.children.get(i);
      if (currentPage.name == target) {
        return currentPage;
      }
    }
    return null;
  }

  Page show() {
    if (!this.visable) {
      return this;
    }
    // show page to screen here
    println("showing page:", this.name);
    // show page to screen here
    for (int i = 0; i < children.size(); i++) {
      children.get(i).show();
    }
    return this;
  }

  String savePage() { // returns name and name of children for saving to file
    String text = this.name;
    
    return text;
  }
}
