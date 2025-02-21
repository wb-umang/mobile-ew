import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PasswordFieldLoginWidget extends StatefulWidget {
  final TextEditingController passwordController;
  const PasswordFieldLoginWidget({super.key, required this.passwordController});

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

    widget.passwordController.text = passwordText;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
      child: TextFormField(
        controller: widget.passwordController,
        autofocus: false,
        textInputAction: TextInputAction.next,
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
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'DM Sans',
              color: FlutterFlowTheme.of(context).primary,
              letterSpacing: 0.08,
              lineHeight: 1.43,
            ),
      ),
    );
  }
}
