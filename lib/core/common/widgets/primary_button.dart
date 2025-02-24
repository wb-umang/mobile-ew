import 'package:every_watch/core/common/widgets/custom_loader.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final bool isLoading;
  final String text;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? height;
  final double? width;

  const PrimaryButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.height,
    this.width,
  });
  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              widget.backgroundColor ?? FlutterFlowTheme.of(context).primary,
          foregroundColor: widget.foregroundColor ?? Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: widget.onPressed,
        child: widget.isLoading
            ? const CustomLoader()
            : Text(
                widget.text,
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'DM Sans',
                      color: Colors.white,
                      fontSize: 14.0,
                      letterSpacing: 0.12,
                      fontWeight: FontWeight.bold,
                      lineHeight: 1.47,
                    ),
              ),
      ),
    );
  }
}
