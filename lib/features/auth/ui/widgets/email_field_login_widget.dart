import 'package:easy_debounce/easy_debounce.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EmailFieldLoginWidget extends StatefulWidget {
  final TextEditingController emailController;
  const EmailFieldLoginWidget({
    super.key,
    required this.emailController,
  });

  @override
  State<EmailFieldLoginWidget> createState() => _EmailFieldLoginWidgetState();
}

class _EmailFieldLoginWidgetState extends State<EmailFieldLoginWidget> {
  @override
  void initState() {
    var emailText = '';
    if (kDebugMode) {
      emailText = 'yash@everywatch.com';
    }
    widget.emailController.text = emailText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
      child: TextFormField(
        controller: widget.emailController,
        onChanged: (_) => EasyDebounce.debounce(
            'emailController', const Duration(milliseconds: 2000), () => {}),
        autofocus: true,
        autofillHints: const [AutofillHints.email],
        textInputAction: TextInputAction.next,
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'e.g. johndawny@company.com',
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
          suffixIcon: widget.emailController.text.isNotEmpty
              ? InkWell(
                  onTap: () async {
                    widget.emailController.clear();
                  },
                  child: Icon(
                    Icons.clear,
                    color: FlutterFlowTheme.of(context).secondary,
                    size: 16.0,
                  ),
                )
              : null,
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'DM Sans',
              color: FlutterFlowTheme.of(context).primary,
              letterSpacing: 0.08,
              lineHeight: 1.43,
            ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
