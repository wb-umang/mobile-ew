import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '../../core/widgets/arrow_button/arrow_button_widget.dart';
import '../../core/widgets/invite_field/invite_field_widget.dart';
import '../../core/widgets/social_login_buttons/social_login_buttons_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'register_page_model.dart';
export 'register_page_model.dart';

class RegisterPageWidget extends StatefulWidget {
  const RegisterPageWidget({super.key});

  @override
  State<RegisterPageWidget> createState() => _RegisterPageWidgetState();
}

class _RegisterPageWidgetState extends State<RegisterPageWidget> {
  late RegisterPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterPageModel());

    _model.firstNameTextFieldTextController ??= TextEditingController();
    _model.firstNameTextFieldFocusNode ??= FocusNode();

    _model.lastNameTextFieldTextController ??= TextEditingController();
    _model.lastNameTextFieldFocusNode ??= FocusNode();

    _model.emailTextFieldTextController ??= TextEditingController();
    _model.emailTextFieldFocusNode ??= FocusNode();

    _model.passwordTextFieldTextController ??= TextEditingController();
    _model.passwordTextFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
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
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 16.0, 0.0, 0.0),
                      child: Text(
                        'New Account',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
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
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 8.0, 0.0, 0.0),
                      child: Text(
                        'Please log in to your account',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'DM Sans',
                              color: FlutterFlowTheme.of(context).secondary,
                              letterSpacing: 0.08,
                              lineHeight: 1.43,
                            ),
                      ),
                    ),
                  ),
                  Form(
                    key: _model.formKey1,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 0.0),
                            child: Text(
                              'Email',
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
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.emailTextFieldTextController,
                            focusNode: _model.emailTextFieldFocusNode,
                            onFieldSubmitted: (_) async {
                              if (_model.formKey1.currentState == null ||
                                  !_model.formKey1.currentState!.validate()) {
                                return;
                              }
                            },
                            autofocus: true,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'e.g. johndawny@company.com',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'DM Sans',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    letterSpacing: 0.08,
                                    lineHeight: 1.43,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'DM Sans',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).border,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.08,
                                  lineHeight: 1.43,
                                ),
                            validator: _model
                                .emailTextFieldTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Text(
                              'Password',
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
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.passwordTextFieldTextController,
                            focusNode: _model.passwordTextFieldFocusNode,
                            onFieldSubmitted: (_) async {
                              if (_model.formKey1.currentState == null ||
                                  !_model.formKey1.currentState!.validate()) {
                                return;
                              }
                            },
                            autofocus: true,
                            textInputAction: TextInputAction.next,
                            obscureText: !_model.passwordTextFieldVisibility,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'DM Sans',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    letterSpacing: 0.08,
                                    lineHeight: 1.43,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'DM Sans',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).border,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              suffixIcon: InkWell(
                                onTap: () => safeSetState(
                                  () => _model.passwordTextFieldVisibility =
                                      !_model.passwordTextFieldVisibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.passwordTextFieldVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 16.0,
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.08,
                                  lineHeight: 1.43,
                                ),
                            validator: _model
                                .passwordTextFieldTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _model.formKey2,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 16.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      'First Name',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'DM Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.12,
                                            fontWeight: FontWeight.bold,
                                            lineHeight: 1.43,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: 200.0,
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 4.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller: _model
                                            .firstNameTextFieldTextController,
                                        focusNode:
                                            _model.firstNameTextFieldFocusNode,
                                        onFieldSubmitted: (_) async {
                                          if (_model.formKey2.currentState ==
                                                  null ||
                                              !_model.formKey2.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                        },
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'e.g. John',
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'DM Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                letterSpacing: 0.08,
                                                lineHeight: 1.43,
                                              ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'DM Sans',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .border,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'DM Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.08,
                                              lineHeight: 1.43,
                                            ),
                                        validator: _model
                                            .firstNameTextFieldTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      'Last Name',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'DM Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.12,
                                            fontWeight: FontWeight.bold,
                                            lineHeight: 1.43,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: 200.0,
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 4.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller: _model
                                            .lastNameTextFieldTextController,
                                        focusNode:
                                            _model.lastNameTextFieldFocusNode,
                                        onFieldSubmitted: (_) async {
                                          if (_model.formKey2.currentState ==
                                                  null ||
                                              !_model.formKey2.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                        },
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'e.g. Dawny',
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'DM Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                letterSpacing: 0.08,
                                                lineHeight: 1.43,
                                              ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'DM Sans',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .border,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'DM Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.08,
                                              lineHeight: 1.43,
                                            ),
                                        validator: _model
                                            .lastNameTextFieldTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 12.0)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 16.0, 0.0, 0.0),
                      child: Text(
                        'Invitation Code',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'DM Sans',
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.12,
                              fontWeight: FontWeight.bold,
                              lineHeight: 1.43,
                            ),
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
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 40.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.registerResult =
                              await MutualWatchGroup.registerUserCall.call(
                            email: _model.emailTextFieldTextController.text,
                            password:
                                _model.passwordTextFieldTextController.text,
                            firstName:
                                _model.firstNameTextFieldTextController.text,
                            lastName:
                                _model.lastNameTextFieldTextController.text,
                            invitationCode:
                                _model.inviteFieldModel.textController.text,
                          );

                          if (LoginResponseStruct.maybeFromMap(
                                  (_model.registerResult?.jsonBody ?? ''))!
                              .success) {
                            FFAppState()
                                .loginData = LoginResponseStruct.maybeFromMap(
                                    (_model.registerResult?.jsonBody ?? ''))!
                                .data;

                            context.pushNamed('MainPage');
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Register Failed'),
                                  content: Text(
                                      LoginResponseStruct.maybeFromMap((_model
                                                  .registerResult?.jsonBody ??
                                              ''))!
                                          .message),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }

                          safeSetState(() {});
                        },
                        text: 'Sign Up',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 44.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 32.0, 0.0, 0.0),
                      child: Text(
                        'Join us before?',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                        context.pushNamed('LoginPage');
                      },
                      child: wrapWithModel(
                        model: _model.arrowButtonModel,
                        updateCallback: () => safeSetState(() {}),
                        child: const ArrowButtonWidget(
                          title: 'Log in',
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
                      child: const SocialLoginButtonsWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
