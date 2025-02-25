import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  final double opacity;
  final Color maskColor;

  const FullScreenLoader({
    super.key,
    this.opacity = 0.5,
    this.maskColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Semi-transparent mask
        Opacity(
          opacity: opacity,
          child: Container(
            color: maskColor,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        // Centered loader
        Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary),
          ),
        ),
      ],
    );
  }
}
