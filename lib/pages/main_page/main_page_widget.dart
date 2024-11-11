import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/icon_button/icon_button_widget.dart';
import '/components/pill_button/pill_button_widget.dart';
import '/components/profile_row/profile_row_widget.dart';
import '/components/referral_dialog/referral_dialog_widget.dart';
import '/components/search_bar/search_bar_widget.dart';
import '/components/separator_icon/separator_icon_widget.dart';
import '/components/small_arrow_button/small_arrow_button_widget.dart';
import '/components/toggle_button/toggle_button_widget.dart';
import '/components/watch_card/watch_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'main_page_model.dart';
export 'main_page_model.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget>
    with TickerProviderStateMixin {
  late MainPageModel _model;
  late SearchBarModel _searchBarModel;
  final TextEditingController _searchController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPageModel());

    _searchBarModel = _model.searchBarModel;
    _searchController.addListener(_handleTextChange);
    _searchBarModel.textController = _searchController;

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      WatchListingFilterStruct appStateFilter = FFAppState().watchListingFilter;
      if (appStateFilter.filterData.auctionType.isEmpty) {
        FFAppState().watchListingFilter = WatchListingFilterStruct(
          filterData: FilterDataStruct(
            currencyMode: 'USD',
            auctionType: ['listing'],
          ),
          sortType: 'asc',
          sortColumn: 'relevance',
          from: 0,
          size: 30,
        );
      }
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  void _handleTextChange() {
    String text = _searchBarModel.textController?.text ?? '';
    _model.searchQuery = text;
    safeSetState(() {});
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: MutualWatchGroup.watchListingCall.call(
        accessToken: FFAppState().loginData.accessToken,
        variablesJson: FFAppState().watchListingFilter.toMap(),
      ),
      builder: (context, snapshot) {
        WatchListingFilterStruct filter = FFAppState().watchListingFilter;
        var searchResults = _model.searchResults.toMap();

        // Customize what your widget looks like when it's loading.
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
        final mainPageWatchListingResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: SafeArea(
                top: true,
                child: Column(
                  children: [
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          KeepAliveWidgetWrapper(
                            builder: (context) => Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    StickyHeader(
                                      overlapHeaders: false,
                                      header: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(24.0),
                                            bottomRight: Radius.circular(24.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Flexible(
                                                    child: wrapWithModel(
                                                      model: _searchBarModel,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          const SearchBarWidget(
                                                        searchLabel:
                                                            'Search Watch',
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        safeSetState(() {
                                                          _model
                                                              .tabBarController!
                                                              .animateTo(
                                                            2,
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        300),
                                                            curve: Curves.ease,
                                                          );
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 46.0,
                                                        height: 44.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .appBar,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/Profile.png',
                                                              width: 24.0,
                                                              height: 24.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(
                                                    width: 12.0)),
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 16.0, 0.0, 12.0),
                                                child: Stack(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0, 0),
                                                  children: [
                                                    SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          wrapWithModel(
                                                            model: _model
                                                                .iconButtonModel1,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            updateOnChange:
                                                                true,
                                                            child:
                                                                IconButtonWidget(
                                                              name: 'Available',
                                                              icon: Icon(
                                                                FFIcons
                                                                    .kwaiting,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 16.0,
                                                              ),
                                                              isInitiallySelected:
                                                                  true,
                                                              selectedAction:
                                                                  () async {
                                                                FFAppState()
                                                                    .updateWatchListingFilter(
                                                                  (e) => e
                                                                    ..filterData =
                                                                        FilterDataStruct(
                                                                      auctionType: [
                                                                        'listing'
                                                                      ],
                                                                    ),
                                                                );
                                                                _model.isAvailable =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                          ),
                                                          wrapWithModel(
                                                            model: _model
                                                                .iconButtonModel2,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            updateOnChange:
                                                                true,
                                                            child:
                                                                IconButtonWidget(
                                                              name:
                                                                  'Historical',
                                                              icon: Icon(
                                                                FFIcons
                                                                    .kresetSettings,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 16.0,
                                                              ),
                                                              selectedAction:
                                                                  () async {
                                                                FFAppState()
                                                                    .updateWatchListingFilter(
                                                                  (e) => e
                                                                    ..filterData =
                                                                        FilterDataStruct(
                                                                      auctionType: [
                                                                        'historical'
                                                                      ],
                                                                    ),
                                                                );
                                                                _model.isAvailable =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ),
                                                    Container(
                                                        width: double.infinity,
                                                        height: MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .height *
                                                            0.9,
                                                        decoration: BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground),
                                                        child: FutureBuilder<
                                                                ApiCallResponse>(
                                                            future: MutualWatchGroup
                                                                .watchFiltersGraphQLCall
                                                                .call(
                                                              queryName:
                                                                  'SearchResults',
                                                              variablesJson:
                                                                  searchResults,
                                                              authorization:
                                                                  FFAppState()
                                                                      .loginData
                                                                      .accessToken,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              return const Text(
                                                                  'Test');
                                                            }))
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(24.0),
                                                  topRight:
                                                      Radius.circular(24.0),
                                                ),
                                              ),
                                              child: SingleChildScrollView(
                                                primary: false,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                16.0, 0.0, 0.0),
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .border,
                                                                borderRadius:
                                                                    12.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    32.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .appBar,
                                                                icon: Icon(
                                                                  FFIcons.ksort,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 16.0,
                                                                ),
                                                                onPressed: () {
                                                                  print(
                                                                      'IconButton pressed ...');
                                                                },
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .pillButtonModel1,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      PillButtonWidget(
                                                                    title:
                                                                        'Filters',
                                                                    icon: Icon(
                                                                      FFIcons
                                                                          .kparameters,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          16.0,
                                                                    ),
                                                                    pressAction:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'FiltersPage',
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          kTransitionInfoKey:
                                                                              const TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.bottomToTop,
                                                                          ),
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .toggleButtonModel1,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  updateOnChange:
                                                                      true,
                                                                  child:
                                                                      ToggleButtonWidget(
                                                                    title:
                                                                        'Upcoming Auctions',
                                                                    isSelected:
                                                                        false,
                                                                    count: () {
                                                                      if (FFAppState()
                                                                          .watchListingFilter
                                                                          .filterData
                                                                          .auctionType
                                                                          .contains(
                                                                              'upcomingLive')) {
                                                                        return WatchListingResponseStruct.maybeFromMap(mainPageWatchListingResponse.jsonBody)
                                                                            ?.data
                                                                            .data
                                                                            .data
                                                                            .auctionWiseListing
                                                                            .count
                                                                            .toString();
                                                                      } else if (FFAppState()
                                                                          .watchListingFilter
                                                                          .filterData
                                                                          .auctionType
                                                                          .contains(
                                                                              'result')) {
                                                                        return WatchListingResponseStruct.maybeFromMap(mainPageWatchListingResponse.jsonBody)
                                                                            ?.data
                                                                            .data
                                                                            .data
                                                                            .auctionWiseListing
                                                                            .count
                                                                            .toString();
                                                                      } else {
                                                                        return null;
                                                                      }
                                                                    }(),
                                                                    selectedAction:
                                                                        () async {
                                                                      if (_model
                                                                          .isAvailable) {
                                                                        FFAppState()
                                                                            .updateWatchListingFilter(
                                                                          (e) => e
                                                                            ..filterData = FilterDataStruct(
                                                                              auctionType: [
                                                                                'upcomingLive'
                                                                              ],
                                                                            ),
                                                                        );
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        FFAppState()
                                                                            .updateWatchListingFilter(
                                                                          (e) => e
                                                                            ..filterData = FilterDataStruct(
                                                                              auctionType: [
                                                                                'result'
                                                                              ],
                                                                            ),
                                                                        );
                                                                        safeSetState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    unselectedAction:
                                                                        () async {},
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .toggleButtonModel2,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  updateOnChange:
                                                                      true,
                                                                  child:
                                                                      ToggleButtonWidget(
                                                                    title:
                                                                        'Marketplace',
                                                                    isSelected:
                                                                        false,
                                                                    count: FFAppState()
                                                                            .watchListingFilter
                                                                            .filterData
                                                                            .auctionType
                                                                            .contains(
                                                                                'marketplace')
                                                                        ? WatchListingResponseStruct.maybeFromMap(mainPageWatchListingResponse.jsonBody)
                                                                            ?.data
                                                                            .data
                                                                            .data
                                                                            .auctionWiseListing
                                                                            .count
                                                                            .toString()
                                                                        : null,
                                                                    selectedAction:
                                                                        () async {
                                                                      if (_model
                                                                          .isAvailable) {
                                                                        FFAppState()
                                                                            .updateWatchListingFilter(
                                                                          (e) => e
                                                                            ..filterData = FilterDataStruct(
                                                                              auctionType: [
                                                                                'marketplace'
                                                                              ],
                                                                            ),
                                                                        );
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        FFAppState()
                                                                            .updateWatchListingFilter(
                                                                          (e) => e
                                                                            ..filterData = FilterDataStruct(
                                                                              auctionType: [
                                                                                'marketplaceArchive'
                                                                              ],
                                                                            ),
                                                                        );
                                                                        safeSetState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    unselectedAction:
                                                                        () async {},
                                                                  ),
                                                                ),
                                                              ),
                                                            ]
                                                                .divide(
                                                                    const SizedBox(
                                                                        width:
                                                                            8.0))
                                                                .addToStart(
                                                                    const SizedBox(
                                                                        width:
                                                                            20.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Stack(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  20.0,
                                                                  12.0,
                                                                  20.0,
                                                                  0.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final watchListings = WatchListingResponseStruct.maybeFromMap(
                                                                          mainPageWatchListingResponse
                                                                              .jsonBody)
                                                                      ?.data
                                                                      .data
                                                                      .data
                                                                      .auctionWiseListing
                                                                      .allWatchListings
                                                                      .toList() ??
                                                                  [];

                                                              return RefreshIndicator(
                                                                onRefresh:
                                                                    () async {},
                                                                child: GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        2,
                                                                    crossAxisSpacing:
                                                                        4.0,
                                                                    mainAxisSpacing:
                                                                        4.0,
                                                                    childAspectRatio:
                                                                        0.6,
                                                                  ),
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      watchListings
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          watchListingsIndex) {
                                                                    final watchListingsItem =
                                                                        watchListings[
                                                                            watchListingsIndex];
                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context.pushNamed(
                                                                            'WatchPage');
                                                                      },
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .watchCardModels1
                                                                            .getModel(
                                                                          watchListingsItem
                                                                              .watchId
                                                                              .toString(),
                                                                          watchListingsIndex,
                                                                        ),
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            WatchCardWidget(
                                                                          key:
                                                                              Key(
                                                                            'Keyn5s_${watchListingsItem.watchId.toString()}',
                                                                          ),
                                                                          brand:
                                                                              valueOrDefault<String>(
                                                                            watchListingsItem.manufactureName,
                                                                            '-',
                                                                          ),
                                                                          model:
                                                                              valueOrDefault<String>(
                                                                            watchListingsItem.modelName,
                                                                            '-',
                                                                          ),
                                                                          priceTitle:
                                                                              'Estimates',
                                                                          price:
                                                                              '\$${valueOrDefault<String>(
                                                                            watchListingsItem.minEstUsd.toString(),
                                                                            '-',
                                                                          )} - \$${valueOrDefault<String>(
                                                                            watchListingsItem.maxEstUsd.toString(),
                                                                            '-',
                                                                          )}',
                                                                          auctionLocation:
                                                                              'Phillips Bacs & Russo, Switzerland',
                                                                          auctionDate:
                                                                              'May 14 - May 18',
                                                                          imagePath: watchListingsItem
                                                                              .primaryImage
                                                                              .preview768,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    StickyHeader(
                                      overlapHeaders: false,
                                      header: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(24.0),
                                            bottomRight: Radius.circular(24.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Followed',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        lineHeight: 1.5,
                                                      ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 16.0, 0.0, 12.0),
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    wrapWithModel(
                                                      model: _model
                                                          .iconButtonModel3,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      updateOnChange: true,
                                                      child: IconButtonWidget(
                                                        name: 'For You',
                                                        icon: Icon(
                                                          FFIcons.klike,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 16.0,
                                                        ),
                                                        selectedAction:
                                                            () async {},
                                                      ),
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .iconButtonModel4,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      updateOnChange: true,
                                                      child: IconButtonWidget(
                                                        name: 'Available',
                                                        icon: Icon(
                                                          FFIcons.kwaiting,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 16.0,
                                                        ),
                                                        selectedAction:
                                                            () async {},
                                                      ),
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .iconButtonModel5,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      updateOnChange: true,
                                                      child: IconButtonWidget(
                                                        name: 'Historical',
                                                        icon: Icon(
                                                          FFIcons
                                                              .kresetSettings,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 16.0,
                                                        ),
                                                        selectedAction:
                                                            () async {},
                                                      ),
                                                    ),
                                                  ].divide(const SizedBox(
                                                      width: 4.0)),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      20.0, 12.0, 20.0, 0.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: (_model
                                                            .apiRequestCompleter ??=
                                                        Completer<
                                                            ApiCallResponse>()
                                                          ..complete(
                                                              MutualWatchGroup
                                                                  .watchListingCall
                                                                  .call(
                                                            accessToken:
                                                                FFAppState()
                                                                    .loginData
                                                                    .accessToken,
                                                            variablesJson: {
                                                              "filterData": {
                                                                "currencyMode":
                                                                    "USD",
                                                                "auctionType": [
                                                                  "listing"
                                                                ]
                                                              },
                                                              "sortType": "asc",
                                                              "sortColumn":
                                                                  "relevance",
                                                              "from": 0,
                                                              "size": 30
                                                            },
                                                          )))
                                                    .future,
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final gridViewWatchListingResponse =
                                                      snapshot.data!;

                                                  return Builder(
                                                    builder: (context) {
                                                      final watchListings = WatchListingResponseStruct
                                                                  .maybeFromMap(
                                                                      gridViewWatchListingResponse
                                                                          .jsonBody)
                                                              ?.data
                                                              .data
                                                              .data
                                                              .auctionWiseListing
                                                              .allWatchListings
                                                              .toList() ??
                                                          [];

                                                      return RefreshIndicator(
                                                        onRefresh: () async {
                                                          safeSetState(() =>
                                                              _model.apiRequestCompleter =
                                                                  null);
                                                          await _model
                                                              .waitForApiRequestCompleted();
                                                        },
                                                        child: GridView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          gridDelegate:
                                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            crossAxisSpacing:
                                                                4.0,
                                                            mainAxisSpacing:
                                                                4.0,
                                                            childAspectRatio:
                                                                0.6,
                                                          ),
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              watchListings
                                                                  .length,
                                                          itemBuilder: (context,
                                                              watchListingsIndex) {
                                                            final watchListingsItem =
                                                                watchListings[
                                                                    watchListingsIndex];
                                                            return InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context.pushNamed(
                                                                    'WatchPage');
                                                              },
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .watchCardModels2
                                                                    .getModel(
                                                                  watchListingsItem
                                                                      .watchId
                                                                      .toString(),
                                                                  watchListingsIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    WatchCardWidget(
                                                                  key: Key(
                                                                    'Keynaw_${watchListingsItem.watchId.toString()}',
                                                                  ),
                                                                  brand:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    watchListingsItem
                                                                        .manufactureName,
                                                                    '-',
                                                                  ),
                                                                  model:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    watchListingsItem
                                                                        .modelName,
                                                                    '-',
                                                                  ),
                                                                  priceTitle:
                                                                      'Estimates',
                                                                  price:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    '\$${valueOrDefault<String>(
                                                                      watchListingsItem
                                                                          .minEstUsd
                                                                          .toString(),
                                                                      '-',
                                                                    )} - \$${valueOrDefault<String>(
                                                                      watchListingsItem
                                                                          .maxEstUsd
                                                                          .toString(),
                                                                      '-',
                                                                    )}',
                                                                    '-',
                                                                  ),
                                                                  auctionLocation:
                                                                      'Phillips Bacs & Russo, Switzerland',
                                                                  auctionDate:
                                                                      'May 14 - May 18',
                                                                  imagePath: watchListingsItem
                                                                      .primaryImage
                                                                      .original,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(24.0),
                                                  topRight:
                                                      Radius.circular(24.0),
                                                ),
                                              ),
                                              child: SingleChildScrollView(
                                                primary: false,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                16.0, 0.0, 0.0),
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .border,
                                                                borderRadius:
                                                                    12.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    32.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .appBar,
                                                                icon: Icon(
                                                                  FFIcons.ksort,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 16.0,
                                                                ),
                                                                onPressed: () {
                                                                  print(
                                                                      'IconButton pressed ...');
                                                                },
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .pillButtonModel2,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      PillButtonWidget(
                                                                    title:
                                                                        'Filters',
                                                                    icon: Icon(
                                                                      FFIcons
                                                                          .kparameters,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          16.0,
                                                                    ),
                                                                    pressAction:
                                                                        () async {},
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .toggleButtonModel3,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      ToggleButtonWidget(
                                                                    title:
                                                                        'Upcoming Auctions',
                                                                    isSelected:
                                                                        false,
                                                                    count:
                                                                        '9,256',
                                                                    selectedAction:
                                                                        () async {},
                                                                    unselectedAction:
                                                                        () async {},
                                                                  ),
                                                                ),
                                                              ),
                                                            ]
                                                                .divide(
                                                                    const SizedBox(
                                                                        width:
                                                                            8.0))
                                                                .addToStart(
                                                                    const SizedBox(
                                                                        width:
                                                                            20.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    StickyHeader(
                                      overlapHeaders: false,
                                      header: Container(
                                        width: double.infinity,
                                        height: 52.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(24.0),
                                            bottomRight: Radius.circular(24.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                        ),
                                        child: Align(
                                          alignment: const AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Text(
                                            'Profile',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'DM Sans',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.16,
                                                  fontWeight: FontWeight.bold,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(24.0),
                                                  topRight:
                                                      Radius.circular(24.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        20.0, 12.0, 20.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/Avatar.png',
                                                        width: 80.0,
                                                        height: 80.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${valueOrDefault<String>(
                                                        FFAppState()
                                                            .loginData
                                                            .firstName,
                                                        'Cameron',
                                                      )} ${valueOrDefault<String>(
                                                        FFAppState()
                                                            .loginData
                                                            .lastName,
                                                        'Williamson',
                                                      )}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'DM Sans',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            lineHeight: 1.5,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0.0,
                                                              4.0, 0.0, 0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                              'SettingsPage');
                                                        },
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .smallArrowButtonModel,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              const SmallArrowButtonWidget(
                                                            title: 'Settings',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                24.0, 0.0, 0.0),
                                                        child: ListView(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lightGray,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              24.0),
                                                                ),
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        8.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              44.0,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              wrapWithModel(
                                                                            model:
                                                                                _model.profileRowModel1,
                                                                            updateCallback: () =>
                                                                                safeSetState(() {}),
                                                                            child:
                                                                                ProfileRowWidget(
                                                                              title: 'Compare',
                                                                              label: '6',
                                                                              icon: Icon(
                                                                                FFIcons.kicon1,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        wrapWithModel(
                                                                          model:
                                                                              _model.separatorIconModel1,
                                                                          updateCallback: () =>
                                                                              safeSetState(() {}),
                                                                          child:
                                                                              SeparatorIconWidget(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).border3,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              44.0,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              wrapWithModel(
                                                                            model:
                                                                                _model.profileRowModel2,
                                                                            updateCallback: () =>
                                                                                safeSetState(() {}),
                                                                            child:
                                                                                ProfileRowWidget(
                                                                              title: 'Collection',
                                                                              label: '18',
                                                                              icon: Icon(
                                                                                FFIcons.kbox,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        wrapWithModel(
                                                                          model:
                                                                              _model.separatorIconModel2,
                                                                          updateCallback: () =>
                                                                              safeSetState(() {}),
                                                                          child:
                                                                              SeparatorIconWidget(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).border3,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              44.0,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              wrapWithModel(
                                                                            model:
                                                                                _model.profileRowModel3,
                                                                            updateCallback: () =>
                                                                                safeSetState(() {}),
                                                                            child:
                                                                                ProfileRowWidget(
                                                                              title: 'Favorite',
                                                                              label: '24',
                                                                              icon: Icon(
                                                                                FFIcons.kicon2,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 24.0,
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
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lightGray,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              24.0),
                                                                ),
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        8.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              44.0,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed('NotificationsPage');
                                                                            },
                                                                            child:
                                                                                wrapWithModel(
                                                                              model: _model.profileRowModel4,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: ProfileRowWidget(
                                                                                title: 'Notifications',
                                                                                icon: Icon(
                                                                                  FFIcons.kicon3,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        wrapWithModel(
                                                                          model:
                                                                              _model.separatorIconModel3,
                                                                          updateCallback: () =>
                                                                              safeSetState(() {}),
                                                                          child:
                                                                              SeparatorIconWidget(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).border3,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              44.0,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              await launchURL('https://everywatch.com');
                                                                            },
                                                                            child:
                                                                                wrapWithModel(
                                                                              model: _model.profileRowModel5,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: ProfileRowWidget(
                                                                                title: 'Rate the EveryWatch App',
                                                                                icon: Icon(
                                                                                  FFIcons.kicon4,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        wrapWithModel(
                                                                          model:
                                                                              _model.separatorIconModel4,
                                                                          updateCallback: () =>
                                                                              safeSetState(() {}),
                                                                          child:
                                                                              SeparatorIconWidget(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).border3,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              44.0,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              Builder(
                                                                            builder: (context) =>
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await showDialog(
                                                                                  barrierColor: FlutterFlowTheme.of(context).backgroundBlur,
                                                                                  context: context,
                                                                                  builder: (dialogContext) {
                                                                                    return Dialog(
                                                                                      elevation: 0,
                                                                                      insetPadding: EdgeInsets.zero,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      alignment: const AlignmentDirectional(0.0, 1.0).resolve(Directionality.of(context)),
                                                                                      child: GestureDetector(
                                                                                        onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                        child: SizedBox(
                                                                                          height: 346.0,
                                                                                          width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                          child: const ReferralDialogWidget(),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                              child: wrapWithModel(
                                                                                model: _model.profileRowModel6,
                                                                                updateCallback: () => safeSetState(() {}),
                                                                                child: ProfileRowWidget(
                                                                                  title: 'Referral Program',
                                                                                  icon: Icon(
                                                                                    FFIcons.kbox1,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        wrapWithModel(
                                                                          model:
                                                                              _model.separatorIconModel5,
                                                                          updateCallback: () =>
                                                                              safeSetState(() {}),
                                                                          child:
                                                                              SeparatorIconWidget(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).border3,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              44.0,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              wrapWithModel(
                                                                            model:
                                                                                _model.profileRowModel7,
                                                                            updateCallback: () =>
                                                                                safeSetState(() {}),
                                                                            child:
                                                                                ProfileRowWidget(
                                                                              title: 'Subscription',
                                                                              icon: Icon(
                                                                                FFIcons.kicon5,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        wrapWithModel(
                                                                          model:
                                                                              _model.separatorIconModel6,
                                                                          updateCallback: () =>
                                                                              safeSetState(() {}),
                                                                          child:
                                                                              SeparatorIconWidget(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).border3,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              44.0,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed('CurrencyPage');
                                                                            },
                                                                            child:
                                                                                wrapWithModel(
                                                                              model: _model.profileRowModel8,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: ProfileRowWidget(
                                                                                title: 'Currency',
                                                                                label: 'USD',
                                                                                icon: Icon(
                                                                                  FFIcons.kicon6,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 24.0,
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
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lightGray,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              24.0),
                                                                ),
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        8.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              44.0,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              wrapWithModel(
                                                                            model:
                                                                                _model.profileRowModel9,
                                                                            updateCallback: () =>
                                                                                safeSetState(() {}),
                                                                            child:
                                                                                ProfileRowWidget(
                                                                              title: 'Support ',
                                                                              icon: Icon(
                                                                                FFIcons.kicon7,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        wrapWithModel(
                                                                          model:
                                                                              _model.separatorIconModel7,
                                                                          updateCallback: () =>
                                                                              safeSetState(() {}),
                                                                          child:
                                                                              SeparatorIconWidget(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).border3,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              44.0,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed('InfoPage');
                                                                            },
                                                                            child:
                                                                                wrapWithModel(
                                                                              model: _model.profileRowModel10,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: ProfileRowWidget(
                                                                                title: 'Info',
                                                                                icon: Icon(
                                                                                  FFIcons.kbox2,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 24.0,
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
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        20.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    FFAppState()
                                                                            .loginData =
                                                                        LoginDataStruct();
                                                                    FFAppState()
                                                                        .clear();

                                                                    context.pushNamed(
                                                                        'WelcomePage');
                                                                  },
                                                                  child: Text(
                                                                    'Log Out',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'DM Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).badge,
                                                                          letterSpacing:
                                                                              0.12,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          lineHeight:
                                                                              1.43,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(
                                                              const SizedBox(
                                                                  height: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).primary,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).alternate,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'DM Sans',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  lineHeight: 1.33,
                                ),
                        unselectedLabelStyle: const TextStyle(),
                        indicatorColor: const Color(0x00FFFFFF),
                        tabs: const [
                          Tab(
                            text: 'Home',
                            icon: Icon(
                              FFIcons.khome,
                              size: 24.0,
                            ),
                            iconMargin: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                          ),
                          Tab(
                            text: 'Followed',
                            icon: Icon(
                              Icons.favorite_border,
                              size: 24.0,
                            ),
                            iconMargin: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                          ),
                          Tab(
                            text: 'Profile',
                            icon: Icon(
                              FFIcons.kprofile,
                              size: 24.0,
                            ),
                            iconMargin: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [() async {}, () async {}, () async {}][i]();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
