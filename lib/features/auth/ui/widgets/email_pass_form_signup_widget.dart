import 'package:every_watch/core/utils/app_strings.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class EmailPassFormSignupWidget extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const EmailPassFormSignupWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<EmailPassFormSignupWidget> createState() =>
      _EmailPassFormSignupWidgetState();
}

class _EmailPassFormSignupWidgetState extends State<EmailPassFormSignupWidget> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
              child: Text(
                SignupPageStrings.email,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'DM Sans',
                      color: FlutterFlowTheme.of(context).primary,
                      letterSpacing: 0.12,
                      fontWeight: FontWeight.bold,
                      lineHeight: 1.43,
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: TextFormField(
              controller: widget.emailController,
              autofocus: true,
              textInputAction: TextInputAction.next,
              obscureText: false,
              decoration: InputDecoration(
                labelText: SignupPageStrings.emailExampleLabel,
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
          ),
          Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Text(
                SignupPageStrings.password,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'DM Sans',
                      color: FlutterFlowTheme.of(context).primary,
                      letterSpacing: 0.12,
                      fontWeight: FontWeight.bold,
                      lineHeight: 1.43,
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: TextFormField(
              controller: widget.passwordController,
              autofocus: true,
              textInputAction: TextInputAction.next,
              obscureText: _isObscure,
              decoration: InputDecoration(
                labelText: SignupPageStrings.password,
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
                  onTap: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  child: Icon(
                    size: 16,
                    _isObscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'DM Sans',
                    color: FlutterFlowTheme.of(context).primary,
                    letterSpacing: 0.08,
                    lineHeight: 1.43,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
