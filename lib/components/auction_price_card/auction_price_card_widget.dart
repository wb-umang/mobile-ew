import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'auction_price_card_model.dart';
export 'auction_price_card_model.dart';

class AuctionPriceCardWidget extends StatefulWidget {
  const AuctionPriceCardWidget({
    super.key,
    String? estimationPrice,
    String? salePrice,
    String? buyersPremium,
  })  : estimationPrice = estimationPrice ?? '\$15.5K - 20K',
        salePrice = salePrice ?? '\$22.325K',
        buyersPremium = buyersPremium ?? '10%';

  final String estimationPrice;
  final String salePrice;
  final String buyersPremium;

  @override
  State<AuctionPriceCardWidget> createState() => _AuctionPriceCardWidgetState();
}

class _AuctionPriceCardWidgetState extends State<AuctionPriceCardWidget> {
  late AuctionPriceCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuctionPriceCardModel());
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Estimates',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'DM Sans',
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.08,
                              lineHeight: 1.43,
                            ),
                      ),
                      Text(
                        'The buyer\'s fee will be included',
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'DM Sans',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 12.0,
                              letterSpacing: 0.16,
                              lineHeight: 1.33,
                            ),
                      ),
                    ],
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget.estimationPrice,
                      '\$15.5K - 20K',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'DM Sans',
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.12,
                          fontWeight: FontWeight.bold,
                          lineHeight: 1.43,
                        ),
                  ),
                ],
              ),
              Visibility(
                  visible: widget.salePrice != "0.0",
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sale Price',
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
                          Text(
                            'Hammer, Buyer\'s premium \nare included',
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 12.0,
                                  letterSpacing: 0.16,
                                  lineHeight: 1.33,
                                ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.salePrice,
                              '\$22.325K',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.12,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.43,
                                ),
                          ),
                          Text(
                            '(Beat EST by 10%)',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.of(context).success,
                                  fontSize: 12.0,
                                  letterSpacing: 0.16,
                                  lineHeight: 1.33,
                                ),
                          ),
                        ],
                      ),
                    ],
                  )),
              Visibility(
                visible: _model.showBuyersPremium,
                maintainState: true, // Keeps the state of the widget
                maintainAnimation: true, // Maintain animations
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Buyer\'s Premium',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'DM Sans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.08,
                                    lineHeight: 1.43,
                                  ),
                        ),
                        Text(
                          'An additional amount that the buyer \nhas to pay on top of the item\'s \nhammer price.',
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'DM Sans',
                                color: FlutterFlowTheme.of(context).secondary,
                                fontSize: 12.0,
                                letterSpacing: 0.16,
                                lineHeight: 1.33,
                              ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.buyersPremium,
                            '10%',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'DM Sans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.12,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.43,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: isPremium
                      ? () {
                          setState(() {
                            _model.showBuyersPremium =
                                !_model.showBuyersPremium;
                            if (_model.showBuyersPremium) {
                              _model.buyersPremiumTitle =
                                  'Hide Buyers Fee Details';
                            } else {
                              _model.buyersPremiumTitle = 'Buyers Fee Details';
                            }
                          });
                        }
                      : null,
                  text: _model.buyersPremiumTitle,
                  icon: isPremium
                      ? null
                      : Icon(
                          FFIcons.klock,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 16.0,
                        ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 36.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        24.0, 0.0, 24.0, 0.0),
                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).lightGray,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
            ].divide(const SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
