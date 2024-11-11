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
import 'watch_page_model.dart';
export 'watch_page_model.dart';

class WatchPageWidget extends StatefulWidget {
  const WatchPageWidget({
    super.key,
    String? brand,
    this.ref,
    this.model,
    this.price,
  }) : brand = brand ?? 'Hublot';

  final String brand;
  final String? ref;
  final String? model;
  final String? price;

  @override
  State<WatchPageWidget> createState() => _WatchPageWidgetState();
}

class _WatchPageWidgetState extends State<WatchPageWidget> {
  late WatchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WatchPageModel());
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 30.0),
                                    child: PageView(
                                      controller: _model.pageViewController ??=
                                          PageController(initialPage: 0),
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/image_8236.png',
                                            height: 300.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/image_8236_(1).png',
                                            height: 300.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: smooth_page_indicator
                                          .SmoothPageIndicator(
                                        controller:
                                            _model.pageViewController ??=
                                                PageController(initialPage: 0),
                                        count: 2,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) async {
                                          await _model.pageViewController!
                                              .animateToPage(
                                            i,
                                            duration:
                                                const Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                          safeSetState(() {});
                                        },
                                        effect:
                                            smooth_page_indicator.SlideEffect(
                                          spacing: 13.0,
                                          radius: 3.0,
                                          dotWidth: 6.0,
                                          dotHeight: 6.0,
                                          dotColor: FlutterFlowTheme.of(context)
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
                                  color: FlutterFlowTheme.of(context).primary,
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
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.brand,
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.ref,
                                    'REF 704.OQ.1138.RX',
                                  ),
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
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          buttonSize: 48.0,
                                          icon: Icon(
                                            FFIcons.kicon,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.653,
                                        height: 32.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Text(
                                          valueOrDefault<String>(
                                            widget.model,
                                            'Big Bang King Power Grand Complication - Limited to 10 ',
                                          ),
                                          textAlign: TextAlign.start,
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
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
                                          safeSetState(() => _model.isFavorite =
                                              !_model.isFavorite);
                                        },
                                        value: _model.isFavorite,
                                        onIcon: Icon(
                                          Icons.favorite_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .badge,
                                          size: 24.0,
                                        ),
                                        offIcon: Icon(
                                          Icons.favorite_border,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 25.0,
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 0.0)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.price,
                                    'Estimates \$80.6K - \$98K',
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
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
                              Stack(
                                children: [
                                  if (_model
                                      .twoButtonPageMenuModel.isFirstSelected)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            wrapWithModel(
                                              model:
                                                  _model.auctionPriceCardModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: const AuctionPriceCardWidget(),
                                            ),
                                            wrapWithModel(
                                              model: _model
                                                  .specificationsCardModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: const SpecificationsCardWidget(),
                                            ),
                                            wrapWithModel(
                                              model: _model.priceGuideCardModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: PriceGuideCardWidget(
                                                numberOfAuctionWatches: '4',
                                                medianAuctionValue: '\$116.59K',
                                                latestSalePrice: '\$105.56K',
                                                latestSaleDate: '1 Feb 2024',
                                                auctionRange:
                                                    '\$104.7K-129.38K',
                                                numberOfMarketplaceWatches:
                                                    '24',
                                                medianMarketplaceValue:
                                                    '\$142.55K',
                                                marketplaceRange:
                                                    '\$116.44K-206.26K',
                                                downArrow: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 16.0,
                                                ),
                                                upArrow: Icon(
                                                  Icons.keyboard_arrow_up,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 16.0,
                                                ),
                                                unsold: '200',
                                                soldBelowEstimate: '79',
                                                soldWithinEstimate: '19',
                                                soldAboveEstimate: '0',
                                                unsoldRate: '84%',
                                                numberOfLots: '382',
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 12.0)),
                                        ),
                                      ),
                                    ),
                                  if (!_model
                                      .twoButtonPageMenuModel.isFirstSelected)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lightGray,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .border2,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      'Description.',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'DM Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            letterSpacing: 0.08,
                                                            lineHeight: 1.43,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(
                                                    const SizedBox(height: 14.0)),
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
  }
}
