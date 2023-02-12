class SelectionData<T> {
  T? selection;
  String? title;
  String? description;

  SelectionData(
      {required this.selection, required this.title, this.description})
      : assert(selection != null),
        assert(title != null);
}
