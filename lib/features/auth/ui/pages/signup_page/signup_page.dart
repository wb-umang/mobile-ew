import 'package:every_watch/core/common/widgets/arrow_button/arrow_button_widget.dart';
import 'package:every_watch/core/utils/app_strings.dart';
import 'package:every_watch/core/utils/show_custom_snackbar.dart';
import 'package:every_watch/core/utils/show_overlay_loader.dart';
import 'package:every_watch/features/auth/ui/bloc/auth_bloc.dart';
import 'package:every_watch/features/auth/ui/pages/signup_page/signup_view_model.dart';
import 'package:every_watch/features/auth/ui/widgets/email_pass_form_signup_widget.dart';
import 'package:every_watch/features/auth/ui/widgets/invite_field_widget.dart';
import 'package:every_watch/features/auth/ui/widgets/name_form_signup_widget.dart';
import 'package:every_watch/features/auth/ui/widgets/signup_button_widget.dart';
import 'package:every_watch/features/auth/ui/widgets/social_logins_widget.dart';
import 'package:every_watch/flutter_flow/flutter_flow_icon_button.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:every_watch/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpViewModel(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          context.read<SignUpViewModel>().handleAuthState(state);
          if (state is AuthSuccess) {
            context.go('/home');
          }
          if (state is AuthError && !state.isValidationError) {
            showCustomSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          return BlocBuilder<SignUpViewModel, AuthState>(
            builder: (context, signUpState) {
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
                        color: FlutterFlowTheme.of(context).primary,
                        size: 32.0,
                      ),
                      onPressed: () => context.pop(),
                    ),
                    actions: const [],
                    centerTitle: true,
                  ),
                  body: Stack(
                    children: [
                      SafeArea(
                        top: true,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 16),
                                    child: Text(
                                      SignupPageStrings.newAccount,
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'DM Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.08,
                                            fontWeight: FontWeight.bold,
                                            lineHeight: 1.27,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                      SignupPageStrings.subHeadline,
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
                                EmailPassFormSignupWidget(
                                  emailController: context
                                      .read<SignUpViewModel>()
                                      .emailController,
                                  passwordController: context
                                      .read<SignUpViewModel>()
                                      .passwordController,
                                ),
                                NameFormSignupWidget(
                                  firstNameController: context
                                      .read<SignUpViewModel>()
                                      .firstNameController,
                                  lastNameController: context
                                      .read<SignUpViewModel>()
                                      .lastNameController,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            -1.0, 0.0),
                                        child: Text(
                                          SignupPageStrings.invitationCode,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'DM Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.12,
                                                fontWeight: FontWeight.bold,
                                                lineHeight: 1.43,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            0.0, 0.0),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                          child: InviteFieldWidget(
                                            inviteCodeController: context
                                                .read<SignUpViewModel>()
                                                .inviteCodeController,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SignupButtonWidget(
                                  isLoading: signUpState is AuthLoading &&
                                      !signUpState.isGoogleLogin,
                                  onPressed: () => context
                                      .read<SignUpViewModel>()
                                      .signUp(context),
                                ),
                                if (signUpState is AuthError &&
                                    signUpState.isValidationError)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        signUpState.message,
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
                                  ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 32),
                                    child: Text(
                                      SignupPageStrings.bottomTagline,
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
                                  padding: EdgeInsets.only(top: 16),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () =>
                                        context.pushReplacement('/login'),
                                    child: const ArrowButtonWidget(
                                      title: SignupPageStrings.logIn,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                SocialLoginsWidget(
                                  onSignInWithApple: () {},
                                  onSignInWithGoogle: () => context
                                      .read<SignUpViewModel>()
                                      .signInWithGoogle(context),
                                ),
                                const SizedBox(height: 32),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (state is AuthLoading && state.isGoogleLogin)
                        const FullScreenLoader(),
                    ],
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
