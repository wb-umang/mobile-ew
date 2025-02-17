import 'package:every_watch/core/utils/app_strings.dart';
import 'package:every_watch/core/widgets/arrow_button/arrow_button_widget.dart';
import 'package:every_watch/core/widgets/invite_field/invite_field_widget.dart';
import 'package:every_watch/features/auth/ui/widgets/email_pass_form_signup_widget.dart';
import 'package:every_watch/features/auth/ui/widgets/model/signup_page_model.dart';
import 'package:every_watch/features/auth/ui/widgets/name_form_signup_widget.dart';
import 'package:every_watch/features/auth/ui/widgets/signup_button_widget.dart';
import 'package:every_watch/features/auth/ui/widgets/social_logins_widget.dart';
import 'package:every_watch/flutter_flow/flutter_flow_icon_button.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:every_watch/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late SignupPageModel _model;

  @override
  void initState() {
    _model = createModel(context, () => SignupPageModel());

    _model.firstNameTextFieldTextController ??= TextEditingController();
    _model.firstNameTextFieldFocusNode ??= FocusNode();

    _model.lastNameTextFieldTextController ??= TextEditingController();
    _model.lastNameTextFieldFocusNode ??= FocusNode();

    _model.emailTextFieldTextController ??= TextEditingController();
    _model.emailTextFieldFocusNode ??= FocusNode();

    _model.passwordTextFieldTextController ??= TextEditingController();
    _model.passwordTextFieldFocusNode ??= FocusNode();

    super.initState();
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
              color: FlutterFlowTheme.of(context).primary,
              size: 32.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: const [],
          centerTitle: true,
        ),
        body: SafeArea(
            top: true,
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                          SignupPageStrings.newAccount,
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'DM Sans',
                                    color: FlutterFlowTheme.of(context).primary,
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
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          SignupPageStrings.subHeadline,
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'DM Sans',
                                color: FlutterFlowTheme.of(context).secondary,
                                letterSpacing: 0.08,
                                lineHeight: 1.43,
                              ),
                        ),
                      ),
                    ),
                    EmailPassFormSignupWidget(model: _model),
                    NameFormSignupWidget(model: _model),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Column(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              SignupPageStrings.invitationCode,
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
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.inviteFieldModel,
                                updateCallback: () => safeSetState(() {}),
                                child: const InviteFieldWidget(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SignupButtonWidget(model: _model),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.only(top: 32),
                        child: Text(
                          SignupPageStrings.bottomTagline,
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                        onTap: () async {
                          context.pushNamed('LoginPage');
                        },
                        child: wrapWithModel(
                          model: _model.arrowButtonModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const ArrowButtonWidget(
                            title: SignupPageStrings.logIn,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 32, bottom: 24),
                      child: wrapWithModel(
                        model: _model.socialLoginsModel,
                        updateCallback: () => safeSetState(() {}),
                        child: const SocialLoginsWidget(),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
