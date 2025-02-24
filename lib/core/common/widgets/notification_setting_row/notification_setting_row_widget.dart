import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'notification_setting_row_model.dart';
export 'notification_setting_row_model.dart';

class NotificationSettingRowWidget extends StatefulWidget {
  const NotificationSettingRowWidget({
    super.key,
    required this.title,
    required this.icon,
    bool? isActive,
  }) : isActive = isActive ?? false;

  final String? title;
  final Widget? icon;
  final bool isActive;

  @override
  State<NotificationSettingRowWidget> createState() =>
      _NotificationSettingRowWidgetState();
}

class _NotificationSettingRowWidgetState
    extends State<NotificationSettingRowWidget> {
  late NotificationSettingRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationSettingRowModel());

    _model.switchValue = false;
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
          Switch.adaptive(
            value: _model.switchValue!,
            onChanged: (newValue) async {
              safeSetState(() => _model.switchValue = newValue);
            },
            activeColor: FlutterFlowTheme.of(context).primary,
            activeTrackColor: FlutterFlowTheme.of(context).primary,
            inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
            inactiveThumbColor: const Color(0xB7FFFFFF),
          ),
        ],
      ),
    );
  }
}
