static class KeyManager {

  // normal keys
  static boolean keyStates[] = new boolean[255];
  static boolean keyStatesToggle[] = new boolean[255];
  // special keys
  static boolean keyCodeStates[] = new boolean[255];
  static boolean keyCodeStatesToggle[] = new boolean[255];

}

void keyPressed() {
  if (key < 256) { // normal key
    KeyManager.keyStates[key] = true;
    KeyManager.keyStatesToggle[key] = !KeyManager.keyStatesToggle[key];
  } else {
    KeyManager.keyCodeStates[keyCode] = true;
    KeyManager.keyCodeStatesToggle[keyCode] = !KeyManager.keyCodeStatesToggle[keyCode];
  }
}

void keyReleased() {
  if (key < 256) { // normal key
    KeyManager.keyStates[key] = false;
  } else {
    KeyManager.keyCodeStates[keyCode] = false;
  }
}
