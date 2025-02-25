class ImageSearchState {
  final bool flag;
  final String searchText;

  ImageSearchState({
    required this.flag,
    required this.searchText,
  });

  // Create a copyWith method for immutability
  ImageSearchState copyWith({bool? flag, String? searchText}) {
    return ImageSearchState(
      flag: flag ?? this.flag,
      searchText: searchText ?? this.searchText,
    );
  }
}
