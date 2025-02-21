import 'package:every_watch/core/common/widgets/primary_button.dart';
import 'package:every_watch/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class LoginButtonWidget extends StatefulWidget {
  final bool isLoading;
  final Function() onPressed;

  const LoginButtonWidget({
    super.key,
    this.isLoading = false,
    required this.onPressed,
  });

  @override
  State<LoginButtonWidget> createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
        child: PrimaryButton(
          text: LoginPageStrings.logIn,
          isLoading: widget.isLoading,
          onPressed: () {
            if (widget.isLoading) return;

            widget.onPressed();
          },
        ),
      ),
    );
  }
}
