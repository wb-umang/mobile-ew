import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'price_guide_card_model.dart';
export 'price_guide_card_model.dart';

class PriceGuideCardWidget extends StatefulWidget {
  const PriceGuideCardWidget({
    super.key,
    String? numberOfAuctionWatches,
    String? medianAuctionValue,
    String? latestSalePrice,
    String? latestSaleDate,
    String? auctionRange,
    String? numberOfMarketplaceWatches,
    String? medianMarketplaceValue,
    String? marketplaceRange,
    required this.downArrow,
    required this.upArrow,
    String? unsold,
    String? soldBelowEstimate,
    String? soldWithinEstimate,
    String? soldAboveEstimate,
    String? unsoldRate,
    String? numberOfLots,
    String? brand,
    String? model,
    String? referenceNumber,
  })  : numberOfAuctionWatches = numberOfAuctionWatches ?? '0',
        medianAuctionValue = medianAuctionValue ?? '\$116.59K',
        latestSalePrice = latestSalePrice ?? '\$105.56K',
        latestSaleDate = latestSaleDate ?? '1 Feb 2024',
        auctionRange = auctionRange ?? '\$104.7K-129.38K',
        numberOfMarketplaceWatches = numberOfMarketplaceWatches ?? '0',
        medianMarketplaceValue = medianMarketplaceValue ?? '0',
        marketplaceRange = marketplaceRange ?? '\$0',
        unsold = unsold ?? '0',
        soldBelowEstimate = soldBelowEstimate ?? '0',
        soldWithinEstimate = soldWithinEstimate ?? '0',
        soldAboveEstimate = soldAboveEstimate ?? '0',
        unsoldRate = unsoldRate ?? '0%',
        numberOfLots = numberOfLots ?? '0',
        brand = brand ?? 'Rolex',
        model = model ?? 'GMT-Master II',
        referenceNumber = referenceNumber ?? '116710BLNR';

  final String numberOfAuctionWatches;
  final String medianAuctionValue;
  final String latestSalePrice;
  final String latestSaleDate;
  final String auctionRange;
  final String numberOfMarketplaceWatches;
  final String medianMarketplaceValue;
  final String marketplaceRange;
  final Widget? downArrow;
  final Widget? upArrow;
  final String unsold;
  final String soldBelowEstimate;
  final String soldWithinEstimate;
  final String soldAboveEstimate;
  final String unsoldRate;
  final String numberOfLots;
  final String brand;
  final String model;
  final String referenceNumber;

  @override
  State<PriceGuideCardWidget> createState() => _PriceGuideCardWidgetState();
}

class _PriceGuideCardWidgetState extends State<PriceGuideCardWidget> {
  late PriceGuideCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PriceGuideCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chartPieChartColorsList = [
      FlutterFlowTheme.of(context).error,
      FlutterFlowTheme.of(context).warm,
      FlutterFlowTheme.of(context).success,
      FlutterFlowTheme.of(context).primary
    ];
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Text(
                'Price Guide of:',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'DM Sans',
                      color: FlutterFlowTheme.of(context).primary,
                      letterSpacing: 0.12,
                      fontWeight: FontWeight.bold,
                      lineHeight: 1.43,
                    ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          // ToggleBrand
                          _model.brandSelected = true;
                          _model.modelSelected = false;
                          _model.referenceSelected = false;
                          safeSetState(() {});
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget.brand,
                                'Rolex',
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'DM Sans',
                                    color: _model.brandSelected
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondary,
                                    fontSize: 12.0,
                                    letterSpacing: 0.16,
                                    lineHeight: 1.33,
                                  ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.297,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: _model.brandSelected
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).border2,
                              ),
                            ),
                          ].divide(const SizedBox(height: 8.0)),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          // ToggleModel
                          _model.brandSelected = false;
                          _model.modelSelected = true;
                          _model.referenceSelected = false;
                          safeSetState(() {});
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget.model,
                                'GMT-Master II',
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'DM Sans',
                                    color: _model.modelSelected
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondary,
                                    fontSize: 12.0,
                                    letterSpacing: 0.16,
                                    lineHeight: 1.33,
                                  ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.297,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: _model.modelSelected
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).border2,
                              ),
                            ),
                          ].divide(const SizedBox(height: 8.0)),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          // ToggleReference
                          _model.brandSelected = false;
                          _model.modelSelected = false;
                          _model.referenceSelected = true;
                          safeSetState(() {});
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget.referenceNumber,
                                '116710BLNR',
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'DM Sans',
                                    color: _model.referenceSelected
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondary,
                                    fontSize: 12.0,
                                    letterSpacing: 0.16,
                                    lineHeight: 1.33,
                                  ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.297,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: _model.referenceSelected
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).border2,
                              ),
                            ),
                          ].divide(const SizedBox(height: 8.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
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
                            'Marketplace Range',
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
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Current Price',
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 12.0,
                                      letterSpacing: 0.16,
                                      lineHeight: 1.33,
                                    ),
                              ),
                              Text(
                                '(${valueOrDefault<String>(
                                  widget.numberOfMarketplaceWatches,
                                  '24',
                                )} Watches)',
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 12.0,
                                      letterSpacing: 0.16,
                                      lineHeight: 1.33,
                                    ),
                              ),
                            ].divide(const SizedBox(width: 4.0)),
                          ),
                        ],
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.marketplaceRange,
                          '\$116.44K-206.26K',
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Median Marketplace Value',
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
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Current Price',
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 12.0,
                                      letterSpacing: 0.16,
                                      lineHeight: 1.33,
                                    ),
                              ),
                              Text(
                                '(${valueOrDefault<String>(
                                  widget.numberOfMarketplaceWatches,
                                  '24',
                                )} Watches)',
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 12.0,
                                      letterSpacing: 0.16,
                                      lineHeight: 1.33,
                                    ),
                              ),
                            ].divide(const SizedBox(width: 4.0)),
                          ),
                        ],
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.medianMarketplaceValue,
                          '\$142.55K',
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Auction Range',
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
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Last 12 Months',
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 12.0,
                                      letterSpacing: 0.16,
                                      lineHeight: 1.33,
                                    ),
                              ),
                              Text(
                                '(${widget.numberOfAuctionWatches} Watches)',
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 12.0,
                                      letterSpacing: 0.16,
                                      lineHeight: 1.33,
                                    ),
                              ),
                            ].divide(const SizedBox(width: 4.0)),
                          ),
                        ],
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.auctionRange,
                          '\$104.7K-129.38K',
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Latest Sale Price',
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
                            valueOrDefault<String>(
                              widget.latestSaleDate,
                              '1 Feb 2024',
                            ),
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
                      Text(
                        valueOrDefault<String>(
                          widget.latestSalePrice,
                          '\$105.56K',
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Median Auction Value',
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
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Last 12 Months',
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 12.0,
                                      letterSpacing: 0.16,
                                      lineHeight: 1.33,
                                    ),
                              ),
                              Text(
                                '(${widget.numberOfAuctionWatches} Watches)',
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 12.0,
                                      letterSpacing: 0.16,
                                      lineHeight: 1.33,
                                    ),
                              ),
                            ].divide(const SizedBox(width: 4.0)),
                          ),
                        ],
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.medianAuctionValue,
                          '\$116.59K',
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
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 8.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).border2,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).lightGray,
                    ),
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
                                  'Performance at Auction',
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
                                Text(
                                  'Last 5 years',
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'DM Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 12.0,
                                        letterSpacing: 0.16,
                                        lineHeight: 1.33,
                                      ),
                                ),
                              ],
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.showPerformance =
                                    !_model.showPerformance;
                                safeSetState(() {});
                              },
                              child: _model.showPerformance
                                  ? widget.upArrow!
                                  : widget.downArrow!,
                            ),
                          ],
                        ),
                        Visibility(
                            visible: _model.showPerformance,
                            maintainState:
                                true, // Keeps the state of the widget
                            maintainAnimation: true, // Maintain animations
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).lightGray,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 155.0,
                                      height: 140.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .lightGray,
                                      ),
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: Stack(
                                        alignment: const AlignmentDirectional(
                                            0.0, 0.0),
                                        children: [
                                          SizedBox(
                                            width: 116.0,
                                            height: 116.0,
                                            child: FlutterFlowPieChart(
                                              data: FFPieChartData(
                                                values: List.generate(
                                                    random_data.randomInteger(
                                                        4, 4),
                                                    (index) => random_data
                                                        .randomInteger(0, 100)),
                                                colors: chartPieChartColorsList,
                                                radius: [14.0],
                                                borderColor: [
                                                  const Color(0x00000000)
                                                ],
                                              ),
                                              donutHoleRadius: 43.0,
                                              donutHoleColor:
                                                  Colors.transparent,
                                              sectionLabelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  widget.numberOfLots,
                                                  '382',
                                                ),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.08,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          lineHeight: 1.27,
                                                        ),
                                              ),
                                              Text(
                                                'Lots',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.2,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 8.0,
                                                  height: 8.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lightGray,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Unsold',
                                                  textAlign: TextAlign.start,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.16,
                                                        lineHeight: 1.33,
                                                      ),
                                                ),
                                              ].divide(
                                                  const SizedBox(width: 4.0)),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                widget.unsold,
                                                '200',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'DM Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.12,
                                                    fontWeight: FontWeight.bold,
                                                    lineHeight: 1.43,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 8.0,
                                                  height: 8.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lightGray,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Sold Below Estimate',
                                                  textAlign: TextAlign.start,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.16,
                                                        lineHeight: 1.33,
                                                      ),
                                                ),
                                              ].divide(
                                                  const SizedBox(width: 4.0)),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                widget.soldBelowEstimate,
                                                '79',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'DM Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.12,
                                                    fontWeight: FontWeight.bold,
                                                    lineHeight: 1.43,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 8.0,
                                                  height: 8.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lightGray,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warm,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Sold Within Estimate',
                                                  textAlign: TextAlign.start,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.16,
                                                        lineHeight: 1.33,
                                                      ),
                                                ),
                                              ].divide(
                                                  const SizedBox(width: 4.0)),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                widget.soldWithinEstimate,
                                                '19',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'DM Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.12,
                                                    fontWeight: FontWeight.bold,
                                                    lineHeight: 1.43,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 8.0,
                                                  height: 8.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lightGray,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Sold Above Estimate',
                                                  textAlign: TextAlign.start,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.16,
                                                        lineHeight: 1.33,
                                                      ),
                                                ),
                                              ].divide(
                                                  const SizedBox(width: 4.0)),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                widget.soldAboveEstimate,
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'DM Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.12,
                                                    fontWeight: FontWeight.bold,
                                                    lineHeight: 1.43,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Unsold Rate',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'DM Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.12,
                                                    fontWeight: FontWeight.bold,
                                                    lineHeight: 1.43,
                                                  ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                widget.unsoldRate,
                                                '84%',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'DM Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.12,
                                                    fontWeight: FontWeight.bold,
                                                    lineHeight: 1.43,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ].divide(const SizedBox(height: 8.0)),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ].divide(const SizedBox(height: 12.0)),
              ),
            ),
          ].divide(const SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
