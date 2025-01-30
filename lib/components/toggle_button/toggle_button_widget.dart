import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'toggle_button_model.dart';
export 'toggle_button_model.dart';

class ToggleButtonWidget extends StatefulWidget {
  const ToggleButtonWidget({
    super.key,
    this.title,
    String? count,
    required this.selectedAction,
    required this.unselectedAction,
    required this.isSelected,
  }) : count = count ?? '0';

  final String? title;
  final String count;
  final Future Function()? selectedAction;
  final Future Function()? unselectedAction;
  final bool isSelected;

  @override
  State<ToggleButtonWidget> createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  late ToggleButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    ToggleButtonModel model = ToggleButtonModel();
    _model = createModel(context, () => model);
    _model.isSelected = widget.isSelected;
  }

  @override
  void didUpdateWidget(covariant ToggleButtonWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) {
      _model.isSelected = widget.isSelected;
    }
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        _model.isSelected = !_model.isSelected;
        safeSetState(() {});
        if (_model.isSelected) {
          await widget.selectedAction?.call();
        } else {
          await widget.unselectedAction?.call();
        }
      },
      child: Material(
        color: Colors.transparent,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          height: 32.0,
          decoration: BoxDecoration(
            color: _model.isSelected
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).lightGray,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: _model.isSelected
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).border2,
            ),
          ),
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.title,
                        'Title',
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'DM Sans',
                            color: _model.isSelected
                                ? FlutterFlowTheme.of(context)
                                    .secondaryBackground
                                : FlutterFlowTheme.of(context).primary,
                            fontSize: 12.0,
                            letterSpacing: 0.16,
                            lineHeight: 1.33,
                          ),
                    ),
                  ),
                  if (widget.count != '' && widget.count != '0')
                    Text(
                      "(${widget.count})",
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'DM Sans',
                            color: _model.isSelected
                                ? FlutterFlowTheme.of(context)
                                    .secondaryBackground
                                : FlutterFlowTheme.of(context).primary,
                            fontSize: 12.0,
                            letterSpacing: 0.16,
                            lineHeight: 1.33,
                          ),
                    ),
                  if (_model.isSelected)
                    const Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        FFIcons.kshape,
                        color: Color(0x6BFFFFFF),
                        size: 12.0,
                      ),
                    ),
                ].divide(const SizedBox(width: 4.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
