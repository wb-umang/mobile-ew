import '/components/referral_dialog/referral_dialog_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'referral_page_widget.dart' show ReferralPageWidget;
import 'package:flutter/material.dart';

class ReferralPageModel extends FlutterFlowModel<ReferralPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ReferralDialog component.
  late ReferralDialogModel referralDialogModel;

  @override
  void initState(BuildContext context) {
    referralDialogModel = createModel(context, () => ReferralDialogModel());
  }

  @override
  void dispose() {
    referralDialogModel.dispose();
  }
}
