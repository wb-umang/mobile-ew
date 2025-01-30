import '/flutter_flow/flutter_flow_util.dart';
import 'change_name_page_widget.dart' show ChangeNamePageWidget;
import 'package:flutter/material.dart';

class ChangeNamePageModel extends FlutterFlowModel<ChangeNamePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
