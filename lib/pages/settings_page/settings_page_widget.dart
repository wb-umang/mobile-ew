import '/components/separator/separator_widget.dart';
import '/components/settings_row/settings_row_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'settings_page_model.dart';
export 'settings_page_model.dart';

class SettingsPageWidget extends StatefulWidget {
  const SettingsPageWidget({super.key});

  @override
  State<SettingsPageWidget> createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends State<SettingsPageWidget> {
  late SettingsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsPageModel());
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
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StickyHeader(
                    overlapHeaders: false,
                    header: Container(
                      width: double.infinity,
                      height: 52.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(24.0),
                          bottomRight: Radius.circular(24.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Settings',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'DM Sans',
                                    fontSize: 16.0,
                                    letterSpacing: 0.16,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ),
                          FlutterFlowIconButton(
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
                        ],
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(24.0),
                                topRight: Radius.circular(24.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 12.0, 20.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Avatar.png',
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    'Set New Photo',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'DM Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          letterSpacing: 0.12,
                                          fontWeight: FontWeight.normal,
                                          lineHeight: 1.43,
                                        ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          Text(
                                            'LOGIN INFORMATION',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'DM Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  lineHeight: 1.43,
                                                ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lightGray,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        height: 44.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0x00FFFFFF),
                                                        ),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .settingsRowModel1,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              const SettingsRowWidget(
                                                            title: 'Email',
                                                            label:
                                                                'henry@everywatch.com',
                                                            hasDetail: false,
                                                          ),
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .separatorModel1,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: SeparatorWidget(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .border3,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 44.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0x00FFFFFF),
                                                        ),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                                'ChangePasswordPage');
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .settingsRowModel2,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                const SettingsRowWidget(
                                                              title: 'Password',
                                                              label:
                                                                  '•••••••••••',
                                                              hasDetail: true,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'PERSONAL INFORMATION',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'DM Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  lineHeight: 1.43,
                                                ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lightGray,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        height: 44.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0x00FFFFFF),
                                                        ),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'ChangeNamePage',
                                                              queryParameters: {
                                                                'title':
                                                                    serializeParam(
                                                                  'First name',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .settingsRowModel3,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                const SettingsRowWidget(
                                                              title:
                                                                  'First Name',
                                                              label: 'Henry',
                                                              hasDetail: true,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .separatorModel2,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: SeparatorWidget(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .border3,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 44.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0x00FFFFFF),
                                                        ),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'ChangeNamePage',
                                                              queryParameters: {
                                                                'title':
                                                                    serializeParam(
                                                                  'Last name',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .settingsRowModel4,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                const SettingsRowWidget(
                                                              title:
                                                                  'Last Name',
                                                              label: 'Larson',
                                                              hasDetail: true,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .separatorModel3,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: SeparatorWidget(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .border3,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 44.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0x00FFFFFF),
                                                        ),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'RolePage',
                                                              queryParameters: {
                                                                'initialOption':
                                                                    serializeParam(
                                                                  'Novice',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .settingsRowModel5,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                const SettingsRowWidget(
                                                              title: 'Role',
                                                              label:
                                                                  'Collector',
                                                              hasDetail: true,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .separatorModel4,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: SeparatorWidget(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .border3,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 44.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0x00FFFFFF),
                                                        ),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'LookingForPage',
                                                              queryParameters: {
                                                                'initialOption':
                                                                    serializeParam(
                                                                  'Watch Listings',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .settingsRowModel6,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                const SettingsRowWidget(
                                                              title:
                                                                  'I am loooking for',
                                                              label:
                                                                  'Watch Listing',
                                                              hasDetail: false,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .separatorModel5,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: SeparatorWidget(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .border3,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 44.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0x00FFFFFF),
                                                        ),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .settingsRowModel7,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              const SettingsRowWidget(
                                                            title: 'Bio',
                                                            label: 'Optional',
                                                            hasDetail: false,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 8.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
