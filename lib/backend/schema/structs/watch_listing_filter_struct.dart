// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchListingFilterStruct extends BaseStruct {
  WatchListingFilterStruct({
    FilterDataStruct? filterData,
    String? sortType,
    String? sortColumn,
    int? from,
    int? size,
  })  : _filterData = filterData,
        _sortType = sortType,
        _sortColumn = sortColumn,
        _from = from,
        _size = size;

  // "filterData" field.
  FilterDataStruct? _filterData;
  FilterDataStruct get filterData => _filterData ?? FilterDataStruct();
  set filterData(FilterDataStruct? val) => _filterData = val;

  void updateFilterData(Function(FilterDataStruct) updateFn) {
    updateFn(_filterData ??= FilterDataStruct());
  }

  bool hasFilterData() => _filterData != null;

  // "sortType" field.
  String? _sortType;
  String get sortType => _sortType ?? 'asc';
  set sortType(String? val) => _sortType = val;

  bool hasSortType() => _sortType != null;

  // "sortColumn" field.
  String? _sortColumn;
  String get sortColumn => _sortColumn ?? 'relevance';
  set sortColumn(String? val) => _sortColumn = val;

  bool hasSortColumn() => _sortColumn != null;

  // "from" field.
  int? _from;
  int get from => _from ?? 0;
  set from(int? val) => _from = val;

  void incrementFrom(int amount) => from = from + amount;

  bool hasFrom() => _from != null;

  // "size" field.
  int? _size;
  int get size => _size ?? 30;
  set size(int? val) => _size = val;

  void incrementSize(int amount) => size = size + amount;

  bool hasSize() => _size != null;

  static WatchListingFilterStruct fromMap(Map<String, dynamic> data) =>
      WatchListingFilterStruct(
        filterData: FilterDataStruct.maybeFromMap(data['filterData']),
        sortType: data['sortType'] as String?,
        sortColumn: data['sortColumn'] as String?,
        from: castToType<int>(data['from']),
        size: castToType<int>(data['size']),
      );

  static WatchListingFilterStruct? maybeFromMap(dynamic data) => data is Map
      ? WatchListingFilterStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'filterData': _filterData?.toMap(),
        'sortType': _sortType,
        'sortColumn': _sortColumn,
        'from': _from,
        'size': _size,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'filterData': serializeParam(
          _filterData,
          ParamType.DataStruct,
        ),
        'sortType': serializeParam(
          _sortType,
          ParamType.String,
        ),
        'sortColumn': serializeParam(
          _sortColumn,
          ParamType.String,
        ),
        'from': serializeParam(
          _from,
          ParamType.int,
        ),
        'size': serializeParam(
          _size,
          ParamType.int,
        ),
      }.withoutNulls;

  static WatchListingFilterStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WatchListingFilterStruct(
        filterData: deserializeStructParam(
          data['filterData'],
          ParamType.DataStruct,
          false,
          structBuilder: FilterDataStruct.fromSerializableMap,
        ),
        sortType: deserializeParam(
          data['sortType'],
          ParamType.String,
          false,
        ),
        sortColumn: deserializeParam(
          data['sortColumn'],
          ParamType.String,
          false,
        ),
        from: deserializeParam(
          data['from'],
          ParamType.int,
          false,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'WatchListingFilterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WatchListingFilterStruct &&
        filterData == other.filterData &&
        sortType == other.sortType &&
        sortColumn == other.sortColumn &&
        from == other.from &&
        size == other.size;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([filterData, sortType, sortColumn, from, size]);
}

WatchListingFilterStruct createWatchListingFilterStruct({
  FilterDataStruct? filterData,
  String? sortType,
  String? sortColumn,
  int? from,
  int? size,
}) =>
    WatchListingFilterStruct(
      filterData: filterData ?? FilterDataStruct(),
      sortType: sortType,
      sortColumn: sortColumn,
      from: from,
      size: size,
    );
