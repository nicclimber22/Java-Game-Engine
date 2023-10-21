void savePages(Page rootPage) {
  PrintWriter outfile = createWriter(pagesFileName);
  StringList text = rootPage.savePage();
  for (int i = 0; i < text.size(); i++) {
    outfile.println(text.get(i));
  }
  outfile.flush();
  outfile.close();
}

Page loadPages(Page rootPage) {
  BufferedReader infile = createReader(pagesFileName);
  try {
    String line = infile.readLine();
    rootPage = new Page(line, screen);
    Page page = rootPage;
    int depth = 0; // distance from root
    while ((line = infile.readLine()) != null) {
      String[] args = split(line, '\t');
      int newDepth = args.length - 1; // number of .\t before page data
      Page newPage = new Page(args[newDepth], screen);
      if (newDepth > depth) { // page has child
        page.addPage(newPage);
      }
      while (newDepth < depth) { // to add uncle, great uncle ... go back to parent to add sibling
        page = page.parent;
        depth--;
      }
      if (newDepth == depth) { // page has sibling
        page.parent.addPage(newPage);
      }
      depth = newDepth;
      page = newPage;
    }
  }
  catch (IOException e) {
    e.printStackTrace();
  }
  return rootPage;
}
