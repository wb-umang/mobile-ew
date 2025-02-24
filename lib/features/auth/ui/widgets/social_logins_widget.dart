import 'package:every_watch/core/utils/app_strings.dart';
import 'package:every_watch/flutter_flow/flutter_flow_icon_button.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:every_watch/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLoginsWidget extends StatefulWidget {
  final Function() onSignInWithGoogle;
  const SocialLoginsWidget({
    super.key,
    required this.onSignInWithGoogle,
  });

  @override
  State<SocialLoginsWidget> createState() => _SocialLoginsWidgetState();
}

class _SocialLoginsWidgetState extends State<SocialLoginsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 0.5,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).border,
                ),
              ),
            ),
            Text(
              WelcomePageStrings.socialsHeading,
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'DM Sans',
                    color: FlutterFlowTheme.of(context).secondary,
                    fontSize: 12.0,
                    letterSpacing: 0.16,
                    lineHeight: 1.33,
                  ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 0.5,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).border,
                ),
              ),
            ),
          ].divide(const SizedBox(width: 9.0)),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primary,
                borderRadius: 14.0,
                borderWidth: 1.0,
                buttonSize: 44.0,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                icon: Icon(
                  Icons.apple,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                onPressed: () {},
              ),
              FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primary,
                borderRadius: 14.0,
                borderWidth: 1.0,
                buttonSize: 44.0,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 16.0,
                ),
                onPressed: widget.onSignInWithGoogle,
              ),
            ].divide(const SizedBox(width: 16.0)),
          ),
        ),
      ],
    );
  }
}
