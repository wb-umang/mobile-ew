class WatchListingFilterEntity {
  final Map<String, List<String>> filterData;
  final String sortType;
  final String sortColumn;
  final int from;
  final int size;

  WatchListingFilterEntity({
    required this.filterData,
    required this.sortType,
    required this.sortColumn,
    required this.from,
    required this.size,
  });
}
