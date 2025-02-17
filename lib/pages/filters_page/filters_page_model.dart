import 'package:every_watch/app_state.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';
import '../../core/widgets/filter_row/filter_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'filters_page_widget.dart' show FiltersPageWidget;
import 'package:flutter/material.dart';

class FiltersPageModel extends FlutterFlowModel<FiltersPageWidget> {
  ///  Local state fields for this page.

  WatchFilterStruct watchFilter = WatchFilterStruct(
      filterData: FFAppState().watchListingFilter.filterData,
      filterOptions: [
        FilterOptionStruct(
            key: "manufacturer",
            value: FilterValueStruct(
                count: 5, search: "", getAll: false, getChild: false)),
        FilterOptionStruct(
            key: "model",
            value: FilterValueStruct(
                count: 5, search: "", getAll: false, getChild: false)),
        FilterOptionStruct(
            key: "referenceNumber",
            value: FilterValueStruct(
                count: 5, search: "", getAll: false, getChild: false)),
        FilterOptionStruct(
            key: "caseSize",
            value: FilterValueStruct(
                count: 5, search: "", getAll: false, getChild: false)),
        FilterOptionStruct(
            key: "caseMaterial",
            value: FilterValueStruct(
                count: 5, search: "", getAll: false, getChild: false)),
        FilterOptionStruct(
            key: "dialColor",
            value: FilterValueStruct(
                count: 5, search: "", getAll: false, getChild: false)),
        FilterOptionStruct(
            key: "movement",
            value: FilterValueStruct(
                count: 5, search: "", getAll: false, getChild: false)),
        FilterOptionStruct(
            key: "braceletMaterial",
            value: FilterValueStruct(
                count: 5, search: "", getAll: false, getChild: false)),
        FilterOptionStruct(
            key: "claspMaterial",
            value: FilterValueStruct(
                count: 5, search: "", getAll: false, getChild: false)),
        FilterOptionStruct(
            key: "infoSource",
            value: FilterValueStruct(
                count: 5, search: "", getAll: false, getChild: false)),
        FilterOptionStruct(
            key: "condition",
            value: FilterValueStruct(
                count: 5, search: "", getAll: false, getChild: false)),
        FilterOptionStruct(
            key: "country",
            value: FilterValueStruct(
                count: 5, search: "", getAll: false, getChild: false))
      ]);
  void updateWatchFilterStruct(Function(WatchFilterStruct) updateFn) {
    updateFn(watchFilter);
  }

  ///  State fields for stateful widgets in this page.

  // Model for FilterRow component.
  late FilterRowModel filterRowModel1;
  // Model for FilterRow component.
  late FilterRowModel filterRowModel2;
  // Model for FilterRow component.
  late FilterRowModel filterRowModel3;
  // Model for FilterRow component.
  late FilterRowModel filterRowModel4;
  // Model for FilterRow component.
  late FilterRowModel filterRowModel5;
  // Model for FilterRow component.
  late FilterRowModel filterRowModel6;
  // Model for FilterRow component.
  late FilterRowModel filterRowModel7;
  // Model for FilterRow component.
  late FilterRowModel filterRowModel8;
  // Model for FilterRow component.
  late FilterRowModel filterRowModel9;
  // Model for FilterRow component.
  late FilterRowModel filterRowModel10;
  // Model for FilterRow component.
  late FilterRowModel filterRowModel11;
  // Model for FilterRow component.
  late FilterRowModel filterRowModel12;

  @override
  void initState(BuildContext context) {
    filterRowModel1 = createModel(context, () => FilterRowModel());
    filterRowModel2 = createModel(context, () => FilterRowModel());
    filterRowModel3 = createModel(context, () => FilterRowModel());
    filterRowModel4 = createModel(context, () => FilterRowModel());
    filterRowModel5 = createModel(context, () => FilterRowModel());
    filterRowModel6 = createModel(context, () => FilterRowModel());
    filterRowModel7 = createModel(context, () => FilterRowModel());
    filterRowModel8 = createModel(context, () => FilterRowModel());
    filterRowModel9 = createModel(context, () => FilterRowModel());
    filterRowModel10 = createModel(context, () => FilterRowModel());
    filterRowModel11 = createModel(context, () => FilterRowModel());
    filterRowModel12 = createModel(context, () => FilterRowModel());
  }

  @override
  void dispose() {
    filterRowModel1.dispose();
    filterRowModel2.dispose();
    filterRowModel3.dispose();
    filterRowModel4.dispose();
    filterRowModel5.dispose();
    filterRowModel6.dispose();
    filterRowModel7.dispose();
    filterRowModel8.dispose();
    filterRowModel9.dispose();
    filterRowModel10.dispose();
    filterRowModel11.dispose();
    filterRowModel12.dispose();
  }
}
