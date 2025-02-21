import 'package:every_watch/core/common/widgets/primary_button.dart';
import 'package:every_watch/core/utils/app_strings.dart';
import 'package:every_watch/features/auth/ui/bloc/auth_bloc.dart';
import 'package:every_watch/features/auth/ui/pages/login_page/login_page_model.dart';
import 'package:every_watch/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButtonWidget extends StatefulWidget {
  final LoginPageModel model;
  final bool isLoading;
  const LoginButtonWidget(
      {super.key, required this.model, this.isLoading = false});

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
          onPressed: () async {
            if (widget.isLoading) return;

            context.read<AuthBloc>().add(
                  AuthLogin(
                    email: widget.model.emailTextFieldTextController.text,
                    password: widget.model.passwordTextFieldTextController.text,
                  ),
                );
          },
        ),
      ),
    );
  }
}
