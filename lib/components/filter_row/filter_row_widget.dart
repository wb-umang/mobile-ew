import 'package:every_watch/app_state.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';
import '/components/toggle_button/toggle_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'filter_row_model.dart';
export 'filter_row_model.dart';

class FilterRowWidget extends StatefulWidget {
  const FilterRowWidget({
    super.key,
    required this.title,
    required this.keyName,
    required this.filters,
  });

  final String? title;
  final String? keyName;
  final List<GlobalFilterStruct>? filters;

  @override
  State<FilterRowWidget> createState() => _FilterRowWidgetState();

  void checkSelected(String id) {
    if (title == 'Brand') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.manufacturer
        ];
        FFAppState().watchListingFilter.filterData.manufacturer =
            currentFilterData.addUnique(id);
      });
    } else if (title == 'Model') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.model
        ];
        FFAppState().watchListingFilter.filterData.model =
            currentFilterData.addUnique(id);
      });
    } else if (title == 'Reference Number') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.referenceNumber
        ];
        FFAppState().watchListingFilter.filterData.referenceNumber =
            currentFilterData.addUnique(id);
      });
    } else if (title == 'Case Size') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.caseSize
        ];
        FFAppState().watchListingFilter.filterData.caseSize =
            currentFilterData.addUnique(id);
      });
    } else if (title == 'Case Material') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.caseMaterial
        ];
        FFAppState().watchListingFilter.filterData.caseMaterial =
            currentFilterData.addUnique(id);
      });
    } else if (title == 'Dial Color') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.dialColor
        ];
        FFAppState().watchListingFilter.filterData.dialColor =
            currentFilterData.addUnique(id);
      });
    } else if (title == 'Movement') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.movement
        ];
        FFAppState().watchListingFilter.filterData.movement =
            currentFilterData.addUnique(id);
      });
    } else if (title == 'Bracelet Material') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.braceletMaterial
        ];
        FFAppState().watchListingFilter.filterData.braceletMaterial =
            currentFilterData.addUnique(id);
      });
    } else if (title == 'Clasp Material') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.claspMaterial
        ];
        FFAppState().watchListingFilter.filterData.claspMaterial =
            currentFilterData.addUnique(id);
      });
    } else if (title == 'Info Source') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.infoSource
        ];
        FFAppState().watchListingFilter.filterData.infoSource =
            currentFilterData.addUnique(id);
      });
    } else if (title == 'Country') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.country
        ];
        FFAppState().watchListingFilter.filterData.country =
            currentFilterData.addUnique(id);
      });
    } else if (title == 'Condition') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.condition
        ];
        FFAppState().watchListingFilter.filterData.condition =
            currentFilterData.addUnique(id);
      });
    }
  }

  void checkUnselected(String id) {
    if (title == 'Brand') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.manufacturer
        ];
        FFAppState().watchListingFilter.filterData.manufacturer =
            currentFilterData.removeUnique(id);
      });
    } else if (title == 'Model') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.model
        ];
        FFAppState().watchListingFilter.filterData.model =
            currentFilterData.removeUnique(id);
      });
    } else if (title == 'Reference Number') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.referenceNumber
        ];
        FFAppState().watchListingFilter.filterData.referenceNumber =
            currentFilterData.removeUnique(id);
      });
    } else if (title == 'Case Size') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.caseSize
        ];
        FFAppState().watchListingFilter.filterData.caseSize =
            currentFilterData.removeUnique(id);
      });
    } else if (title == 'Case Material') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.caseMaterial
        ];
        FFAppState().watchListingFilter.filterData.caseMaterial =
            currentFilterData.removeUnique(id);
      });
    } else if (title == 'Dial Color') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.dialColor
        ];
        FFAppState().watchListingFilter.filterData.dialColor =
            currentFilterData.removeUnique(id);
      });
    } else if (title == 'Movement') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.movement
        ];
        FFAppState().watchListingFilter.filterData.movement =
            currentFilterData.removeUnique(id);
      });
    } else if (title == 'Bracelet Material') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.braceletMaterial
        ];
        FFAppState().watchListingFilter.filterData.braceletMaterial =
            currentFilterData.removeUnique(id);
      });
    } else if (title == 'Clasp Material') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.claspMaterial
        ];
        FFAppState().watchListingFilter.filterData.claspMaterial =
            currentFilterData.removeUnique(id);
      });
    } else if (title == 'Info Source') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.infoSource
        ];
        FFAppState().watchListingFilter.filterData.infoSource =
            currentFilterData.removeUnique(id);
      });
    } else if (title == 'Country') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.country
        ];
        FFAppState().watchListingFilter.filterData.country =
            currentFilterData.removeUnique(id);
      });
    } else if (title == 'Condition') {
      FFAppState().update(() {
        var currentFilterData = [
          ...FFAppState().watchListingFilter.filterData.condition
        ];
        FFAppState().watchListingFilter.filterData.condition =
            currentFilterData.removeUnique(id);
      });
    }
  }

  bool checkIsSelected(String id) {
    List<String> currentFilterData = [];
    if (title == 'Brand') {
      currentFilterData =
          FFAppState().watchListingFilter.filterData.manufacturer;
    } else if (title == 'Model') {
      currentFilterData = FFAppState().watchListingFilter.filterData.model;
    } else if (title == 'Reference Number') {
      currentFilterData =
          FFAppState().watchListingFilter.filterData.referenceNumber;
    } else if (title == 'Case Size') {
      currentFilterData = FFAppState().watchListingFilter.filterData.caseSize;
    } else if (title == 'Case Material') {
      currentFilterData =
          FFAppState().watchListingFilter.filterData.caseMaterial;
    } else if (title == 'Dial Color') {
      currentFilterData = FFAppState().watchListingFilter.filterData.dialColor;
    } else if (title == 'Movement') {
      currentFilterData = FFAppState().watchListingFilter.filterData.movement;
    } else if (title == 'Bracelet Material') {
      currentFilterData =
          FFAppState().watchListingFilter.filterData.braceletMaterial;
    } else if (title == 'Clasp Material') {
      currentFilterData =
          FFAppState().watchListingFilter.filterData.claspMaterial;
    } else if (title == 'Info Source') {
      currentFilterData = FFAppState().watchListingFilter.filterData.infoSource;
    } else if (title == 'Country') {
      currentFilterData = FFAppState().watchListingFilter.filterData.country;
    } else if (title == 'Condition') {
      currentFilterData = FFAppState().watchListingFilter.filterData.condition;
    }
    return currentFilterData.contains(id);
  }
}

class _FilterRowWidgetState extends State<FilterRowWidget> {
  late FilterRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterRowModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: double.infinity,
          height: 28.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.title,
                    'Brand',
                  ),
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'DM Sans',
                        color: FlutterFlowTheme.of(context).secondary,
                        letterSpacing: 0.08,
                        lineHeight: 1.43,
                      ),
                ),
                const Spacer(),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      'AllFiltersPage',
                      queryParameters: {
                        'title': serializeParam(
                          widget.title,
                          ParamType.String,
                        ),
                        'keyName': serializeParam(
                          widget.keyName,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: Text(
                    'Show All',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'DM Sans',
                          color: FlutterFlowTheme.of(context).tertiary,
                          letterSpacing: 0.12,
                          fontWeight: FontWeight.normal,
                          lineHeight: 1.43,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Builder(
            builder: (context) {
              final filtersChildren = widget.filters!.toList();

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(filtersChildren.length,
                      (filtersChildrenIndex) {
                    final filtersChildrenItem =
                        filtersChildren[filtersChildrenIndex];
                    final id = filtersChildrenItem.id.toString();
                    var model = _model.toggleButtonModels.getModel(
                      id,
                      filtersChildrenIndex,
                    );
                    model.isSelected = widget.checkIsSelected(id);
                    var button = ToggleButtonWidget(
                      key: Key(
                        'Keykib_$id',
                      ),
                      title: valueOrDefault<String>(
                        filtersChildrenItem.value,
                        'Rolex',
                      ),
                      count: filtersChildrenItem.count.toString(),
                      isSelected: widget.checkIsSelected(id),
                      selectedAction: () async {
                        widget.checkSelected(id);
                      },
                      unselectedAction: () async {
                        widget.checkUnselected(id);
                      },
                    );
                    return wrapWithModel(
                      model: model,
                      updateCallback: () => safeSetState(() {}),
                      child: button,
                    );
                  }).divide(const SizedBox(width: 8.0)),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
