import 'package:every_watch/backend/schema/structs/index.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'specifications_card_model.dart';
export 'specifications_card_model.dart';

class SpecificationsCardWidget extends StatefulWidget {
  SpecificationsCardWidget({super.key, List<String>? excludedFieldsWatchDetail})
      : excludedFieldsWatchDetail = excludedFieldsWatchDetail ?? [];

  final List<String> excludedFieldsWatchDetail;

  @override
  State<SpecificationsCardWidget> createState() =>
      _SpecificationsCardWidgetState();
}

class _SpecificationsCardWidgetState extends State<SpecificationsCardWidget> {
  late SpecificationsCardModel _model;
  late WatchListingStruct _watch;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpecificationsCardModel());
    _watch = FFAppState().watchListingStruct;
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPremium = FFAppState().loginData.subscriptionTypeId == 1;
    final excludedFieldsWatchDetail = widget.excludedFieldsWatchDetail;
    return Material(
      color: Colors.transparent,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).lightGray,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).border2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Source',
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
                        Visibility(
                          visible: isPremium,
                          child: Text(
                            valueOrDefault<String>(
                              _watch.infoSourceName,
                              '',
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.08,
                                  lineHeight: 1.43,
                                ),
                          ),
                        ),
                        Visibility(
                            visible: !isPremium,
                            child: Icon(
                              FFIcons.klock,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 16.0,
                            ))
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Condition',
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
                        Text(
                          valueOrDefault<String>(
                            _watch.conditionName,
                            '-',
                          ),
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'DM Sans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.08,
                                    lineHeight: 1.43,
                                  ),
                        ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Year of Production',
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
                        Text(
                          valueOrDefault<String>(
                            _watch.yearOfProduction.toString(),
                            '-',
                          ),
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'DM Sans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.08,
                                    lineHeight: 1.43,
                                  ),
                        ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Case Size',
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
                        Text(
                          valueOrDefault<String>(
                            _watch.caseSizeName,
                            '-',
                          ),
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'DM Sans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.08,
                                    lineHeight: 1.43,
                                  ),
                        ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Case Material',
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
                        Text(
                          valueOrDefault<String>(
                            _watch.caseMaterialName,
                            '-',
                          ),
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'DM Sans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.08,
                                    lineHeight: 1.43,
                                  ),
                        ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dial Color',
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
                        Text(
                          valueOrDefault<String>(
                            _watch.dialColorName,
                            '-',
                          ),
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'DM Sans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.08,
                                    lineHeight: 1.43,
                                  ),
                        ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                  ),
                ],
              ),
              Visibility(
                  visible: _model.showAllSpecifications,
                  maintainState: true, // Keeps the state of the widget
                  maintainAnimation: true, // Maintain animations
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bracelete/Strap',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'DM Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 0.08,
                                          lineHeight: 1.43,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      _watch.braceletMaterialName,
                                      '-',
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'DM Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.08,
                                          lineHeight: 1.43,
                                        ),
                                  ),
                                ].divide(const SizedBox(height: 4.0)),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Movement Type',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'DM Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 0.08,
                                          lineHeight: 1.43,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      _watch.movementName,
                                      '-',
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'DM Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.08,
                                          lineHeight: 1.43,
                                        ),
                                  ),
                                ].divide(const SizedBox(height: 4.0)),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Box',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'DM Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 0.08,
                                          lineHeight: 1.43,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      _watch.box,
                                      '-',
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'DM Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.08,
                                          lineHeight: 1.43,
                                        ),
                                  ),
                                ].divide(const SizedBox(height: 4.0)),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Papers',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'DM Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 0.08,
                                          lineHeight: 1.43,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      _watch.paper,
                                      '-',
                                    ),
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'DM Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.08,
                                          lineHeight: 1.43,
                                        ),
                                  ),
                                ].divide(const SizedBox(height: 4.0)),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lot Number',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'DM Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 0.08,
                                          lineHeight: 1.43,
                                        ),
                                  ),
                                  Visibility(
                                      visible: isPremium,
                                      child: Text(
                                        valueOrDefault<String>(
                                          _watch.lotNumber,
                                          '-',
                                        ),
                                        textAlign: TextAlign.start,
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
                                      )),
                                  Visibility(
                                      visible: !isPremium,
                                      child: Icon(
                                        FFIcons.klock,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 16.0,
                                      ))
                                ].divide(const SizedBox(height: 4.0)),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Location',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'DM Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 0.08,
                                          lineHeight: 1.43,
                                        ),
                                  ),
                                  Visibility(
                                      visible: isPremium,
                                      child: Text(
                                        valueOrDefault<String>(
                                          _watch.eventPublishTitle,
                                          '-',
                                        ),
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
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
                                      )),
                                  Visibility(
                                      visible: !isPremium,
                                      child: Icon(
                                        FFIcons.klock,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 16.0,
                                      ))
                                ].divide(const SizedBox(height: 4.0)),
                              ),
                            ),
                          ],
                        ),
                      ].divide(const SizedBox(height: 14.0)))),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () {
                              setState(() {
                                _model.showAllSpecifications =
                                    !_model.showAllSpecifications;
                                if (_model.showAllSpecifications) {
                                  _model.allSpecificationsTitle =
                                      'Less Specifications';
                                } else {
                                  _model.allSpecificationsTitle =
                                      'All Specifications';
                                }
                              });
                            },
                            text: _model.allSpecificationsTitle,
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              height: 36.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).lightGray,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'DM Sans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                    letterSpacing: 0.12,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.47,
                                  ),
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: isPremium
                              ? () async {
                                  await launchURL(_watch.sourceLink);
                                }
                              : null,
                          text: 'Go to Source',
                          icon: isPremium
                              ? null
                              : const Icon(
                                  FFIcons.klock,
                                  color: Colors.white,
                                  size: 16.0,
                                ),
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: 36.0,
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
                    ],
                  ),
                ),
              ),
            ].divide(const SizedBox(height: 14.0)),
          ),
        ),
      ),
    );
  }
}
