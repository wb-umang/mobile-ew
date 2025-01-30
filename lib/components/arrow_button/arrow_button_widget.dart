import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'arrow_button_model.dart';
export 'arrow_button_model.dart';

class ArrowButtonWidget extends StatefulWidget {
  const ArrowButtonWidget({
    super.key,
    this.title,
  });

  final String? title;

  @override
  State<ArrowButtonWidget> createState() => _ArrowButtonWidgetState();
}

class _ArrowButtonWidgetState extends State<ArrowButtonWidget> {
  late ArrowButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArrowButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          valueOrDefault<String>(
            widget.title,
            'Title',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'DM Sans',
                color: FlutterFlowTheme.of(context).tertiary,
                letterSpacing: 0.12,
                fontWeight: FontWeight.bold,
                lineHeight: 1.43,
              ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/Arrow_Right.png',
              width: 16.0,
              height: 16.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
