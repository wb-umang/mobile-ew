import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'separator_model.dart';
export 'separator_model.dart';

class SeparatorWidget extends StatefulWidget {
  const SeparatorWidget({
    super.key,
    Color? color,
  }) : color = color ?? const Color(0xFFE6E8F0);

  final Color color;

  @override
  State<SeparatorWidget> createState() => _SeparatorWidgetState();
}

class _SeparatorWidgetState extends State<SeparatorWidget> {
  late SeparatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeparatorModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        decoration: BoxDecoration(
          color: widget.color,
        ),
      ),
    );
  }
}
