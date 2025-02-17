import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'separator_icon_model.dart';
export 'separator_icon_model.dart';

class SeparatorIconWidget extends StatefulWidget {
  const SeparatorIconWidget({
    super.key,
    Color? color,
  }) : color = color ?? const Color(0xFFE6E8F0);

  final Color color;

  @override
  State<SeparatorIconWidget> createState() => _SeparatorIconWidgetState();
}

class _SeparatorIconWidgetState extends State<SeparatorIconWidget> {
  late SeparatorIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeparatorIconModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(48.0, 4.0, 12.0, 4.0),
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
