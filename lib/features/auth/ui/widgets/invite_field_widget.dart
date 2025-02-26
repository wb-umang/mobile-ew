import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class InviteFieldWidget extends StatefulWidget {
  final TextEditingController inviteCodeController;
  const InviteFieldWidget({super.key, required this.inviteCodeController});

  @override
  State<InviteFieldWidget> createState() => _InviteFieldWidgetState();
}

class _InviteFieldWidgetState extends State<InviteFieldWidget> {
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const AlignmentDirectional(0.0, 0.0),
      children: [
        TextFormField(
          controller: widget.inviteCodeController,
          autofocus: true,
          textInputAction: TextInputAction.next,
          obscureText: false,
          decoration: InputDecoration(
            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'DM Sans',
                  color: FlutterFlowTheme.of(context).alternate,
                  letterSpacing: 0.08,
                  lineHeight: 1.43,
                ),
            hintText: 'Enter invitation code',
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
            contentPadding:
                const EdgeInsetsDirectional.fromSTEB(42.0, 0.0, 0.0, 0.0),
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'DM Sans',
                color: FlutterFlowTheme.of(context).primary,
                letterSpacing: 0.08,
                lineHeight: 1.43,
              ),
        ),
        Align(
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/left_icon.png',
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(1.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
            child: FFButtonWidget(
              onPressed: () {},
              text: 'Apply',
              options: FFButtonOptions(
                width: 89.0,
                height: 28.0,
                padding:
                    const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'DM Sans',
                      color: Colors.white,
                      fontSize: 14.0,
                      letterSpacing: 0.12,
                      fontWeight: FontWeight.bold,
                      lineHeight: 1.47,
                    ),
                borderSide: const BorderSide(
                  width: 0.0,
                ),
                borderRadius: BorderRadius.circular(6.0),
                disabledColor: FlutterFlowTheme.of(context).border,
                disabledTextColor: FlutterFlowTheme.of(context).alternate,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
