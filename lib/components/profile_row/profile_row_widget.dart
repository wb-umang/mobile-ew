import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'profile_row_model.dart';
export 'profile_row_model.dart';

class ProfileRowWidget extends StatefulWidget {
  const ProfileRowWidget({
    super.key,
    required this.title,
    this.label,
    required this.icon,
  });

  final String? title;
  final String? label;
  final Widget? icon;

  @override
  State<ProfileRowWidget> createState() => _ProfileRowWidgetState();
}

class _ProfileRowWidgetState extends State<ProfileRowWidget> {
  late ProfileRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileRowModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          widget.icon!,
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget.title,
                'Compare',
              ),
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'DM Sans',
                    color: FlutterFlowTheme.of(context).primary,
                    letterSpacing: 0.08,
                    lineHeight: 1.43,
                  ),
            ),
          ),
          const Spacer(),
          if (widget.label != null && widget.label != '')
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.label,
                  '0',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'DM Sans',
                      color: FlutterFlowTheme.of(context).secondary,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          Icon(
            FFIcons.kicon,
            color: FlutterFlowTheme.of(context).secondary,
            size: 24.0,
          ),
        ],
      ),
    );
  }
}
