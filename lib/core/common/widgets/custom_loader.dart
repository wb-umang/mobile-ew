import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  final Color? color;
  final double? width;
  final double? height;
  const CustomLoader({super.key, this.color, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 20,
      height: height ?? 20,
      child: Center(
        child: CircularProgressIndicator(
          color: color ?? Colors.white,
        ),
      ),
    );
  }
}
