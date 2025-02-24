import 'package:every_watch/core/utils/show_custom_snackbar.dart';
import 'package:every_watch/features/auth/ui/bloc/auth_bloc.dart';
import 'package:every_watch/features/auth/ui/pages/welcome_page/welcome_view_model.dart';
import 'package:every_watch/features/auth/ui/widgets/social_logins_widget.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:every_watch/flutter_flow/flutter_flow_widgets.dart';
import 'package:every_watch/core/utils/app_strings.dart';
import 'package:every_watch/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WelcomeViewModel(),
      child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
        context.read<WelcomeViewModel>().handleAuthState(state);
        if (state is AuthSuccess) {
          context.pushNamed('MainPage');
        }
        if (state is AuthError && !state.isValidationError) {
          showCustomSnackBar(context, state.message);
        }
      }, builder: (context, authState) {
        return BlocBuilder<WelcomeViewModel, AuthState>(
          builder: (context, loginState) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  top: true,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        20.0, 0.0, 20.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(width: double.infinity, height: 188),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                Assets.images.logoAssets180X180.path,
                                width: 80.0,
                                height: 80.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Text(
                                WelcomePageStrings.welcomeMessage,
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                WelcomePageStrings.welcomeTagline,
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
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 32.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(
                                    'LoginPage',
                                  );
                                },
                                text: WelcomePageStrings.logInText,
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 44.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
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
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('RegisterPage');
                              },
                              text: WelcomePageStrings.signUpText,
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 44.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 14.0,
                                      letterSpacing: 0.12,
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.47,
                                    ),
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: SocialLoginsWidget(
                                onSignInWithGoogle: () => context
                                    .read<WelcomeViewModel>()
                                    .signInWithGoogle(context),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 120.0, 0.0, 0.0),
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: WelcomePageStrings
                                          .privacyPolicyNotice,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'DM Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            fontSize: 12.0,
                                            letterSpacing: 0.16,
                                            fontWeight: FontWeight.normal,
                                            lineHeight: 1.33,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          WelcomePageStrings.privacyPolicyTitle,
                                      style: GoogleFonts.dmSans(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        fontSize: 12.0,
                                        height: 1.33,
                                      ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'DM Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
