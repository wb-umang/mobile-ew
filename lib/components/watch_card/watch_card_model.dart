import '/components/watch_tag/watch_tag_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'watch_card_widget.dart' show WatchCardWidget;
import 'package:flutter/material.dart';

class WatchCardModel extends FlutterFlowModel<WatchCardWidget> {
  ///  Local state fields for this component.

  bool isFollowed = false;

  bool isAuction = true;

  ///  State fields for stateful widgets in this component.

  // Model for WatchTag component.
  late WatchTagModel watchTagModel;

  @override
  void initState(BuildContext context) {
    watchTagModel = createModel(context, () => WatchTagModel());
  }

  @override
  void dispose() {
    watchTagModel.dispose();
  }
}
