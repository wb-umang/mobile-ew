import 'package:every_watch/backend/schema/structs/index.dart';
import 'package:every_watch/backend/schema/structs/watch_analysis_response_struct.dart';
import 'package:high_chart/high_chart.dart';

import '/backend/api_requests/api_calls.dart';
import '/components/auction_price_card/auction_price_card_widget.dart';
import '/components/pill_bold_button/pill_bold_button_widget.dart';
import '/components/price_guide_card/price_guide_card_widget.dart';
import '/components/specifications_card/specifications_card_widget.dart';
import '/components/two_button_page_menu/two_button_page_menu_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'watch_page_model.dart';
export 'watch_page_model.dart';

class WatchPageWidget extends StatefulWidget {
  const WatchPageWidget({super.key});

  @override
  State<WatchPageWidget> createState() => _WatchPageWidgetState();
}

class _WatchPageWidgetState extends State<WatchPageWidget> {
  late WatchPageModel _model;
  late WatchListingStruct _watch;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  final String _chartData = '''{
      credits: {
          enabled: false
      },
      title: {
          text: 'Combination chart'
      },
      xAxis: {
          categories: ['Apples', 'Oranges', 'Pears', 'Bananas', 'Plums']
      },
      yAxis: {
        title: {
          text: null
        },
      },
      labels: {
          items: [{
              html: 'Total fruit consumption',
              style: {
                  left: '50px',
                  top: '18px',
                  color: ( // theme
                      Highcharts.defaultOptions.title.style &&
                      Highcharts.defaultOptions.title.style.color
                  ) || 'black'
              }
          }]
      },
      series: [{
          type: 'spline',
          name: 'Average',
          data: [3, 2.67, 3, 6.33, 3.33],
          marker: {
              lineWidth: 2,
              lineColor: Highcharts.getOptions().colors[3],
              fillColor: 'white'
          }
      },]
    }''';

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WatchPageModel());
    _watch = FFAppState().watchListingStruct;
    _model.filter = createWatchAnalysisFilterStruct(watchId: _watch.watchId);
  }

  @override
  void dispose() {
    super.dispose();

    _model.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<ApiCallResponse>>(
      future: Future.wait([
        MutualWatchGroup.getWatchAnalysisByIdCall.call(
          accessToken: FFAppState().loginData.accessToken,
          variablesJson: _model.filter?.toMap(),
        ),
        MutualWatchGroup.getWatchDetailByIdCall.call(
          accessToken: FFAppState().loginData.accessToken,
          variablesJson: _model.filter?.toMap(),
        )
      ]),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final watchAnalysisResponse = snapshot.data![0];
        final watchAnalysis = WatchAnalysisResponseStruct.maybeFromMap(
                watchAnalysisResponse.jsonBody)
            ?.data
            .data
            .watchAnalysis;
        final watchDetailResponse = snapshot.data![1];
        final watchDetail =
            WatchDetailResponseStruct.maybeFromMap(watchDetailResponse.jsonBody)
                ?.data
                .data
                .data
                .watchDetails
                .watchDetail;
        final excludedFieldsWatchDetail =
            WatchDetailResponseStruct.maybeFromMap(watchDetailResponse.jsonBody)
                ?.data
                .extractWatchDetail();
        final isPremium = FFAppState().loginData.subscriptionTypeId == 1;
        List<Widget> watchImages = [];
        if (watchDetail?.watchImages != null) {
          for (var image in watchDetail!.watchImages) {
            watchImages.add(ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.network(image.original,
                  height: 300.0,
                  fit: BoxFit.cover, errorBuilder: (BuildContext context,
                      Object exception, StackTrace? stackTrace) {
                return const Center(child: Text('Failed to load image'));
              }),
            ));
          }
        }
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 52.0,
                icon: Icon(
                  FFIcons.kleft,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 32.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              actions: const [],
              centerTitle: true,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(24.0),
                            bottomRight: Radius.circular(24.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Stack(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            children: [
                              Container(
                                height: 330.0,
                                decoration: const BoxDecoration(),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 330.0,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 30.0),
                                        child: PageView(
                                          controller: _model
                                                  .pageViewController ??=
                                              PageController(initialPage: 0),
                                          scrollDirection: Axis.horizontal,
                                          children: watchImages,
                                        ),
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            0.0, 1.0),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 0.0, 12.0),
                                          child: smooth_page_indicator
                                              .SmoothPageIndicator(
                                            controller: _model
                                                    .pageViewController ??=
                                                PageController(initialPage: 0),
                                            count: watchImages.length,
                                            axisDirection: Axis.horizontal,
                                            onDotClicked: (i) async {
                                              await _model.pageViewController!
                                                  .animateToPage(
                                                i,
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                              safeSetState(() {});
                                            },
                                            effect: smooth_page_indicator
                                                .SlideEffect(
                                              spacing: 13.0,
                                              radius: 3.0,
                                              dotWidth: 6.0,
                                              dotHeight: 6.0,
                                              dotColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              activeDotColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              paintStyle: PaintingStyle.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 30.0),
                                child: wrapWithModel(
                                  model: _model.pillBoldButtonModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: PillBoldButtonWidget(
                                    title: 'Alert Me On Similar Watches',
                                    icon: Icon(
                                      FFIcons.kbox1,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 8.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        _watch.manufactureName,
                                        'Hublot',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'DM Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.12,
                                            fontWeight: FontWeight.bold,
                                            lineHeight: 1.43,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      'REF ${valueOrDefault(_watch.referenceNumber, '-')}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'DM Sans',
                                            fontSize: 11.0,
                                            letterSpacing: 0.2,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 4.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              buttonSize: 48.0,
                                              icon: Icon(
                                                FFIcons.kshare,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.653,
                                            height: 32.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Text(
                                              valueOrDefault<String>(
                                                _watch.modelName,
                                                '-',
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.16,
                                                        lineHeight: 1.33,
                                                      ),
                                            ),
                                          ),
                                          ToggleIcon(
                                            onPressed: () async {
                                              safeSetState(() =>
                                                  _model.isFavorite =
                                                      !_model.isFavorite);
                                            },
                                            value: _model.isFavorite,
                                            onIcon: Icon(
                                              Icons.favorite_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .badge,
                                              size: 24.0,
                                            ),
                                            offIcon: Icon(
                                              Icons.favorite_border,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 25.0,
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 0.0)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.twoButtonPageMenuModel,
                                      updateCallback: () => safeSetState(() {}),
                                      updateOnChange: true,
                                      child: const TwoButtonPageMenuWidget(
                                        firstTitle: 'Details',
                                        secondTitle: 'Description',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          HighCharts(
                                            loader: const SizedBox(
                                              width: 200,
                                              child: LinearProgressIndicator(),
                                            ),
                                            size: Size(
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                400),
                                            data: _chartData,
                                            scripts: const [
                                              "https://code.highcharts.com/highcharts.js",
                                              // 'https://code.highcharts.com/modules/networkgraph.js',
                                              // 'https://code.highcharts.com/modules/exporting.js',
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      if (_model.twoButtonPageMenuModel
                                          .isFirstSelected)
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 12.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                wrapWithModel(
                                                  model: _model
                                                      .auctionPriceCardModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: AuctionPriceCardWidget(
                                                    estimationPrice:
                                                        _watch.parsePrice(),
                                                    salePrice: _watch
                                                        .retailPrice
                                                        .toString(),
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .specificationsCardModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: SpecificationsCardWidget(
                                                      excludedFieldsWatchDetail:
                                                          excludedFieldsWatchDetail),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .priceGuideCardModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: PriceGuideCardWidget(
                                                    scrollController:
                                                        _scrollController,
                                                    watchAnalysis:
                                                        watchAnalysis,
                                                    downArrow: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 16.0,
                                                    ),
                                                    upArrow: Icon(
                                                      Icons.keyboard_arrow_up,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 16.0,
                                                    ),
                                                    brand:
                                                        _watch.manufactureName,
                                                    model: _watch.modelName,
                                                    referenceNumber:
                                                        _watch.referenceNumber,
                                                  ),
                                                ),
                                              ].divide(
                                                  const SizedBox(height: 12.0)),
                                            ),
                                          ),
                                        ),
                                      if (!_model.twoButtonPageMenuModel
                                          .isFirstSelected)
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 12.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 0.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lightGray,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .border2,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Text(
                                                          watchDetail
                                                                  ?.description ??
                                                              "No description.",
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'DM Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                letterSpacing:
                                                                    0.08,
                                                                lineHeight:
                                                                    1.43,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(const SizedBox(
                                                        height: 14.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
