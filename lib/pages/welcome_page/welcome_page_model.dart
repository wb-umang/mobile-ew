import '../../core/widgets/social_login_buttons/social_login_buttons_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'welcome_page_widget.dart' show WelcomePageWidget;
import 'package:flutter/material.dart';

class WelcomePageModel extends FlutterFlowModel<WelcomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SocialLoginButtons component.
  late SocialLoginButtonsModel socialLoginButtonsModel;

  @override
  void initState(BuildContext context) {
    socialLoginButtonsModel =
        createModel(context, () => SocialLoginButtonsModel());
  }

  @override
  void dispose() {
    socialLoginButtonsModel.dispose();
  }
}
