import 'dart:async';
import 'dart:io';

import 'package:every_watch/backend/api_requests/api_calls.dart';
import 'package:every_watch/backend/schema/structs/filter_data_struct.dart';
import 'package:every_watch/backend/schema/structs/search_results_response_struct.dart';
import 'package:every_watch/backend/schema/structs/watch_listing_filter_struct.dart';
import 'package:every_watch/backend/schema/structs/watch_listing_response_struct.dart';
import 'package:every_watch/core/common/widgets/icon_button/icon_button_widget.dart';
import 'package:every_watch/core/common/widgets/pill_button/pill_button_widget.dart';
import 'package:every_watch/core/common/widgets/search_bar/search_bar_widget.dart';
import 'package:every_watch/core/common/widgets/toggle_button/toggle_button_widget.dart';
import 'package:every_watch/core/common/widgets/watch_card/watch_card_widget.dart';
import 'package:every_watch/core/di/init_dependencies.dart';
import 'package:every_watch/features/find_watch/ui/cubit/image_search_cubit.dart';
import 'package:every_watch/features/find_watch/ui/cubit/image_search_state.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:every_watch/flutter_flow/flutter_flow_util.dart';
import 'package:every_watch/pages/main_page/main_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImageSearchCubit _imageSearchCubit = serviceLocator<ImageSearchCubit>();

  late MainPageModel _model;
  late SearchBarModel _searchBarModel;
  var isLoadingSearch = true;
  var isAvailableSelected = true;
  var isHistoricalSelected = false;
  var isUpcomingSelected = false;
  var isMarketplaceSelected = false;
  Timer? _debounce;
  final TextEditingController _searchController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  WatchListingFilterStruct? _watchListingFilter;
  WatchListingResponseStruct? _watchListingResponse;
  bool isLoading = false; // Add a loading state variable

  @override
  void initState() {
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

    // Add the API call in initState
    _callWatchListingApi(
        false, ""); // Call the API to fetch data on initialization

    super.initState();
  }

  void _callWatchListingApi(bool isImageSearch, String searchText) async {
    setState(() {
      isLoading = true; // Set loading to true before the API call
    });

    // Ensure _watchListingFilter is initialized
    _watchListingFilter = FFAppState().watchListingFilter;
    if (_watchListingFilter == null ||
        _watchListingFilter?.toMap().isEmpty == true) {
      _watchListingFilter = WatchListingFilterStruct(
        filterData: FilterDataStruct(
          currencyMode: 'USD',
          auctionType: isImageSearch ? ['allWatches'] : ['listing'],
        ),
        sortType: 'asc',
        sortColumn: 'relevance',
        from: 0,
        size: 30,
      );
    }

    _watchListingFilter?.filterData.image = [searchText];

    final response = await MutualWatchGroup.watchListingCall.call(
      accessToken: FFAppState().loginData.accessToken,
      variablesJson: _watchListingFilter?.toMap(),
    );

    if (response.succeeded && mounted) {
      setState(() {
        _watchListingResponse =
            WatchListingResponseStruct.fromMap(response.jsonBody);
        isLoading = false; // Reset loading to false after the response
      });
    } else {
      setState(() {
        isLoading = false; // Reset loading to false in case of failure
      });
    }
  }

  void _handleTextChange() async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      String text = _searchBarModel.textController?.text ?? '';
      _model.searchResults.query = text;
      isLoadingSearch = true;
      safeSetState(() {});
    });
  }

  void clearSearch([bool clearQuery = true]) {
    if (clearQuery) {
      _model.searchResults.query = '';
      _searchController.text = '';
    }
    isLoadingSearch = false;
    _searchBarModel.textFieldFocusNode?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    // Show loader if isLoading is true
    if (isLoading) {
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

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: BlocListener<ImageSearchCubit, ImageSearchState>(
        bloc: _imageSearchCubit,
        listener: (context, state) {
          if (state.flag && state.searchText.isNotEmpty) {
            _callWatchListingApi(true, state.searchText);
            _imageSearchCubit.setFlag(false);
            _imageSearchCubit.setSearchText('');
          }
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: Platform.isAndroid ? 14 : 8),
            child: KeepAliveWidgetWrapper(
              builder: (context) => Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: wrapWithModel(
                                        model: _searchBarModel,
                                        updateCallback: () => {},
                                        child: const SearchBarWidget(
                                          searchLabel: 'Search Watch',
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: _searchBarModel
                                              .textFieldFocusNode?.hasFocus ==
                                          true,
                                      maintainSize: false,
                                      child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 20.0, 0.0),
                                          child: InkWell(
                                            onTap: () {
                                              clearSearch();
                                            },
                                            child: Text(
                                              'Cancel',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        lineHeight: 1.41,
                                                      ),
                                            ),
                                          )),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          safeSetState(() {
                                            _model.tabBarController!.animateTo(
                                              2,
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          });
                                        },
                                        child: Container(
                                          width: 46.0,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .appBar,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          alignment: const AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
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
                                  ].divide(const SizedBox(width: 12.0)),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 12.0),
                                  child: Stack(
                                    alignment: const AlignmentDirectional(0, 0),
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            wrapWithModel(
                                              model: _model.iconButtonModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              updateOnChange: true,
                                              child: IconButtonWidget(
                                                name: 'Available',
                                                icon: Icon(
                                                  FFIcons.kwaiting,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 16.0,
                                                ),
                                                isSelected: isAvailableSelected,
                                                selectedAction: () async {
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

                                                  _model.isAvailable = true;
                                                  safeSetState(() {
                                                    isHistoricalSelected =
                                                        false;
                                                    isAvailableSelected = true;
                                                    isUpcomingSelected = false;
                                                    isMarketplaceSelected =
                                                        false;
                                                  });
                                                },
                                                unselectedAction: () async {
                                                  FFAppState()
                                                      .updateWatchListingFilter(
                                                    (e) => e
                                                      ..filterData
                                                          .auctionType
                                                          .removeUnique(
                                                              'listing'),
                                                  );
                                                  _model.isAvailable = true;
                                                  safeSetState(() {
                                                    isAvailableSelected = false;
                                                  });
                                                },
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.iconButtonModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              updateOnChange: true,
                                              child: IconButtonWidget(
                                                name: 'Historical',
                                                icon: Icon(
                                                  FFIcons.kresetSettings,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 16.0,
                                                ),
                                                isSelected:
                                                    isHistoricalSelected,
                                                selectedAction: () async {
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
                                                  _model.isAvailable = false;
                                                  safeSetState(() {
                                                    isHistoricalSelected = true;
                                                    isAvailableSelected = false;
                                                    isUpcomingSelected = false;
                                                    isMarketplaceSelected =
                                                        false;
                                                  });
                                                },
                                                unselectedAction: () async {
                                                  FFAppState()
                                                      .updateWatchListingFilter(
                                                    (e) => e
                                                      ..filterData
                                                          .auctionType
                                                          .removeUnique(
                                                              'historical'),
                                                  );
                                                  _model.isAvailable = false;
                                                  safeSetState(() {
                                                    isHistoricalSelected =
                                                        false;
                                                  });
                                                },
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 4.0)),
                                        ),
                                      ),
                                      Visibility(
                                        visible: _searchBarModel
                                                .textFieldFocusNode?.hasFocus ==
                                            true,
                                        maintainSize:
                                            false, // Maintain the space when not visible
                                        maintainAnimation: true,
                                        maintainState: true,
                                        replacement: // Optional: shows an empty space if needed
                                            const SizedBox.shrink(),
                                        child: Container(
                                            width: double.infinity,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.9,
                                            decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground),
                                            child: Stack(
                                              children: [
                                                FutureBuilder<ApiCallResponse>(
                                                    future: MutualWatchGroup
                                                        .watchFiltersGraphQLCall
                                                        .call(
                                                      queryName:
                                                          'SearchResults',
                                                      variablesJson: _model
                                                          .searchResults
                                                          .toMap(),
                                                      authorization:
                                                          FFAppState()
                                                              .loginData
                                                              .accessToken,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot.hasData) {
                                                        isLoadingSearch = false;
                                                        final searchResultsResponse =
                                                            snapshot.data!;
                                                        final masterSearches =
                                                            SearchResultsResponseStruct.maybeFromMap(
                                                                        searchResultsResponse
                                                                            .jsonBody)
                                                                    ?.data
                                                                    .data
                                                                    .data
                                                                    .searchResults
                                                                    .masterSearchs
                                                                    .toList() ??
                                                                [];
                                                        return ListView.builder(
                                                          itemCount:
                                                              masterSearches
                                                                  .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return ListTile(
                                                              title: Text(
                                                                  masterSearches[
                                                                          index]
                                                                      .matchingString),
                                                              onTap: () {
                                                                FFAppState()
                                                                    .update(() {
                                                                  var search =
                                                                      masterSearches[
                                                                          index];
                                                                  var query =
                                                                      search
                                                                          .filters;
                                                                  var currentFilterData =
                                                                      FFAppState()
                                                                          .watchListingFilter
                                                                          .filterData;
                                                                  var parsedFilterData =
                                                                      FilterDataStruct
                                                                          .parseFilterData(
                                                                              query);
                                                                  parsedFilterData
                                                                          .auctionType =
                                                                      currentFilterData
                                                                          .auctionType;
                                                                  parsedFilterData
                                                                          .currencyMode =
                                                                      currentFilterData
                                                                          .currencyMode;
                                                                  FFAppState()
                                                                          .watchListingFilter
                                                                          .filterData =
                                                                      parsedFilterData;
                                                                  _model.searchResults
                                                                          .query =
                                                                      search
                                                                          .matchingString;
                                                                  _searchController
                                                                          .text =
                                                                      search
                                                                          .matchingString;
                                                                  clearSearch(
                                                                      false);
                                                                });
                                                              },
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        return const Center(
                                                            child:
                                                                CircularProgressIndicator());
                                                      }
                                                    }),
                                                Center(
                                                    child: Visibility(
                                                        visible:
                                                            isLoadingSearch,
                                                        child:
                                                            const CircularProgressIndicator()))
                                              ],
                                            )),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
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
                                child: SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            -1.0, 0.0),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 16.0, 0.0, 0.0),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                PopupMenuButton<String>(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .appBar,
                                                  onSelected: (String result) {
                                                    var sortColumn =
                                                        'relevance';
                                                    var sortType = 'asc';
                                                    var sortText = 'Relevance';
                                                    if (result == 'newest') {
                                                      sortColumn = 'newest';
                                                      sortType = 'desc';
                                                      sortText = 'Newest';
                                                    } else if (result ==
                                                        'price-high') {
                                                      sortColumn = 'price';
                                                      sortType = 'desc';
                                                      sortText =
                                                          'Price: High to Low';
                                                    } else if (result ==
                                                        'price-low') {
                                                      sortColumn = 'price';
                                                      sortType = 'asc';
                                                      sortText =
                                                          'Price: Low to High';
                                                    }
                                                    safeSetState(() {
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                                .watchListingFilter
                                                                .sortColumn =
                                                            sortColumn;
                                                        FFAppState()
                                                            .watchListingFilter
                                                            .sortType = sortType;
                                                      });
                                                    });

                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                          content: Text(
                                                              'Sort by $sortText')),
                                                    );
                                                  },
                                                  itemBuilder: (BuildContext
                                                          context) =>
                                                      <PopupMenuEntry<String>>[
                                                    const PopupMenuItem<String>(
                                                      value: 'relevance',
                                                      child: Text('Relevance'),
                                                    ),
                                                    const PopupMenuItem<String>(
                                                      value: 'newest',
                                                      child: Text('Newest'),
                                                    ),
                                                    const PopupMenuItem<String>(
                                                      value: 'price-high',
                                                      child: Text(
                                                          'Price: High to Low'),
                                                    ),
                                                    const PopupMenuItem<String>(
                                                      value: 'price-low',
                                                      child: Text(
                                                          'Price: Low to High'),
                                                    ),
                                                  ],
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    side: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    height: 32.0,
                                                    width: 32.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .appBar,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .border,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Icon(
                                                      FFIcons.ksort,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 16.0,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: wrapWithModel(
                                                    model:
                                                        _model.pillButtonModel1,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: PillButtonWidget(
                                                      title: 'Filters',
                                                      icon: Icon(
                                                        FFIcons.kparameters,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 16.0,
                                                      ),
                                                      pressAction: () async {
                                                        context.pushNamed(
                                                          'FiltersPage',
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                const TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .bottomToTop,
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
                                                          0.0, 0.0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .toggleButtonModel1,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    updateOnChange: true,
                                                    child: ToggleButtonWidget(
                                                      title:
                                                          'Upcoming Auctions',
                                                      isSelected:
                                                          isUpcomingSelected,
                                                      count: () {
                                                        if (FFAppState()
                                                            .watchListingFilter
                                                            .filterData
                                                            .auctionType
                                                            .contains(
                                                                'upcomingLive')) {
                                                          return _watchListingResponse
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
                                                          return _watchListingResponse
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
                                                      selectedAction: () async {
                                                        isUpcomingSelected =
                                                            true;
                                                        if (_model
                                                            .isAvailable) {
                                                          FFAppState()
                                                              .updateWatchListingFilter(
                                                            (e) => e
                                                              ..filterData
                                                                  .auctionType
                                                                  .addUnique(
                                                                      'upcomingLive'),
                                                          );
                                                          safeSetState(() {});
                                                        } else {
                                                          FFAppState()
                                                              .updateWatchListingFilter(
                                                            (e) => e
                                                              ..filterData
                                                                  .auctionType
                                                                  .addUnique(
                                                                      'result'),
                                                          );
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                      unselectedAction:
                                                          () async {
                                                        isUpcomingSelected =
                                                            false;
                                                        FFAppState().updateWatchListingFilter(
                                                            (e) => e
                                                              ..filterData
                                                                  .auctionType
                                                                  .removeUnique(
                                                                      'upcomingLive')
                                                              ..filterData
                                                                  .auctionType
                                                                  .removeUnique(
                                                                      'result'));
                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .toggleButtonModel2,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    updateOnChange: true,
                                                    child: ToggleButtonWidget(
                                                      title: 'Marketplace',
                                                      isSelected:
                                                          isMarketplaceSelected,
                                                      count: FFAppState()
                                                              .watchListingFilter
                                                              .filterData
                                                              .auctionType
                                                              .contains(
                                                                  'marketplace')
                                                          ? _watchListingResponse
                                                              ?.data
                                                              .data
                                                              .data
                                                              .auctionWiseListing
                                                              .count
                                                              .toString()
                                                          : null,
                                                      selectedAction: () async {
                                                        isMarketplaceSelected =
                                                            true;
                                                        if (_model
                                                            .isAvailable) {
                                                          FFAppState()
                                                              .updateWatchListingFilter(
                                                            (e) => e
                                                              ..filterData =
                                                                  FilterDataStruct(
                                                                auctionType: [
                                                                  'marketplace'
                                                                ],
                                                              ),
                                                          );
                                                          safeSetState(() {});
                                                        } else {
                                                          FFAppState()
                                                              .updateWatchListingFilter(
                                                            (e) => e
                                                              ..filterData =
                                                                  FilterDataStruct(
                                                                auctionType: [
                                                                  'marketplaceArchive'
                                                                ],
                                                              ),
                                                          );
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                      unselectedAction:
                                                          () async {
                                                        isMarketplaceSelected =
                                                            false;
                                                        FFAppState()
                                                            .updateWatchListingFilter(
                                                          (e) => e
                                                            ..filterData
                                                                .auctionType
                                                                .removeUnique(
                                                                    'marketplaceArchive')
                                                            ..filterData
                                                                .auctionType
                                                                .removeUnique(
                                                                    'marketplace'),
                                                        );
                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ]
                                                  .divide(const SizedBox(
                                                      width: 8.0))
                                                  .addToStart(const SizedBox(
                                                      width: 20.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Stack(
                                        alignment: const AlignmentDirectional(
                                            0.0, 0.0),
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(
                                                20.0, 12.0, 20.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final watchListings =
                                                    _watchListingResponse
                                                            ?.data
                                                            .data
                                                            .data
                                                            .auctionWiseListing
                                                            .allWatchListings
                                                            .toList() ??
                                                        [];

                                                return RefreshIndicator(
                                                  onRefresh: () async {},
                                                  child: GridView.builder(
                                                    padding: EdgeInsets.zero,
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing: 4.0,
                                                      mainAxisSpacing: 4.0,
                                                      childAspectRatio: 0.6,
                                                    ),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        watchListings.length,
                                                    itemBuilder: (context,
                                                        watchListingsIndex) {
                                                      final watchListingsItem =
                                                          watchListings[
                                                              watchListingsIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          FFAppState()
                                                                  .watchListingStruct =
                                                              watchListingsItem;
                                                          context.push(
                                                              '/watch-detail');
                                                        },
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .watchCardModels1
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
                                                              'Keyn5s_${watchListingsItem.watchId.toString()}',
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
                                                                watchListingsItem
                                                                    .parsePrice(),
                                                            auctionLocation:
                                                                watchListingsItem
                                                                    .parseLocation(),
                                                            auctionDate:
                                                                watchListingsItem
                                                                    .parseEventDates(),
                                                            auctionLotType:
                                                                watchListingsItem
                                                                    .auctionLotType,
                                                            imagePath:
                                                                watchListingsItem
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
          ),
        ),
      ),
    );
  }
}
