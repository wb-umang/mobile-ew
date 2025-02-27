import 'package:every_watch/core/common/widgets/pill_button/pill_button_widget.dart';
import 'package:every_watch/core/common/widgets/toggle_button/toggle_button_widget.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:every_watch/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class FilterOptionsWidget extends StatefulWidget {
  const FilterOptionsWidget({super.key});

  @override
  State<FilterOptionsWidget> createState() => _FilterOptionsWidgetState();
}

class _FilterOptionsWidgetState extends State<FilterOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PopupMenuButton<String>(
            color: FlutterFlowTheme.of(context).appBar,
            onSelected: (String result) {
              var sortColumn = 'relevance';
              var sortType = 'asc';
              var sortText = 'Relevance';
              if (result == 'newest') {
                sortColumn = 'newest';
                sortType = 'desc';
                sortText = 'Newest';
              } else if (result == 'price-high') {
                sortColumn = 'price';
                sortType = 'desc';
                sortText = 'Price: High to Low';
              } else if (result == 'price-low') {
                sortColumn = 'price';
                sortType = 'asc';
                sortText = 'Price: Low to High';
              }
              safeSetState(() {
                FFAppState().update(() {
                  FFAppState().watchListingFilter.sortColumn = sortColumn;
                  FFAppState().watchListingFilter.sortType = sortType;
                });
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Sort by $sortText')),
              );
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
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
                child: Text('Price: High to Low'),
              ),
              const PopupMenuItem<String>(
                value: 'price-low',
                child: Text('Price: Low to High'),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(
                color: FlutterFlowTheme.of(context).border,
                width: 1.0,
              ),
            ),
            child: Container(
              height: 32.0,
              width: 32.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).appBar,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).border,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Icon(
                FFIcons.ksort,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 16.0,
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: PillButtonWidget(
              title: 'Filters',
              icon: Icon(
                FFIcons.kparameters,
                color: FlutterFlowTheme.of(context).primary,
                size: 16.0,
              ),
              pressAction: () async {
                context.pushNamed(
                  'FiltersPage',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: const TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.bottomToTop,
                    ),
                  },
                );
              },
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: ToggleButtonWidget(
              title: 'Upcoming Auctions',
              isSelected: false,
              selectedAction: () async {},
              unselectedAction: () async {},
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: ToggleButtonWidget(
              title: 'Marketplace',
              isSelected: false,
              selectedAction: () async {},
              unselectedAction: () async {},
            ),
          ),
          SizedBox(width: 10),
        ]
            .divide(const SizedBox(width: 8.0))
            .addToStart(const SizedBox(width: 20.0)),
      ),
    );
  }
}
