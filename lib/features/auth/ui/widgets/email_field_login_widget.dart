import 'package:easy_debounce/easy_debounce.dart';
import 'package:every_watch/features/auth/ui/widgets/model/login_page_model.dart';
import 'package:every_watch/flutter_flow/flutter_flow_model.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EmailFieldLoginWidget extends StatefulWidget {
  final LoginPageModel model;
  const EmailFieldLoginWidget({super.key, required this.model});

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
    widget.model.emailTextFieldTextController ??=
        TextEditingController(text: emailText);
    widget.model.emailTextFieldFocusNode ??= FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
      child: TextFormField(
        controller: widget.model.emailTextFieldTextController,
        focusNode: widget.model.emailTextFieldFocusNode,
        onChanged: (_) => EasyDebounce.debounce(
            '_model.emailTextFieldTextController',
            const Duration(milliseconds: 2000),
            () => {}),
        onFieldSubmitted: (_) async {
          if (widget.model.formKey.currentState == null ||
              !widget.model.formKey.currentState!.validate()) {
            return;
          }
        },
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
          suffixIcon: widget.model.emailTextFieldTextController!.text.isNotEmpty
              ? InkWell(
                  onTap: () async {
                    widget.model.emailTextFieldTextController?.clear();
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
        validator: widget.model.emailTextFieldTextControllerValidator
            .asValidator(context),
      ),
    );
  }
}
