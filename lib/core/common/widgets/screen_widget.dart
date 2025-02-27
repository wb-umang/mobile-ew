import 'package:every_watch/core/common/widgets/custom_loader.dart';
import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final EdgeInsets padding;
  final Color? loaderColor;

  const Screen({
    super.key,
    required this.child,
    this.isLoading = false,
    this.padding = const EdgeInsets.fromLTRB(18, 20, 18, 20),
    this.loaderColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
        if (isLoading)
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CustomLoader(color: loaderColor),
          )
      ],
    );
  }
}
