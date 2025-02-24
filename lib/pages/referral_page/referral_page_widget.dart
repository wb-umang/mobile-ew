import '../../core/common/widgets/referral_dialog/referral_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'referral_page_model.dart';
export 'referral_page_model.dart';

class ReferralPageWidget extends StatefulWidget {
  const ReferralPageWidget({
    super.key,
    String? initialOption,
  }) : initialOption = initialOption ?? 'Novice';

  final String initialOption;

  @override
  State<ReferralPageWidget> createState() => _ReferralPageWidgetState();
}

class _ReferralPageWidgetState extends State<ReferralPageWidget> {
  late ReferralPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReferralPageModel());
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
            'Referral Program',
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
          child: wrapWithModel(
            model: _model.referralDialogModel,
            updateCallback: () => safeSetState(() {}),
            child: const ReferralDialogWidget(),
          ),
        ),
      ),
    );
  }
}
