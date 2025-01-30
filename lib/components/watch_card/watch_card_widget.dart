import '/components/watch_tag/watch_tag_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'watch_card_model.dart';
export 'watch_card_model.dart';

class WatchCardWidget extends StatefulWidget {
  const WatchCardWidget({
    super.key,
    String? brand,
    String? model,
    String? priceTitle,
    String? price,
    String? auctionLocation,
    String? auctionDate,
    String? auctionLotType,
    this.imagePath,
  })  : brand = brand ?? '-',
        model = model ?? '-',
        priceTitle = priceTitle ?? '-',
        price = price ?? '-',
        auctionLocation = auctionLocation ?? '-',
        auctionDate = auctionDate ?? '-',
        auctionLotType = auctionLotType ?? '-';

  final String brand;
  final String model;
  final String priceTitle;
  final String price;
  final String auctionLocation;
  final String auctionDate;
  final String auctionLotType;
  final String? imagePath;

  @override
  State<WatchCardWidget> createState() => _WatchCardWidgetState();
}

class _WatchCardWidgetState extends State<WatchCardWidget> {
  late WatchCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WatchCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPremium = FFAppState().loginData.subscriptionTypeId == 1;
    return Material(
      color: Colors.transparent,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).border,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          4.0, 4.0, 4.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                          widget.imagePath!,
                          width: double.infinity,
                          height: 130.0,
                          fit: BoxFit.fitHeight,
                          alignment: const Alignment(0.0, 0.0),
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Text('Failed to load image');
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 8.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.brand,
                          '-',
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'DM Sans',
                              fontSize: 12.0,
                              letterSpacing: 0.18,
                              fontWeight: FontWeight.bold,
                              lineHeight: 1.33,
                            ),
                      ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.model,
                        '-',
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'DM Sans',
                            fontSize: 12.0,
                            letterSpacing: 0.16,
                            lineHeight: 1.33,
                          ),
                    ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(1.0, 0.0),
                  child: ToggleIcon(
                    onPressed: () async {
                      safeSetState(
                          () => _model.isFollowed = !_model.isFollowed);
                    },
                    value: _model.isFollowed,
                    onIcon: Icon(
                      Icons.favorite_outlined,
                      color: FlutterFlowTheme.of(context).badge,
                      size: 24.0,
                    ),
                    offIcon: Icon(
                      Icons.favorite_border,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 25.0,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.watchTagModel,
                    updateCallback: () => safeSetState(() {}),
                    child: WatchTagWidget(
                      title: widget.auctionLotType == 'RESULT'
                          ? 'LIVE AUCTION'
                          : 'MARKETPLACE',
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).appBar,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).border,
                      width: 1.0,
                    ),
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.priceTitle,
                            'Estimates',
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'DM Sans',
                                    fontSize: 12.0,
                                    letterSpacing: 0.16,
                                    lineHeight: 1.33,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.price,
                            '-',
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'DM Sans',
                                    fontSize: 12.0,
                                    letterSpacing: 0.18,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.33,
                                  ),
                        ),
                        if (_model.isAuction)
                          Visibility(
                              visible: isPremium,
                              child: Text(
                                valueOrDefault<String>(
                                  widget.auctionLocation,
                                  '-',
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      fontSize: 12.0,
                                      letterSpacing: 0.16,
                                      lineHeight: 1.33,
                                    ),
                              )),
                        Visibility(
                            visible: !isPremium,
                            child: Icon(
                              FFIcons.klock,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 16.0,
                            )),
                        if (_model.isAuction)
                          Visibility(
                              visible: isPremium,
                              child: Text(
                                valueOrDefault<String>(
                                  widget.auctionDate,
                                  '-',
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      fontSize: 12.0,
                                      letterSpacing: 0.16,
                                      lineHeight: 1.33,
                                    ),
                              )),
                        Visibility(
                            visible: !isPremium,
                            child: Icon(
                              FFIcons.klock,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 16.0,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
