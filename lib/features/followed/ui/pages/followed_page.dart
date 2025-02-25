import 'dart:async';

import 'package:every_watch/backend/api_requests/api_calls.dart';
import 'package:every_watch/backend/schema/structs/watch_listing_response_struct.dart';
import 'package:every_watch/core/common/widgets/icon_button/icon_button_widget.dart';
import 'package:every_watch/core/common/widgets/pill_button/pill_button_widget.dart';
import 'package:every_watch/core/common/widgets/toggle_button/toggle_button_widget.dart';
import 'package:every_watch/core/common/widgets/watch_card/watch_card_widget.dart';
import 'package:every_watch/flutter_flow/flutter_flow_icon_button.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:every_watch/flutter_flow/flutter_flow_util.dart';
import 'package:every_watch/pages/main_page/main_page_model.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class FollowedPage extends StatefulWidget {
  const FollowedPage({super.key});

  @override
  State<FollowedPage> createState() => _FollowedPageState();
}

class _FollowedPageState extends State<FollowedPage> {
  late MainPageModel _model;

  @override
  void initState() {
    _model = createModel(context, () => MainPageModel());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
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
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 12.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  wrapWithModel(
                                    model: _model.iconButtonModel3,
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: IconButtonWidget(
                                      name: 'For You',
                                      icon: Icon(
                                        FFIcons.klike,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 16.0,
                                      ),
                                      isSelected: false,
                                      selectedAction: () async {},
                                      unselectedAction: () async {},
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.iconButtonModel4,
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: IconButtonWidget(
                                      name: 'Available',
                                      icon: Icon(
                                        FFIcons.kwaiting,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 16.0,
                                      ),
                                      isSelected: false,
                                      selectedAction: () async {},
                                      unselectedAction: () async {},
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.iconButtonModel5,
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: IconButtonWidget(
                                      name: 'Historical',
                                      icon: Icon(
                                        FFIcons.kresetSettings,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 16.0,
                                      ),
                                      isSelected: false,
                                      selectedAction: () async {},
                                      unselectedAction: () async {},
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 4.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 12.0, 20.0, 0.0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter ??= Completer<
                                      ApiCallResponse>()
                                    ..complete(
                                        MutualWatchGroup.watchListingCall.call(
                                      accessToken:
                                          FFAppState().loginData.accessToken,
                                      variablesJson: {
                                        "filterData": {
                                          "currencyMode": "USD",
                                          "auctionType": ["listing"]
                                        },
                                        "sortType": "asc",
                                        "sortColumn": "relevance",
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
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final gridViewWatchListingResponse =
                                    snapshot.data!;

                                return Builder(
                                  builder: (context) {
                                    final watchListings =
                                        WatchListingResponseStruct.maybeFromMap(
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
                                            _model.apiRequestCompleter = null);
                                        await _model
                                            .waitForApiRequestCompleted();
                                      },
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
                                        scrollDirection: Axis.vertical,
                                        itemCount: watchListings.length,
                                        itemBuilder:
                                            (context, watchListingsIndex) {
                                          final watchListingsItem =
                                              watchListings[watchListingsIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('WatchPage');
                                            },
                                            child: wrapWithModel(
                                              model: _model.watchCardModels2
                                                  .getModel(
                                                watchListingsItem.watchId
                                                    .toString(),
                                                watchListingsIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: WatchCardWidget(
                                                key: Key(
                                                  'Keynaw_${watchListingsItem.watchId.toString()}',
                                                ),
                                                brand: valueOrDefault<String>(
                                                  watchListingsItem
                                                      .manufactureName,
                                                  '-',
                                                ),
                                                model: valueOrDefault<String>(
                                                  watchListingsItem.modelName,
                                                  '-',
                                                ),
                                                priceTitle: 'Estimates',
                                                price: watchListingsItem
                                                    .parsePrice(),
                                                auctionLocation:
                                                    watchListingsItem
                                                        .parseLocation(),
                                                auctionDate: watchListingsItem
                                                    .parseEventDates(),
                                                imagePath: watchListingsItem
                                                    .primaryImage.original,
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
                                    alignment:
                                        const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 16.0, 0.0, 0.0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .border,
                                              borderRadius: 12.0,
                                              borderWidth: 1.0,
                                              buttonSize: 32.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .appBar,
                                              icon: Icon(
                                                FFIcons.ksort,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 16.0,
                                              ),
                                              onPressed: () {},
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      -1.0, 0.0),
                                              child: wrapWithModel(
                                                model: _model.pillButtonModel2,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: PillButtonWidget(
                                                  title: 'Filters',
                                                  icon: Icon(
                                                    FFIcons.kparameters,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 16.0,
                                                  ),
                                                  pressAction: () async {},
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0.0, 0.0),
                                              child: wrapWithModel(
                                                model:
                                                    _model.toggleButtonModel3,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ToggleButtonWidget(
                                                  title: 'Upcoming Auctions',
                                                  isSelected: false,
                                                  count: '9,256',
                                                  selectedAction: () async {},
                                                  unselectedAction: () async {},
                                                ),
                                              ),
                                            ),
                                          ]
                                              .divide(
                                                  const SizedBox(width: 8.0))
                                              .addToStart(
                                                  const SizedBox(width: 20.0)),
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
      ),
    );
  }
}
