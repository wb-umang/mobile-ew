import '/backend/api_requests/api_calls.dart';
import '../../core/widgets/arrow_button/arrow_button_widget.dart';
import '../../core/widgets/invite_field/invite_field_widget.dart';
import '../../core/widgets/social_login_buttons/social_login_buttons_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'register_page_widget.dart' show RegisterPageWidget;
import 'package:flutter/material.dart';

class RegisterPageModel extends FlutterFlowModel<RegisterPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for FirstNameTextField widget.
  FocusNode? firstNameTextFieldFocusNode;
  TextEditingController? firstNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      firstNameTextFieldTextControllerValidator;
  String? _firstNameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please provide your first name';
    }

    if (val.isEmpty) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for LastNameTextField widget.
  FocusNode? lastNameTextFieldFocusNode;
  TextEditingController? lastNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      lastNameTextFieldTextControllerValidator;
  String? _lastNameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please provide your last name';
    }

    if (val.isEmpty) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

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
      return 'Has to be a valid email address.';
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

  // Model for InviteField component.
  late InviteFieldModel inviteFieldModel;
  // Stores action output result for [Backend Call - API (registerUser)] action in Button widget.
  ApiCallResponse? registerResult;
  // Model for ArrowButton component.
  late ArrowButtonModel arrowButtonModel;
  // Model for SocialLoginButtons component.
  late SocialLoginButtonsModel socialLoginButtonsModel;

  @override
  void initState(BuildContext context) {
    firstNameTextFieldTextControllerValidator =
        _firstNameTextFieldTextControllerValidator;
    lastNameTextFieldTextControllerValidator =
        _lastNameTextFieldTextControllerValidator;
    emailTextFieldTextControllerValidator =
        _emailTextFieldTextControllerValidator;
    passwordTextFieldVisibility = false;
    passwordTextFieldTextControllerValidator =
        _passwordTextFieldTextControllerValidator;
    inviteFieldModel = createModel(context, () => InviteFieldModel());
    arrowButtonModel = createModel(context, () => ArrowButtonModel());
    socialLoginButtonsModel =
        createModel(context, () => SocialLoginButtonsModel());
  }

  @override
  void dispose() {
    firstNameTextFieldFocusNode?.dispose();
    firstNameTextFieldTextController?.dispose();

    lastNameTextFieldFocusNode?.dispose();
    lastNameTextFieldTextController?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldTextController?.dispose();

    inviteFieldModel.dispose();
    arrowButtonModel.dispose();
    socialLoginButtonsModel.dispose();
  }
}
