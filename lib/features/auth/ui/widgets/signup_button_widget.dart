import 'package:every_watch/core/common/widgets/primary_button.dart';
import 'package:every_watch/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class SignupButtonWidget extends StatefulWidget {
  final bool isLoading;
  final Function() onPressed;

  const SignupButtonWidget({
    super.key,
    this.isLoading = false,
    required this.onPressed,
  });

  @override
  State<SignupButtonWidget> createState() => _SignupButtonWidgetState();
}

class _SignupButtonWidgetState extends State<SignupButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
        child: PrimaryButton(
          text: SignupPageStrings.signUp,
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
