import 'package:every_watch/features/auth/ui/pages/login_page/login_page_model.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:every_watch/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PasswordFieldLoginWidget extends StatefulWidget {
  final LoginPageModel model;

  const PasswordFieldLoginWidget({super.key, required this.model});

  @override
  State<PasswordFieldLoginWidget> createState() =>
      _PasswordFieldLoginWidgetState();
}

class _PasswordFieldLoginWidgetState extends State<PasswordFieldLoginWidget> {
  @override
  void initState() {
    var passwordText = '';
    if (kDebugMode) {
      passwordText = '1234567';
    }

    widget.model.passwordTextFieldTextController ??=
        TextEditingController(text: passwordText);
    widget.model.passwordTextFieldFocusNode ??= FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
      child: TextFormField(
        controller: widget.model.passwordTextFieldTextController,
        focusNode: widget.model.passwordTextFieldFocusNode,
        onFieldSubmitted: (_) async {
          if (widget.model.formKey.currentState == null ||
              !widget.model.formKey.currentState!.validate()) {
            return;
          }
        },
        autofocus: false,
        textInputAction: TextInputAction.next,
        obscureText: !widget.model.passwordTextFieldVisibility,
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'DM Sans',
                color: FlutterFlowTheme.of(context).alternate,
                letterSpacing: 0.08,
                lineHeight: 1.43,
              ),
          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'DM Sans',
                letterSpacing: 0.0,
              ),
          errorStyle: FlutterFlowTheme.of(context).labelSmall.override(
                fontFamily: 'DM Sans',
                color: FlutterFlowTheme.of(context).error,
                letterSpacing: 0.08,
                lineHeight: 1.43,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).border,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primary,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          suffixIcon: InkWell(
            onTap: () => safeSetState(
              () => widget.model.passwordTextFieldVisibility =
                  widget.model.passwordTextFieldVisibility,
            ),
            focusNode: FocusNode(skipTraversal: true),
            child: Icon(
              widget.model.passwordTextFieldVisibility
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: FlutterFlowTheme.of(context).secondary,
              size: 16.0,
            ),
          ),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'DM Sans',
              color: FlutterFlowTheme.of(context).primary,
              letterSpacing: 0.08,
              lineHeight: 1.43,
            ),
        validator: widget.model.passwordTextFieldTextControllerValidator
            .asValidator(context),
      ),
    );
  }
}
