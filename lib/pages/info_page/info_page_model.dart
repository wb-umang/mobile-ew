import '../../core/widgets/profile_row/profile_row_widget.dart';
import '../../core/widgets/separator_icon/separator_icon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'info_page_widget.dart' show InfoPageWidget;
import 'package:flutter/material.dart';

class InfoPageModel extends FlutterFlowModel<InfoPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ProfileRow component.
  late ProfileRowModel profileRowModel1;
  // Model for SeparatorIcon component.
  late SeparatorIconModel separatorIconModel;
  // Model for ProfileRow component.
  late ProfileRowModel profileRowModel2;

  @override
  void initState(BuildContext context) {
    profileRowModel1 = createModel(context, () => ProfileRowModel());
    separatorIconModel = createModel(context, () => SeparatorIconModel());
    profileRowModel2 = createModel(context, () => ProfileRowModel());
  }

  @override
  void dispose() {
    profileRowModel1.dispose();
    separatorIconModel.dispose();
    profileRowModel2.dispose();
  }
}
