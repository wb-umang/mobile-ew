import '/backend/schema/structs/index.dart';
import '/components/search_bar/search_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'all_filters_page_widget.dart' show AllFiltersPageWidget;
import 'package:flutter/material.dart';

class AllFiltersPageModel extends FlutterFlowModel<AllFiltersPageWidget> {
  ///  Local state fields for this page.

  late WatchFilterStruct? watchFilter;
  void updateWatchFilterStruct(Function(WatchFilterStruct) updateFn) {
    updateFn(watchFilter ??= WatchFilterStruct());
  }

  String keyName;
  String searchQuery = '';
  AllFiltersPageModel({
    required this.keyName,
  });

  ///  State fields for stateful widgets in this page.

  // Model for SearchBar component.
  late SearchBarModel searchBarModel;

  @override
  void initState(BuildContext context) {
    searchBarModel = createModel(context, () => SearchBarModel());
    watchFilter = WatchFilterStruct(
        filterData: FFAppState().watchListingFilter.filterData,
        filterOptions: [
          FilterOptionStruct(
              key: keyName,
              value: FilterValueStruct(
                  count: 1000,
                  search: searchQuery,
                  getAll: false,
                  getChild: false)),
        ]);
  }

  @override
  void dispose() {
    searchBarModel.dispose();
  }
}
