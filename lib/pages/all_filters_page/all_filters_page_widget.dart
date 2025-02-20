import 'package:collection/collection.dart';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '../../core/common/widgets/filter_checkbox/filter_checkbox_widget.dart';
import '../../core/common/widgets/search_bar/search_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'all_filters_page_model.dart';
export 'all_filters_page_model.dart';

class AllFiltersPageWidget extends StatefulWidget {
  const AllFiltersPageWidget({
    super.key,
    required this.title,
    required this.keyName,
  });

  final String? title;
  final String? keyName;

  @override
  State<AllFiltersPageWidget> createState() => _AllFiltersPageWidgetState();
}

class _AllFiltersPageWidgetState extends State<AllFiltersPageWidget> {
  late AllFiltersPageModel _model;
  late SearchBarModel _searchBarModel;
  final TextEditingController _searchController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => AllFiltersPageModel(keyName: widget.keyName!));
    _searchBarModel = _model.searchBarModel;
    _searchController.addListener(_handleTextChange);
    _searchBarModel.textController = _searchController;

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.keyName = widget.keyName!;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();
    _searchBarModel.dispose();

    super.dispose();
  }

  void _handleTextChange() {
    String text = _searchBarModel.textController?.text ?? '';
    _model.searchQuery = text;
    _model.updateWatchFilterStruct(
        (e) => e..filterOptions.firstOrNull?.value.search = _model.searchQuery);
    safeSetState(() {});
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    var filter = _model.watchFilter?.toMap();
    return FutureBuilder<ApiCallResponse>(
      future: MutualWatchGroup.watchFiltersGraphQLCall.call(
        queryName: 'WatchFilters',
        variablesJson: filter,
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
        final allFiltersPageWatchFiltersGraphQLResponse = snapshot.data!;
        final globalFilter = WatchFiltersResponseStruct.maybeFromMap(
                allFiltersPageWatchFiltersGraphQLResponse.jsonBody)!
            .data
            .data
            .data
            .watchFilters
            .globalFilter;
        final organizedFilter = globalFilter.organizeFirstNonEmptyList();

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
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.title,
                                          'Brand',
                                        ),
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
                                        child: Text(
                                          'Clear All',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'DM Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                lineHeight: 1.41,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              content: Column(
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
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 44.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: wrapWithModel(
                                                model: _searchBarModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: SearchBarWidget(
                                                  searchLabel:
                                                      'Search ${widget.title}',
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              height: 1.0,
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .border3,
                                            ),
                                            Builder(
                                              builder: (context) {
                                                var alphabetFilter =
                                                    organizedFilter.entries
                                                        .toList()
                                                      ..sort((a, b) => a.key
                                                          .compareTo(b.key));

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: alphabetFilter
                                                      .map((entry) {
                                                    return FilterCheckboxWidget(
                                                      key: Key(entry.key),
                                                      keyName: widget.keyName,
                                                      letter: entry.key,
                                                      filters: entry.value,
                                                    );
                                                  }).toList(),
                                                );
                                              },
                                            ),
                                            Flexible(
                                              child: Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        0.0, 1.0),
                                                child: Container(
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: FFButtonWidget(
                                                    onPressed: () {
                                                      context.pop();
                                                    },
                                                    text: 'Apply Filter',
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(24.0,
                                                              0.0, 24.0, 0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0.0,
                                                              0.0, 0.0, 0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'DM Sans',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                lineHeight:
                                                                    1.47,
                                                              ),
                                                      borderSide:
                                                          const BorderSide(
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
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
          ),
        );
      },
    );
  }
}
