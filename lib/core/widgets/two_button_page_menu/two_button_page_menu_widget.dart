import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'two_button_page_menu_model.dart';
export 'two_button_page_menu_model.dart';

class TwoButtonPageMenuWidget extends StatefulWidget {
  const TwoButtonPageMenuWidget({
    super.key,
    String? firstTitle,
    String? secondTitle,
  })  : firstTitle = firstTitle ?? 'Details',
        secondTitle = secondTitle ?? 'Description';

  final String firstTitle;
  final String secondTitle;

  @override
  State<TwoButtonPageMenuWidget> createState() =>
      _TwoButtonPageMenuWidgetState();
}

class _TwoButtonPageMenuWidgetState extends State<TwoButtonPageMenuWidget> {
  late TwoButtonPageMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TwoButtonPageMenuModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 36.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).lightGray,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).border2,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: FFButtonWidget(
                onPressed: () async {
                  _model.isFirstSelected = true;
                  safeSetState(() {});
                },
                text: valueOrDefault<String>(
                  widget.firstTitle,
                  'Details',
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: _model.isFirstSelected
                      ? FlutterFlowTheme.of(context).secondaryBackground
                      : FlutterFlowTheme.of(context).lightGray,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'DM Sans',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 14.0,
                        letterSpacing: 0.08,
                        fontWeight: FontWeight.normal,
                        lineHeight: 1.43,
                      ),
                  borderSide: BorderSide(
                    color: _model.isFirstSelected
                        ? FlutterFlowTheme.of(context).border2
                        : const Color(0x00000000),
                    width: _model.isFirstSelected ? 1.0 : 0.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Expanded(
              child: FFButtonWidget(
                onPressed: () async {
                  _model.isFirstSelected = false;
                  safeSetState(() {});
                },
                text: valueOrDefault<String>(
                  widget.secondTitle,
                  'Description',
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: _model.isFirstSelected
                      ? FlutterFlowTheme.of(context).lightGray
                      : FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'DM Sans',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 14.0,
                        letterSpacing: 0.08,
                        fontWeight: FontWeight.normal,
                        lineHeight: 1.43,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: _model.isFirstSelected
                        ? FlutterFlowTheme.of(context).border2
                        : const Color(0x00000000),
                    width: _model.isFirstSelected ? 1.0 : 0.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
