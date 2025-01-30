import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'filter_checkbox_model.dart';
export 'filter_checkbox_model.dart';

class FilterCheckboxWidget extends StatefulWidget {
  const FilterCheckboxWidget({
    super.key,
    required this.keyName,
    required this.letter,
    required this.filters,
  });

  final String? keyName;
  final String? letter;
  final List<GlobalFilterStruct>? filters;

  @override
  State<FilterCheckboxWidget> createState() => _FilterCheckboxWidgetState();
}

class _FilterCheckboxWidgetState extends State<FilterCheckboxWidget> {
  late FilterCheckboxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterCheckboxModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> options =
        widget.filters?.map((filter) => filter.value).toList() ?? [];
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.letter,
                  'A',
                ),
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'DM Sans',
                      color: FlutterFlowTheme.of(context).secondary,
                      letterSpacing: 0.08,
                      fontWeight: FontWeight.bold,
                      lineHeight: 1.43,
                    ),
              ),
            ),
          ),
          Container(
            child: FlutterFlowCheckboxGroup(
              options: options,
              onChanged: (val) => {
                safeSetState(() {
                  _model.checkboxGroupValues = val;
                  for (var selected in val) {
                    int indexSelected = options.indexOf(selected);
                    String? keyName =
                        widget.filters?[indexSelected].id.toString();
                    if (widget.keyName == 'manufacturer') {
                      FFAppState().update(() {
                        var currentFilterData = [
                          ...FFAppState()
                              .watchListingFilter
                              .filterData
                              .manufacturer
                        ];
                        FFAppState()
                                .watchListingFilter
                                .filterData
                                .manufacturer =
                            currentFilterData.addUnique(keyName ?? "");
                      });
                    } else if (widget.keyName == 'model') {
                      FFAppState().update(() {
                        var currentFilterData = [
                          ...FFAppState().watchListingFilter.filterData.model
                        ];
                        FFAppState().watchListingFilter.filterData.model =
                            currentFilterData.addUnique(keyName ?? "");
                      });
                    } else if (widget.keyName == 'referenceNumber') {
                      FFAppState().update(() {
                        var currentFilterData = [
                          ...FFAppState()
                              .watchListingFilter
                              .filterData
                              .referenceNumber
                        ];
                        FFAppState()
                                .watchListingFilter
                                .filterData
                                .referenceNumber =
                            currentFilterData.addUnique(keyName ?? "");
                      });
                    } else if (widget.keyName == 'caseSize') {
                      FFAppState().update(() {
                        var currentFilterData = [
                          ...FFAppState().watchListingFilter.filterData.caseSize
                        ];
                        FFAppState().watchListingFilter.filterData.caseSize =
                            currentFilterData.addUnique(keyName ?? "");
                      });
                    } else if (widget.keyName == 'caseMaterial') {
                      FFAppState().update(() {
                        var currentFilterData = [
                          ...FFAppState()
                              .watchListingFilter
                              .filterData
                              .caseMaterial
                        ];
                        FFAppState()
                                .watchListingFilter
                                .filterData
                                .caseMaterial =
                            currentFilterData.addUnique(keyName ?? "");
                      });
                    } else if (widget.keyName == 'dialColor') {
                      FFAppState().update(() {
                        var currentFilterData = [
                          ...FFAppState()
                              .watchListingFilter
                              .filterData
                              .dialColor
                        ];
                        FFAppState().watchListingFilter.filterData.dialColor =
                            currentFilterData.addUnique(keyName ?? "");
                      });
                    } else if (widget.keyName == 'movement') {
                      FFAppState().update(() {
                        var currentFilterData = [
                          ...FFAppState().watchListingFilter.filterData.movement
                        ];
                        FFAppState().watchListingFilter.filterData.movement =
                            currentFilterData.addUnique(keyName ?? "");
                      });
                    } else if (widget.keyName == 'braceletMaterial') {
                      FFAppState().update(() {
                        var currentFilterData = [
                          ...FFAppState()
                              .watchListingFilter
                              .filterData
                              .braceletMaterial
                        ];
                        FFAppState()
                                .watchListingFilter
                                .filterData
                                .braceletMaterial =
                            currentFilterData.addUnique(keyName ?? "");
                      });
                    } else if (widget.keyName == 'claspMaterial') {
                      FFAppState().update(() {
                        var currentFilterData = [
                          ...FFAppState()
                              .watchListingFilter
                              .filterData
                              .claspMaterial
                        ];
                        FFAppState()
                                .watchListingFilter
                                .filterData
                                .claspMaterial =
                            currentFilterData.addUnique(keyName ?? "");
                      });
                    } else if (widget.keyName == 'infoSource') {
                      FFAppState().update(() {
                        var currentFilterData = [
                          ...FFAppState()
                              .watchListingFilter
                              .filterData
                              .infoSource
                        ];
                        FFAppState().watchListingFilter.filterData.infoSource =
                            currentFilterData.addUnique(keyName ?? "");
                      });
                    } else if (widget.keyName == 'country') {
                      FFAppState().update(() {
                        var currentFilterData = [
                          ...FFAppState().watchListingFilter.filterData.country
                        ];
                        FFAppState().watchListingFilter.filterData.country =
                            currentFilterData.addUnique(keyName ?? "");
                      });
                    } else if (widget.keyName == 'condition') {
                      FFAppState().update(() {
                        var currentFilterData = [
                          ...FFAppState()
                              .watchListingFilter
                              .filterData
                              .condition
                        ];
                        FFAppState().watchListingFilter.filterData.condition =
                            currentFilterData.addUnique(keyName ?? "");
                      });
                    }
                  }
                }),
              },
              controller: _model.checkboxGroupValueController ??=
                  FormFieldController<List<String>>(
                [],
              ),
              activeColor: FlutterFlowTheme.of(context).primary,
              checkColor: FlutterFlowTheme.of(context).info,
              checkboxBorderColor: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'DM Sans',
                    color: FlutterFlowTheme.of(context).primary,
                    letterSpacing: 0.08,
                    lineHeight: 1.43,
                  ),
              checkboxBorderRadius: BorderRadius.circular(4.0),
              initialized: _model.checkboxGroupValues != null,
            ),
          ),
        ].divide(const SizedBox(height: 8.0)),
      ),
    );
  }
}
