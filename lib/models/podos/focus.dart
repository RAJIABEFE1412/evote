class FocusState {
  bool hasText;
  bool isFocused;
  bool hasError;
  String error;

  FocusState({
    this.hasText = false,
    this.isFocused = false,
    this.hasError = false,
    this.error = "",
  });

  bool operator ==(other) {
    return (other is FocusState) &&
        (other.isFocused == isFocused &&
            other.hasText == hasText &&
            other.hasError == hasError &&
            other.error == error);
  }

  @override
  int get hashCode => super.hashCode;
}
