import '../toggle_button/toggle_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'filter_row_widget.dart' show FilterRowWidget;
import 'package:flutter/material.dart';

class FilterRowModel extends FlutterFlowModel<FilterRowWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for ToggleButton dynamic component.
  late FlutterFlowDynamicModels<ToggleButtonModel> toggleButtonModels;

  @override
  void initState(BuildContext context) {
    toggleButtonModels = FlutterFlowDynamicModels(() => ToggleButtonModel());
  }

  @override
  void dispose() {
    toggleButtonModels.dispose();
  }
}
