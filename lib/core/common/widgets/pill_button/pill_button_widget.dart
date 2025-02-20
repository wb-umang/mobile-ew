import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'pill_button_model.dart';
export 'pill_button_model.dart';

class PillButtonWidget extends StatefulWidget {
  const PillButtonWidget({
    super.key,
    this.title,
    this.icon,
    required this.pressAction,
  });

  final String? title;
  final Widget? icon;
  final Future Function()? pressAction;

  @override
  State<PillButtonWidget> createState() => _PillButtonWidgetState();
}

class _PillButtonWidgetState extends State<PillButtonWidget> {
  late PillButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PillButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: FFButtonWidget(
        onPressed: () async {
          await widget.pressAction?.call();
        },
        text: widget.title!,
        icon: widget.icon,
        options: FFButtonOptions(
          height: 32.0,
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0),
          iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: FlutterFlowTheme.of(context).appBar,
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'DM Sans',
                color: FlutterFlowTheme.of(context).primary,
                letterSpacing: 0.08,
                lineHeight: 1.43,
              ),
          elevation: 0.0,
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).border,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
