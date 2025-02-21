import 'package:every_watch/core/common/widgets/primary_button.dart';
import 'package:every_watch/core/utils/app_strings.dart';
import 'package:every_watch/features/auth/ui/bloc/auth_bloc.dart';
import 'package:every_watch/features/auth/ui/pages/signup_page/signup_page_model.dart';
import 'package:every_watch/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupButtonWidget extends StatefulWidget {
  final SignupPageModel model;
  final bool isLoading;
  const SignupButtonWidget(
      {super.key, required this.model, this.isLoading = false});

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
          onPressed: () async {
            if (widget.isLoading) return;

            context.read<AuthBloc>().add(
                  AuthSignUp(
                    email: widget.model.emailTextFieldTextController.text,
                    password: widget.model.passwordTextFieldTextController.text,
                    firstName:
                        widget.model.firstNameTextFieldTextController.text,
                    lastName: widget.model.lastNameTextFieldTextController.text,
                    invitationCode:
                        widget.model.inviteFieldModel.textController.text,
                  ),
                );
          },
        ),
      ),
    );
  }
}
