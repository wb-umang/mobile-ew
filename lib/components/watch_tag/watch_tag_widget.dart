import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'watch_tag_model.dart';
export 'watch_tag_model.dart';

class WatchTagWidget extends StatefulWidget {
  const WatchTagWidget({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  State<WatchTagWidget> createState() => _WatchTagWidgetState();
}

class _WatchTagWidgetState extends State<WatchTagWidget> {
  late WatchTagModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WatchTagModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: 100.0,
        height: 20.0,
        decoration: BoxDecoration(
          color: () {
            if (widget.title == 'LIVE AUCTION') {
              return FlutterFlowTheme.of(context).liveAuction;
            } else if (widget.title == 'MARKETPLACE') {
              return FlutterFlowTheme.of(context).alternate;
            } else {
              return const Color(0x34009FDB);
            }
          }(),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Text(
            valueOrDefault<String>(
              widget.title,
              'LIVE AUCTION',
            ),
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: 'DM Sans',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontSize: 10.0,
                  letterSpacing: 0.28,
                  fontWeight: FontWeight.bold,
                  lineHeight: 1.2,
                ),
          ),
        ),
      ),
    );
  }
}
