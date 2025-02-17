import 'package:every_watch/core/utils/app_strings.dart';
import 'package:every_watch/core/widgets/arrow_button/arrow_button_widget.dart';
import 'package:every_watch/features/auth/ui/widgets/email_field_login_widget.dart';
import 'package:every_watch/features/auth/ui/widgets/login_button_widget.dart';
import 'package:every_watch/features/auth/ui/widgets/model/login_page_model.dart';
import 'package:every_watch/features/auth/ui/widgets/password_field_login_widget.dart';
import 'package:every_watch/features/auth/ui/widgets/social_logins_widget.dart';
import 'package:every_watch/flutter_flow/flutter_flow_icon_button.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:every_watch/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginPageModel _model;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    _model = createModel(context, () => LoginPageModel());
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 52.0,
            icon: Icon(
              FFIcons.kleft,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 32.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                maxWidth: 670.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Form(
                autovalidateMode: AutovalidateMode.disabled,
                child: Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        20.0, 32.0, 20.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text(
                                LoginPageStrings.welcomeBack,
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.08,
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.27,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                LoginPageStrings.pleaseLogInToYourAccount,
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.08,
                                      lineHeight: 1.43,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Text(
                              LoginPageStrings.email,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'DM Sans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.12,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.43,
                                  ),
                            ),
                          ),
                          EmailFieldLoginWidget(model: _model),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              LoginPageStrings.password,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'DM Sans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.12,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.43,
                                  ),
                            ),
                          ),
                          PasswordFieldLoginWidget(model: _model),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                context.pushNamed('ForgotPasswordPage');
                              },
                              child: Text(
                                LoginPageStrings.forgotPassword,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      fontSize: 12.0,
                                      letterSpacing: 0.18,
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.33,
                                    ),
                              ),
                            ),
                          ),
                          LoginButtonWidget(model: _model),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 32),
                              child: Text(
                                LoginPageStrings.dontHaveAccount,
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      fontSize: 12.0,
                                      letterSpacing: 0.16,
                                      lineHeight: 1.33,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('RegisterPage');
                              },
                              child: wrapWithModel(
                                model: _model.arrowButtonModel,
                                updateCallback: () => safeSetState(() {}),
                                child: const ArrowButtonWidget(
                                  title: LoginPageStrings.signUp,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.socialLoginButtonsModel,
                              updateCallback: () => safeSetState(() {}),
                              child: const SocialLoginsWidget(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
