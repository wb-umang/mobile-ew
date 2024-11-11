// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchFilterStruct extends BaseStruct {
  WatchFilterStruct({
    FilterDataStruct? filterData,
    List<FilterOptionStruct>? filterOptions,
  })  : _filterData = filterData,
        _filterOptions = filterOptions;

  // "filterData" field.
  FilterDataStruct? _filterData;
  FilterDataStruct get filterData => _filterData ?? FilterDataStruct();
  set filterData(FilterDataStruct? val) => _filterData = val;

  void updateFilterData(Function(FilterDataStruct) updateFn) {
    updateFn(_filterData ??= FilterDataStruct());
  }

  bool hasFilterData() => _filterData != null;

  // "filterOptions" field.
  List<FilterOptionStruct>? _filterOptions;
  List<FilterOptionStruct> get filterOptions => _filterOptions ?? const [];
  set filterOptions(List<FilterOptionStruct>? val) => _filterOptions = val;

  void updateFilterOptions(Function(List<FilterOptionStruct>) updateFn) {
    updateFn(_filterOptions ??= []);
  }

  bool hasFilterOptions() => _filterOptions != null;

  static WatchFilterStruct fromMap(Map<String, dynamic> data) =>
      WatchFilterStruct(
        filterData: FilterDataStruct.maybeFromMap(data['filterData']),
        filterOptions: getStructList(
          data['filterOptions'],
          FilterOptionStruct.fromMap,
        ),
      );

  static WatchFilterStruct? maybeFromMap(dynamic data) => data is Map
      ? WatchFilterStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'filterData': _filterData?.toMap(),
        'filterOptions': _filterOptions?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'filterData': serializeParam(
          _filterData,
          ParamType.DataStruct,
        ),
        'filterOptions': serializeParam(
          _filterOptions,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static WatchFilterStruct fromSerializableMap(Map<String, dynamic> data) =>
      WatchFilterStruct(
        filterData: deserializeStructParam(
          data['filterData'],
          ParamType.DataStruct,
          false,
          structBuilder: FilterDataStruct.fromSerializableMap,
        ),
        filterOptions: deserializeStructParam<FilterOptionStruct>(
          data['filterOptions'],
          ParamType.DataStruct,
          true,
          structBuilder: FilterOptionStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WatchFilterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WatchFilterStruct &&
        filterData == other.filterData &&
        listEquality.equals(filterOptions, other.filterOptions);
  }

  @override
  int get hashCode => const ListEquality().hash([filterData, filterOptions]);
}

WatchFilterStruct createWatchFilterStruct({
  FilterDataStruct? filterData,
}) =>
    WatchFilterStruct(
      filterData: filterData ?? FilterDataStruct(),
    );
