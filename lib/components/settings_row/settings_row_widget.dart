import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'settings_row_model.dart';
export 'settings_row_model.dart';

class SettingsRowWidget extends StatefulWidget {
  const SettingsRowWidget({
    super.key,
    required this.title,
    this.label,
    bool? hasDetail,
  }) : hasDetail = hasDetail ?? true;

  final String? title;
  final String? label;
  final bool hasDetail;

  @override
  State<SettingsRowWidget> createState() => _SettingsRowWidgetState();
}

class _SettingsRowWidgetState extends State<SettingsRowWidget> {
  late SettingsRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsRowModel());
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
          if (widget.hasDetail)
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
