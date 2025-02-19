import 'package:every_watch/backend/api_requests/api_calls.dart';
import 'package:every_watch/backend/schema/structs/login_response_struct.dart';
import 'package:every_watch/core/utils/app_strings.dart';
import 'package:every_watch/features/auth/ui/widgets/model/login_page_model.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:every_watch/flutter_flow/flutter_flow_util.dart';
import 'package:every_watch/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class LoginButtonWidget extends StatefulWidget {
  final LoginPageModel model;
  const LoginButtonWidget({super.key, required this.model});

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
        child: FFButtonWidget(
          onPressed: () async {
            widget.model.loginResult =
                await MutualWatchGroup.loginUserCall.call(
              username: widget.model.emailTextFieldTextController.text,
              password: widget.model.passwordTextFieldTextController.text,
            );

            if (LoginResponseStruct.maybeFromMap(
                    (widget.model.loginResult?.jsonBody ?? ''))!
                .success) {
              FFAppState().loginData = LoginResponseStruct.maybeFromMap(
                      (widget.model.loginResult?.jsonBody ?? ''))!
                  .data;
              FFAppState().clear();
              context.pushNamed('MainPage');
            } else {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: const Text(LoginPageStrings.logInFailed),
                    content: Text(LoginResponseStruct.maybeFromMap(
                            (widget.model.loginResult?.jsonBody ?? ''))!
                        .message),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: const Text(LoginPageStrings.ok),
                      ),
                    ],
                  );
                },
              );
            }
          },
          text: LoginPageStrings.logIn,
          options: FFButtonOptions(
            width: double.infinity,
            height: 44.0,
            padding: const EdgeInsets.only(left: 24, right: 24),
            iconPadding:
                const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'DM Sans',
                  color: Colors.white,
                  fontSize: 14.0,
                  letterSpacing: 0.12,
                  fontWeight: FontWeight.bold,
                  lineHeight: 1.47,
                ),
            borderSide: const BorderSide(
              width: 0.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
