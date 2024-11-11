import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'small_arrow_button_model.dart';
export 'small_arrow_button_model.dart';

class SmallArrowButtonWidget extends StatefulWidget {
  const SmallArrowButtonWidget({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  State<SmallArrowButtonWidget> createState() => _SmallArrowButtonWidgetState();
}

class _SmallArrowButtonWidgetState extends State<SmallArrowButtonWidget> {
  late SmallArrowButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmallArrowButtonModel());
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
          textAlign: TextAlign.start,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'DM Sans',
                color: FlutterFlowTheme.of(context).secondary,
                letterSpacing: 0.08,
                lineHeight: 1.43,
              ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/Box_(1).png',
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
