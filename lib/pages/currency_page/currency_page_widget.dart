import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'currency_page_model.dart';
export 'currency_page_model.dart';

class CurrencyPageWidget extends StatefulWidget {
  const CurrencyPageWidget({
    super.key,
    String? initialOption,
  }) : initialOption = initialOption ?? 'Novice';

  final String initialOption;

  @override
  State<CurrencyPageWidget> createState() => _CurrencyPageWidgetState();
}

class _CurrencyPageWidgetState extends State<CurrencyPageWidget> {
  late CurrencyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CurrencyPageModel());
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
            buttonSize: 62.0,
            icon: Icon(
              FFIcons.kleft,
              color: FlutterFlowTheme.of(context).primary,
              size: 32.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Currency',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'DM Sans',
                  fontSize: 16.0,
                  letterSpacing: 0.16,
                  fontWeight: FontWeight.bold,
                  lineHeight: 1.5,
                ),
          ),
          actions: const [],
          centerTitle: true,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: FlutterFlowCheckboxGroup(
                    options: const [
                      'Euro (€)',
                      'US Dollar (\$)',
                      'Hong Kong Dollar (HK\$)',
                      'British Pound (£)',
                      'Singapore Dollar (SGD)',
                      'Swiss Franc (CHF)'
                    ],
                    onChanged: (val) =>
                        safeSetState(() => _model.checkboxGroupValues = val),
                    controller: _model.checkboxGroupValueController ??=
                        FormFieldController<List<String>>(
                      List.from(['US Dollar (\$)'] ?? []),
                    ),
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).info,
                    checkboxBorderColor: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'DM Sans',
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.08,
                          lineHeight: 1.43,
                        ),
                    checkboxBorderRadius: BorderRadius.circular(4.0),
                    initialized: _model.checkboxGroupValues != null,
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: FFButtonWidget(
                            onPressed: () async {},
                            text: 'Save',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 44.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
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
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
