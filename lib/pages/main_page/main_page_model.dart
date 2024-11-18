import 'package:every_watch/backend/schema/structs/search_results_struct.dart';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/icon_button/icon_button_widget.dart';
import '/components/pill_button/pill_button_widget.dart';
import '/components/profile_row/profile_row_widget.dart';
import '/components/search_bar/search_bar_widget.dart';
import '/components/separator_icon/separator_icon_widget.dart';
import '/components/small_arrow_button/small_arrow_button_widget.dart';
import '/components/toggle_button/toggle_button_widget.dart';
import '/components/watch_card/watch_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'main_page_widget.dart' show MainPageWidget;
import 'package:flutter/material.dart';

class MainPageModel extends FlutterFlowModel<MainPageWidget> {
  bool isAvailable = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  late SearchResultsStruct searchResults;

  // Model for SearchBar component.
  late SearchBarModel searchBarModel;
  // Model for IconButton component.
  late IconButtonModel iconButtonModel1;
  // Model for IconButton component.
  late IconButtonModel iconButtonModel2;
  // Model for PillButton component.
  late PillButtonModel pillButtonModel1;
  // Model for ToggleButton component.
  late ToggleButtonModel toggleButtonModel1;
  // Model for ToggleButton component.
  late ToggleButtonModel toggleButtonModel2;
  // Models for WatchCard dynamic component.
  late FlutterFlowDynamicModels<WatchCardModel> watchCardModels1;
  // Model for IconButton component.
  late IconButtonModel iconButtonModel3;
  // Model for IconButton component.
  late IconButtonModel iconButtonModel4;
  // Model for IconButton component.
  late IconButtonModel iconButtonModel5;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Models for WatchCard dynamic component.
  late FlutterFlowDynamicModels<WatchCardModel> watchCardModels2;
  // Model for PillButton component.
  late PillButtonModel pillButtonModel2;
  // Model for ToggleButton component.
  late ToggleButtonModel toggleButtonModel3;
  // Model for SmallArrowButton component.
  late SmallArrowButtonModel smallArrowButtonModel;
  // Model for ProfileRow component.
  late ProfileRowModel profileRowModel1;
  // Model for SeparatorIcon component.
  late SeparatorIconModel separatorIconModel1;
  // Model for ProfileRow component.
  late ProfileRowModel profileRowModel2;
  // Model for SeparatorIcon component.
  late SeparatorIconModel separatorIconModel2;
  // Model for ProfileRow component.
  late ProfileRowModel profileRowModel3;
  // Model for ProfileRow component.
  late ProfileRowModel profileRowModel4;
  // Model for SeparatorIcon component.
  late SeparatorIconModel separatorIconModel3;
  // Model for ProfileRow component.
  late ProfileRowModel profileRowModel5;
  // Model for SeparatorIcon component.
  late SeparatorIconModel separatorIconModel4;
  // Model for ProfileRow component.
  late ProfileRowModel profileRowModel6;
  // Model for SeparatorIcon component.
  late SeparatorIconModel separatorIconModel5;
  // Model for ProfileRow component.
  late ProfileRowModel profileRowModel7;
  // Model for SeparatorIcon component.
  late SeparatorIconModel separatorIconModel6;
  // Model for ProfileRow component.
  late ProfileRowModel profileRowModel8;
  // Model for ProfileRow component.
  late ProfileRowModel profileRowModel9;
  // Model for SeparatorIcon component.
  late SeparatorIconModel separatorIconModel7;
  // Model for ProfileRow component.
  late ProfileRowModel profileRowModel10;

  @override
  void initState(BuildContext context) {
    searchResults = SearchResultsStruct(query: '', includeAllFilters: false);
    searchBarModel = createModel(context, () => SearchBarModel());
    iconButtonModel1 = createModel(context, () => IconButtonModel());
    iconButtonModel2 = createModel(context, () => IconButtonModel());
    pillButtonModel1 = createModel(context, () => PillButtonModel());
    toggleButtonModel1 = createModel(context, () => ToggleButtonModel());
    toggleButtonModel2 = createModel(context, () => ToggleButtonModel());
    watchCardModels1 = FlutterFlowDynamicModels(() => WatchCardModel());
    iconButtonModel3 = createModel(context, () => IconButtonModel());
    iconButtonModel4 = createModel(context, () => IconButtonModel());
    iconButtonModel5 = createModel(context, () => IconButtonModel());
    watchCardModels2 = FlutterFlowDynamicModels(() => WatchCardModel());
    pillButtonModel2 = createModel(context, () => PillButtonModel());
    toggleButtonModel3 = createModel(context, () => ToggleButtonModel());
    smallArrowButtonModel = createModel(context, () => SmallArrowButtonModel());
    profileRowModel1 = createModel(context, () => ProfileRowModel());
    separatorIconModel1 = createModel(context, () => SeparatorIconModel());
    profileRowModel2 = createModel(context, () => ProfileRowModel());
    separatorIconModel2 = createModel(context, () => SeparatorIconModel());
    profileRowModel3 = createModel(context, () => ProfileRowModel());
    profileRowModel4 = createModel(context, () => ProfileRowModel());
    separatorIconModel3 = createModel(context, () => SeparatorIconModel());
    profileRowModel5 = createModel(context, () => ProfileRowModel());
    separatorIconModel4 = createModel(context, () => SeparatorIconModel());
    profileRowModel6 = createModel(context, () => ProfileRowModel());
    separatorIconModel5 = createModel(context, () => SeparatorIconModel());
    profileRowModel7 = createModel(context, () => ProfileRowModel());
    separatorIconModel6 = createModel(context, () => SeparatorIconModel());
    profileRowModel8 = createModel(context, () => ProfileRowModel());
    profileRowModel9 = createModel(context, () => ProfileRowModel());
    separatorIconModel7 = createModel(context, () => SeparatorIconModel());
    profileRowModel10 = createModel(context, () => ProfileRowModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    searchBarModel.dispose();
    iconButtonModel1.dispose();
    iconButtonModel2.dispose();
    pillButtonModel1.dispose();
    toggleButtonModel1.dispose();
    toggleButtonModel2.dispose();
    watchCardModels1.dispose();
    iconButtonModel3.dispose();
    iconButtonModel4.dispose();
    iconButtonModel5.dispose();
    watchCardModels2.dispose();
    pillButtonModel2.dispose();
    toggleButtonModel3.dispose();
    smallArrowButtonModel.dispose();
    profileRowModel1.dispose();
    separatorIconModel1.dispose();
    profileRowModel2.dispose();
    separatorIconModel2.dispose();
    profileRowModel3.dispose();
    profileRowModel4.dispose();
    separatorIconModel3.dispose();
    profileRowModel5.dispose();
    separatorIconModel4.dispose();
    profileRowModel6.dispose();
    separatorIconModel5.dispose();
    profileRowModel7.dispose();
    separatorIconModel6.dispose();
    profileRowModel8.dispose();
    profileRowModel9.dispose();
    separatorIconModel7.dispose();
    profileRowModel10.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
