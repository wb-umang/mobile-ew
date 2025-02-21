import 'package:every_watch/core/utils/app_strings.dart';
import 'package:every_watch/core/common/widgets/arrow_button/arrow_button_widget.dart';
import 'package:every_watch/core/utils/show_custom_snackbar.dart';
import 'package:every_watch/features/auth/ui/bloc/auth_bloc.dart';
import 'package:every_watch/features/auth/ui/pages/login_page/login_view_model.dart';
import 'package:every_watch/features/auth/ui/widgets/email_field_login_widget.dart';
import 'package:every_watch/features/auth/ui/widgets/login_button_widget.dart';
import 'package:every_watch/features/auth/ui/widgets/password_field_login_widget.dart';
import 'package:every_watch/features/auth/ui/widgets/social_logins_widget.dart';
import 'package:every_watch/flutter_flow/flutter_flow_icon_button.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:every_watch/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginViewModel(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          context.read<LoginViewModel>().handleAuthState(state);
          if (state is AuthSuccess) {
            context.pushNamed('MainPage');
          }
          if (state is AuthError && !state.isValidationError) {
            showCustomSnackBar(context, state.message);
          }
        },
        builder: (context, authState) {
          return BlocBuilder<LoginViewModel, AuthState>(
            builder: (context, loginState) {
              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Scaffold(
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  appBar: AppBar(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
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
                      onPressed: () => context.pop(),
                    ),
                    elevation: 0.0,
                  ),
                  body: SafeArea(
                    top: true,
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(maxWidth: 670.0),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 32.0, 20.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    LoginPageStrings.welcomeBack,
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'DM Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    LoginPageStrings.pleaseLogInToYourAccount,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'DM Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                  ),
                                  const SizedBox(height: 40),
                                  Text(
                                    LoginPageStrings.email,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'DM Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  EmailFieldLoginWidget(
                                    emailController: context
                                        .read<LoginViewModel>()
                                        .emailController,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    LoginPageStrings.password,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'DM Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  PasswordFieldLoginWidget(
                                    passwordController: context
                                        .read<LoginViewModel>()
                                        .passwordController,
                                  ),
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: () =>
                                        context.pushNamed('ForgotPasswordPage'),
                                    child: Text(
                                      LoginPageStrings.forgotPassword,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'DM Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  LoginButtonWidget(
                                    isLoading: loginState is AuthLoading,
                                    onPressed: () => context
                                        .read<LoginViewModel>()
                                        .login(context),
                                  ),
                                  if (loginState is AuthError &&
                                      loginState.isValidationError)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        loginState.message,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'DM Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 12.0,
                                            ),
                                      ),
                                    ),
                                  const SizedBox(height: 32),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      LoginPageStrings.dontHaveAccount,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'DM Sans',
                                            fontSize: 12.0,
                                          ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  InkWell(
                                    onTap: () =>
                                        context.pushNamed('RegisterPage'),
                                    child: const ArrowButtonWidget(
                                      title: LoginPageStrings.signUp,
                                    ),
                                  ),
                                  const SizedBox(height: 32),
                                  const SocialLoginsWidget(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
