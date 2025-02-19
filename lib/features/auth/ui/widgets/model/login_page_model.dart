import 'package:every_watch/core/widgets/arrow_button/arrow_button_model.dart';
import 'package:every_watch/features/auth/ui/pages/login_page.dart';
import 'package:every_watch/features/auth/ui/widgets/model/social_logins_model.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPage> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  String? _emailTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please provide your email';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Please provide your email';
    }
    return null;
  }

  // State field(s) for PasswordTextField widget.
  FocusNode? passwordTextFieldFocusNode;
  TextEditingController? passwordTextFieldTextController;
  late bool passwordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      passwordTextFieldTextControllerValidator;
  String? _passwordTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please provide your password';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (loginUser)] action in Button widget.
  ApiCallResponse? loginResult;
  // Model for ArrowButton component.
  late ArrowButtonModel arrowButtonModel;
  // Model for SocialLoginButtons component.
  late SocialLoginsModel socialLoginsModel;

  @override
  void initState(BuildContext context) {
    emailTextFieldTextControllerValidator =
        _emailTextFieldTextControllerValidator;
    passwordTextFieldVisibility = false;
    passwordTextFieldTextControllerValidator =
        _passwordTextFieldTextControllerValidator;
    arrowButtonModel = createModel(context, () => ArrowButtonModel());
    socialLoginsModel = createModel(context, () => SocialLoginsModel());
  }

  @override
  void dispose() {
    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldTextController?.dispose();

    arrowButtonModel.dispose();
    socialLoginsModel.dispose();
  }
}
