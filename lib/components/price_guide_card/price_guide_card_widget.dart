import 'package:every_watch/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'price_guide_card_model.dart';
export 'price_guide_card_model.dart';

class PriceGuideCardWidget extends StatefulWidget {
  const PriceGuideCardWidget({
    super.key,
    required this.watchAnalysis,
    required this.downArrow,
    required this.upArrow,
    String? auctionLotType,
    String? brand,
    String? model,
    String? referenceNumber,
  })  : auctionLotType = auctionLotType ?? 'UPCOMING',
        brand = brand ?? 'Rolex',
        model = model ?? 'GMT-Master II',
        referenceNumber = referenceNumber ?? '116710BLNR';

  final WatchAnalysisStruct? watchAnalysis;
  final Widget? downArrow;
  final Widget? upArrow;
  final String auctionLotType;
  final String brand;
  final String model;
  final String referenceNumber;

  @override
  State<PriceGuideCardWidget> createState() => _PriceGuideCardWidgetState();
}

class _PriceGuideCardWidgetState extends State<PriceGuideCardWidget> {
  late PriceGuideCardModel _model;
  late PriceAnalysisStruct? _priceAnalysis;
  String _auctionValueTitle = 'Median Auction Value';
  String _auctionValueSubtitle = '';
  String _salePriceTitle = 'Latest Sale Price';
  String _salePriceSubtitle = '';
  String _salePrice = '';
  String _rangeTitle = 'Auction Range';
  String _rangeSubtitle = '';
  String _rangePrice = '';
  String _dealersValueTitle = 'Median Dealers Value';
  String _dealersValueSubtitle = '';
  String _dealersPrice = '';
  String _dealersRangeTitle = 'Dealers Range';
  String _dealersRangeSubtitle = '';
  String _dealersRangePrice = '';
  String _numberOfWatches = '';
  String _numberOfWatchesDealers = '';
  String _auctionValue = '';

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PriceGuideCardModel());
    _priceAnalysis = widget.watchAnalysis?.referenceNumberPriceAnalysis;
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_model.brandSelected) {
      _priceAnalysis = widget.watchAnalysis?.manufacturerPriceAnalysis;
    } else if (_model.modelSelected) {
      _priceAnalysis = widget.watchAnalysis?.modelPriceAnalysis;
    } else if (_model.referenceSelected) {
      _priceAnalysis = widget.watchAnalysis?.referenceNumberPriceAnalysis;
    }
    _numberOfWatches =
        '(${_priceAnalysis?.auctionPriceMedian?.count.toString()} Watches)';
    _numberOfWatchesDealers =
        '(${_priceAnalysis?.marketPlacePriceMedian?.count.toString()} Watches)';
    _auctionValue =
        '(${_priceAnalysis?.auctionPriceMedian?.realUsd.toString()} USD)';
    var now = DateTime.now();
    var auctionValueMonthsDiff =
        calculateMonthDifference(_priceAnalysis?.medianMinDate ?? now, now);
    _auctionValueSubtitle =
        'Last $auctionValueMonthsDiff months $_numberOfWatches';
    _salePriceSubtitle = dateTimeFormat('D MMM YYYY',
        _priceAnalysis?.auctionPriceAnalysis?.auctionLatestSalesDate);
    _salePrice =
        '${_priceAnalysis?.auctionPriceAnalysis?.auctionLatestSalesPriceUsd} USD';
    var rangeMonthsDiff =
        calculateMonthDifference(_priceAnalysis?.analysisMinDate ?? now, now);
    _rangeSubtitle = 'Last $rangeMonthsDiff months $_numberOfWatches';
    _rangePrice =
        '${_priceAnalysis?.auctionPriceMedian?.minPriceUsd.toString()} - ${_priceAnalysis?.auctionPriceMedian?.maxPriceUsd.toString()} USD';
    _dealersValueSubtitle = 'Current price $_numberOfWatchesDealers';
    _dealersPrice = '${_priceAnalysis?.marketPlacePriceMedian?.realUsd} USD';
    _dealersRangeSubtitle = 'Current price $_numberOfWatchesDealers';
    _dealersRangePrice =
        '${_priceAnalysis?.marketPlacePriceMedian?.minPriceUsd.toString()} - ${_priceAnalysis?.marketPlacePriceMedian?.maxPriceUsd.toString()} USD';
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
                            _auctionValueTitle,
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
                                _auctionValueSubtitle,
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
                        _auctionValue,
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
                            _salePriceTitle,
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
                                _salePriceSubtitle,
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
                        _salePrice,
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
                            _rangeTitle,
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
                                _rangeSubtitle,
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
                        _rangePrice,
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
                            _dealersValueTitle,
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
                            _dealersValueSubtitle,
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
                        _dealersPrice,
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
                            _dealersRangeTitle,
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
                                _dealersRangeSubtitle,
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
                        _dealersRangePrice,
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
                                                values: [0, 1, 2, 3],
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
                                                  _priceAnalysis
                                                      ?.auctionPriceAnalysis
                                                      ?.totalLots
                                                      .toString(),
                                                  '0',
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
                                                _priceAnalysis
                                                    ?.auctionPriceAnalysis
                                                    ?.unsold
                                                    .toString(),
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
                                                _priceAnalysis
                                                    ?.auctionPriceAnalysis
                                                    ?.belowEstimate
                                                    .toString(),
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
                                                _priceAnalysis
                                                    ?.auctionPriceAnalysis
                                                    ?.withinEstimate
                                                    .toString(),
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
                                                _priceAnalysis
                                                    ?.auctionPriceAnalysis
                                                    ?.aboveEstimate
                                                    .toString(),
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
                                              '${_priceAnalysis?.auctionPriceAnalysis?.unsoldRate.toInt()}%',
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

int calculateMonthDifference(DateTime startDate, DateTime endDate) {
  return (endDate.year * 12 + endDate.month) -
      (startDate.year * 12 + startDate.month);
}
