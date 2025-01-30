import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'icon_button_model.dart';
export 'icon_button_model.dart';

class IconButtonWidget extends StatefulWidget {
  const IconButtonWidget({
    super.key,
    String? name,
    this.icon,
    required this.selectedAction,
    required this.unselectedAction,
    required this.isSelected,
  }) : name = name ?? 'Title';

  final String name;
  final Widget? icon;
  final Future Function()? selectedAction;
  final Future Function()? unselectedAction;
  final bool isSelected;

  @override
  State<IconButtonWidget> createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget.isSelected) {
          await widget.unselectedAction?.call();
        } else {
          await widget.selectedAction?.call();
        }
        safeSetState(() {});
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.299,
        height: 55.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    color: widget.isSelected
                        ? const Color(0x14040731)
                        : FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: widget.isSelected
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).border2,
                      width: 1.0,
                    ),
                  ),
                  child: widget.icon!,
                ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.name,
                  'Name',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'DM Sans',
                      fontSize: 11.0,
                      letterSpacing: 0.2,
                    ),
              ),
            ].divide(const SizedBox(height: 4.0)),
          ),
        ),
      ),
    );
  }
}
