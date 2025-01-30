
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/filter_row/filter_row_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'filters_page_model.dart';
export 'filters_page_model.dart';

class FiltersPageWidget extends StatefulWidget {
  const FiltersPageWidget({super.key});

  @override
  State<FiltersPageWidget> createState() => _FiltersPageWidgetState();
}

class _FiltersPageWidgetState extends State<FiltersPageWidget> {
  late FiltersPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltersPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    _model.updateWatchFilterStruct(
        (e) => e..filterData = FFAppState().watchListingFilter.filterData);

    return FutureBuilder<ApiCallResponse>(
      future: MutualWatchGroup.watchFiltersGraphQLCall.call(
        queryName: 'WatchFilters',
        variablesJson: _model.watchFilter.toMap(),
        authorization: FFAppState().loginData.accessToken,
      ),
      builder: (context, snapshot) {
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
        final filtersPageWatchFiltersGraphQLResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: SingleChildScrollView(
                        primary: false,
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
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'Filters',
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
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              8.0, 0.0, 0.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 48.0,
                                        icon: Icon(
                                          Icons.close,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          context.pop();
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 20.0, 0.0),
                                          child: InkWell(
                                            onTap: () {
                                              FFAppState().update(() {
                                                FFAppState()
                                                        .watchListingFilter
                                                        .filterData =
                                                    FilterDataStruct(
                                                  currencyMode: 'USD',
                                                  auctionType: FFAppState()
                                                      .watchListingFilter
                                                      .filterData
                                                      .auctionType,
                                                );
                                                safeSetState(() {});
                                              });
                                            },
                                            child: Text(
                                              'Clear All',
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
                                  ],
                                ),
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
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
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(20.0, 12.0, 20.0, 0.0),
                                          child: SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .filterRowModel1,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: FilterRowWidget(
                                                          title: 'Brand',
                                                          keyName:
                                                              'manufacturer',
                                                          filters: WatchFiltersResponseStruct
                                                                  .maybeFromMap(
                                                                      filtersPageWatchFiltersGraphQLResponse
                                                                          .jsonBody)!
                                                              .data
                                                              .data
                                                              .data
                                                              .watchFilters
                                                              .globalFilter
                                                              .manufacturer,
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border3,
                                                    ),
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .filterRowModel2,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: FilterRowWidget(
                                                          title: 'Model',
                                                          keyName: 'model',
                                                          filters: WatchFiltersResponseStruct
                                                                  .maybeFromMap(
                                                                      filtersPageWatchFiltersGraphQLResponse
                                                                          .jsonBody)!
                                                              .data
                                                              .data
                                                              .data
                                                              .watchFilters
                                                              .globalFilter
                                                              .model,
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border3,
                                                    ),
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .filterRowModel3,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: FilterRowWidget(
                                                          title:
                                                              'Reference Number',
                                                          keyName:
                                                              'referenceNumber',
                                                          filters: WatchFiltersResponseStruct
                                                                  .maybeFromMap(
                                                                      filtersPageWatchFiltersGraphQLResponse
                                                                          .jsonBody)!
                                                              .data
                                                              .data
                                                              .data
                                                              .watchFilters
                                                              .globalFilter
                                                              .referenceNumber,
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border3,
                                                    ),
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .filterRowModel4,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: FilterRowWidget(
                                                          title: 'Case Size',
                                                          keyName: 'caseSize',
                                                          filters: WatchFiltersResponseStruct
                                                                  .maybeFromMap(
                                                                      filtersPageWatchFiltersGraphQLResponse
                                                                          .jsonBody)!
                                                              .data
                                                              .data
                                                              .data
                                                              .watchFilters
                                                              .globalFilter
                                                              .caseSize,
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border3,
                                                    ),
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .filterRowModel5,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: FilterRowWidget(
                                                          title:
                                                              'Case Material',
                                                          keyName:
                                                              'caseMaterial',
                                                          filters: WatchFiltersResponseStruct
                                                                  .maybeFromMap(
                                                                      filtersPageWatchFiltersGraphQLResponse
                                                                          .jsonBody)!
                                                              .data
                                                              .data
                                                              .data
                                                              .watchFilters
                                                              .globalFilter
                                                              .caseMaterial,
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border3,
                                                    ),
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .filterRowModel6,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: FilterRowWidget(
                                                          title: 'Dial Color',
                                                          keyName: 'dialColor',
                                                          filters: WatchFiltersResponseStruct
                                                                  .maybeFromMap(
                                                                      filtersPageWatchFiltersGraphQLResponse
                                                                          .jsonBody)!
                                                              .data
                                                              .data
                                                              .data
                                                              .watchFilters
                                                              .globalFilter
                                                              .dialColor,
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border3,
                                                    ),
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .filterRowModel7,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: FilterRowWidget(
                                                          title: 'Movement',
                                                          keyName: 'movement',
                                                          filters: WatchFiltersResponseStruct
                                                                  .maybeFromMap(
                                                                      filtersPageWatchFiltersGraphQLResponse
                                                                          .jsonBody)!
                                                              .data
                                                              .data
                                                              .data
                                                              .watchFilters
                                                              .globalFilter
                                                              .movement,
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border3,
                                                    ),
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .filterRowModel8,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: FilterRowWidget(
                                                          title:
                                                              'Bracelet Material',
                                                          keyName:
                                                              'braceletMaterial',
                                                          filters: WatchFiltersResponseStruct
                                                                  .maybeFromMap(
                                                                      filtersPageWatchFiltersGraphQLResponse
                                                                          .jsonBody)!
                                                              .data
                                                              .data
                                                              .data
                                                              .watchFilters
                                                              .globalFilter
                                                              .braceletMaterial,
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border3,
                                                    ),
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .filterRowModel9,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: FilterRowWidget(
                                                          title:
                                                              'Clasp Material',
                                                          keyName:
                                                              'claspMaterial',
                                                          filters: WatchFiltersResponseStruct
                                                                  .maybeFromMap(
                                                                      filtersPageWatchFiltersGraphQLResponse
                                                                          .jsonBody)!
                                                              .data
                                                              .data
                                                              .data
                                                              .watchFilters
                                                              .globalFilter
                                                              .claspMaterial,
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border3,
                                                    ),
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .filterRowModel10,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: FilterRowWidget(
                                                          title: 'Source',
                                                          keyName: 'infoSource',
                                                          filters: WatchFiltersResponseStruct
                                                                  .maybeFromMap(
                                                                      filtersPageWatchFiltersGraphQLResponse
                                                                          .jsonBody)!
                                                              .data
                                                              .data
                                                              .data
                                                              .watchFilters
                                                              .globalFilter
                                                              .infoSource,
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border3,
                                                    ),
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .filterRowModel11,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: FilterRowWidget(
                                                          title: 'Location',
                                                          keyName: 'country',
                                                          filters: WatchFiltersResponseStruct
                                                                  .maybeFromMap(
                                                                      filtersPageWatchFiltersGraphQLResponse
                                                                          .jsonBody)!
                                                              .data
                                                              .data
                                                              .data
                                                              .watchFilters
                                                              .globalFilter
                                                              .country,
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border3,
                                                    ),
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .filterRowModel12,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: FilterRowWidget(
                                                          title: 'Condition',
                                                          keyName: 'condition',
                                                          filters: WatchFiltersResponseStruct
                                                                  .maybeFromMap(
                                                                      filtersPageWatchFiltersGraphQLResponse
                                                                          .jsonBody)!
                                                              .data
                                                              .data
                                                              .data
                                                              .watchFilters
                                                              .globalFilter
                                                              .condition,
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(const SizedBox(
                                                      height: 12.0)),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                            0.0, 0.0),
                                                    child: Container(
                                                      height: 44.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: FFButtonWidget(
                                                        onPressed: () {
                                                          context.pop();
                                                        },
                                                        text: 'Apply',
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
                                                          height: 44.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'DM Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    lineHeight:
                                                                        1.47,
                                                                  ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(
                                                  const SizedBox(height: 12.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
          ),
        );
      },
    );
  }
}
