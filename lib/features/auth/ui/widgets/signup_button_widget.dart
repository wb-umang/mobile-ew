import 'package:every_watch/backend/api_requests/api_calls.dart';
import 'package:every_watch/backend/schema/structs/login_response_struct.dart';
import 'package:every_watch/core/utils/app_strings.dart';
import 'package:every_watch/features/auth/ui/widgets/model/signup_page_model.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:every_watch/flutter_flow/flutter_flow_util.dart';
import 'package:every_watch/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class SignupButtonWidget extends StatefulWidget {
  final SignupPageModel model;
  const SignupButtonWidget({super.key, required this.model});

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
        child: FFButtonWidget(
          onPressed: () async {
            widget.model.registerResult =
                await MutualWatchGroup.registerUserCall.call(
              email: widget.model.emailTextFieldTextController.text,
              password: widget.model.passwordTextFieldTextController.text,
              firstName: widget.model.firstNameTextFieldTextController.text,
              lastName: widget.model.lastNameTextFieldTextController.text,
              invitationCode: widget.model.inviteFieldModel.textController.text,
            );

            if (LoginResponseStruct.maybeFromMap(
                    (widget.model.registerResult?.jsonBody ?? ''))!
                .success) {
              FFAppState().loginData = LoginResponseStruct.maybeFromMap(
                      (widget.model.registerResult?.jsonBody ?? ''))!
                  .data;

              context.pushNamed('MainPage');
            } else {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: const Text(SignupPageStrings.registerFailed),
                    content: Text(LoginResponseStruct.maybeFromMap(
                            (widget.model.registerResult?.jsonBody ?? ''))!
                        .message),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: const Text(SignupPageStrings.ok),
                      ),
                    ],
                  );
                },
              );
            }

            safeSetState(() {});
          },
          text: SignupPageStrings.signUp,
          options: FFButtonOptions(
            width: double.infinity,
            height: 44.0,
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
