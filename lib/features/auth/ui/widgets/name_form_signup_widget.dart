import 'package:every_watch/core/utils/app_strings.dart';
import 'package:every_watch/features/auth/ui/pages/signup_page/signup_page_model.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:every_watch/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class NameFormSignupWidget extends StatefulWidget {
  final SignupPageModel model;
  const NameFormSignupWidget({super.key, required this.model});

  @override
  State<NameFormSignupWidget> createState() => _NameFormSignupWidgetState();
}

class _NameFormSignupWidgetState extends State<NameFormSignupWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.model.formKey2,
      autovalidateMode: AutovalidateMode.disabled,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        SignupPageStrings.firstName,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'DM Sans',
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.12,
                              fontWeight: FontWeight.bold,
                              lineHeight: 1.43,
                            ),
                      ),
                    ),
                    Container(
                      width: 200.0,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 4.0, 0.0, 0.0),
                        child: TextFormField(
                          controller:
                              widget.model.firstNameTextFieldTextController,
                          focusNode: widget.model.firstNameTextFieldFocusNode,
                          onFieldSubmitted: (_) async {
                            if (widget.model.formKey2.currentState == null ||
                                !widget.model.formKey2.currentState!
                                    .validate()) {
                              return;
                            }
                          },
                          autofocus: true,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: SignupPageStrings.firstNameExample,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  letterSpacing: 0.08,
                                  lineHeight: 1.43,
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'DM Sans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.08,
                                    lineHeight: 1.43,
                                  ),
                          validator: widget
                              .model.firstNameTextFieldTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        SignupPageStrings.lastName,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'DM Sans',
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.12,
                              fontWeight: FontWeight.bold,
                              lineHeight: 1.43,
                            ),
                      ),
                    ),
                    Container(
                      width: 200.0,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 4.0, 0.0, 0.0),
                        child: TextFormField(
                          controller:
                              widget.model.lastNameTextFieldTextController,
                          focusNode: widget.model.lastNameTextFieldFocusNode,
                          onFieldSubmitted: (_) async {
                            if (widget.model.formKey2.currentState == null ||
                                !widget.model.formKey2.currentState!
                                    .validate()) {
                              return;
                            }
                          },
                          autofocus: true,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: SignupPageStrings.lastNameExample,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  letterSpacing: 0.08,
                                  lineHeight: 1.43,
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'DM Sans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.08,
                                    lineHeight: 1.43,
                                  ),
                          validator: widget
                              .model.lastNameTextFieldTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ].divide(const SizedBox(width: 12.0)),
        ),
      ),
    );
  }
}
