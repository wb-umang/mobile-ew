import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  final double opacity;
  final Color maskColor;
  final bool isMasking;

  const FullScreenLoader({
    super.key,
    this.opacity = 0.5,
    this.maskColor = Colors.black,
    this.isMasking = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Semi-transparent mask
        if (isMasking)
          Opacity(
            opacity: opacity,
            child: Container(
              color: maskColor,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

        if (!isMasking)
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),
        // Centered loader
        Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              isMasking ? Colors.white : FlutterFlowTheme.of(context).primary,
            ),
          ),
        ),
      ],
    );
  }
}
