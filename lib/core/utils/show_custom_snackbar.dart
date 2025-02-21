import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String content,
    {Color? bgColor, int duration = 3}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Expanded(
          child: Text(
            content,
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'DM Sans',
                  color: FlutterFlowTheme.of(context).primary,
                  letterSpacing: 0.08,
                  fontWeight: FontWeight.bold,
                  lineHeight: 1.27,
                ),
          ),
        ),
        backgroundColor: bgColor ?? Colors.white, // Default dark background
        duration: Duration(seconds: duration),
        behavior: SnackBarBehavior
            .floating, // Floating above UI instead of full-width
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 10), // Adds some spacing
        elevation: 2,
      ),
    );
}
