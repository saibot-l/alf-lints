class CallOnce {
  bool called = false;

  void call(Function fn) {
    if (called) return;

    called = true;
    fn();
  }
}
