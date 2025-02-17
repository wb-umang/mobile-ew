import 'package:every_watch/core/utils/app_strings.dart';
import 'package:every_watch/features/auth/ui/widgets/model/signup_page_model.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:every_watch/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class EmailPassFormSignupWidget extends StatefulWidget {
  final SignupPageModel model;
  const EmailPassFormSignupWidget({super.key, required this.model});

  @override
  State<EmailPassFormSignupWidget> createState() =>
      _EmailPassFormSignupWidgetState();
}

class _EmailPassFormSignupWidgetState extends State<EmailPassFormSignupWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.model.formKey1,
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
              controller: widget.model.emailTextFieldTextController,
              focusNode: widget.model.emailTextFieldFocusNode,
              onFieldSubmitted: (_) async {
                if (widget.model.formKey1.currentState == null ||
                    !widget.model.formKey1.currentState!.validate()) {
                  return;
                }
              },
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
              validator: widget.model.emailTextFieldTextControllerValidator
                  .asValidator(context),
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
              controller: widget.model.passwordTextFieldTextController,
              focusNode: widget.model.passwordTextFieldFocusNode,
              onFieldSubmitted: (_) async {
                if (widget.model.formKey1.currentState == null ||
                    !widget.model.formKey1.currentState!.validate()) {
                  return;
                }
              },
              autofocus: true,
              textInputAction: TextInputAction.next,
              obscureText: !widget.model.passwordTextFieldVisibility,
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
                  onTap: () => safeSetState(
                    () => widget.model.passwordTextFieldVisibility =
                        !widget.model.passwordTextFieldVisibility,
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
          ),
        ],
      ),
    );
  }
}
