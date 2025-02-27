import 'package:every_watch/core/common/widgets/pill_button/pill_button_widget.dart';
import 'package:every_watch/core/common/widgets/toggle_button/toggle_button_widget.dart';
import 'package:every_watch/features/home/domain/enums/home_enums.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:every_watch/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class FilterOptionsWidget extends StatefulWidget {
  final Function(SortColumn, SortType) onSortSelected;
  final Function(AuctionType) onMarketplaceSelected;
  final Function() onMarketplaceUnselected;
  final TabType tabType;

  const FilterOptionsWidget({
    super.key,
    required this.onSortSelected,
    required this.onMarketplaceSelected,
    required this.onMarketplaceUnselected,
    required this.tabType,
  });

  @override
  State<FilterOptionsWidget> createState() => _FilterOptionsWidgetState();
}

class _FilterOptionsWidgetState extends State<FilterOptionsWidget> {
  SortColumnUi? selectedSortColumn;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PopupMenuButton<SortColumnUi>(
              color: FlutterFlowTheme.of(context).appBar,
              onSelected: (SortColumnUi result) {
                switch (result) {
                  case SortColumnUi.relevance:
                    widget.onSortSelected(SortColumn.relevance, SortType.asc);
                    selectedSortColumn = SortColumnUi.relevance;
                    break;
                  case SortColumnUi.newest:
                    widget.onSortSelected(SortColumn.newest, SortType.asc);
                    selectedSortColumn = SortColumnUi.newest;
                    break;
                  case SortColumnUi.priceHighToLow:
                    widget.onSortSelected(SortColumn.price, SortType.desc);
                    selectedSortColumn = SortColumnUi.priceHighToLow;
                    break;
                  case SortColumnUi.priceLowToHigh:
                    widget.onSortSelected(SortColumn.price, SortType.asc);
                    selectedSortColumn = SortColumnUi.priceLowToHigh;
                    break;
                  default:
                    widget.onSortSelected(SortColumn.relevance, SortType.asc);
                    selectedSortColumn = SortColumnUi.relevance;
                    break;
                }
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<SortColumnUi>>[
                PopupMenuItem<SortColumnUi>(
                  value: SortColumnUi.relevance,
                  child: Text(
                    'Relevance',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'DM Sans',
                          fontSize: 14.0,
                          letterSpacing: 0.18,
                          fontWeight:
                              selectedSortColumn == SortColumnUi.relevance
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                          lineHeight: 1.33,
                        ),
                  ),
                ),
                PopupMenuItem<SortColumnUi>(
                  value: SortColumnUi.newest,
                  child: Text(
                    'Newest',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'DM Sans',
                          fontSize: 14.0,
                          letterSpacing: 0.18,
                          fontWeight: selectedSortColumn == SortColumnUi.newest
                              ? FontWeight.bold
                              : FontWeight.normal,
                          lineHeight: 1.33,
                        ),
                  ),
                ),
                PopupMenuItem<SortColumnUi>(
                  value: SortColumnUi.priceHighToLow,
                  child: Text(
                    'Price: High to Low',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'DM Sans',
                          fontSize: 14.0,
                          letterSpacing: 0.18,
                          fontWeight:
                              selectedSortColumn == SortColumnUi.priceHighToLow
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                          lineHeight: 1.33,
                        ),
                  ),
                ),
                PopupMenuItem<SortColumnUi>(
                  value: SortColumnUi.priceLowToHigh,
                  child: Text(
                    'Price: Low to High',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'DM Sans',
                          fontSize: 14.0,
                          letterSpacing: 0.18,
                          fontWeight:
                              selectedSortColumn == SortColumnUi.priceLowToHigh
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                          lineHeight: 1.33,
                        ),
                  ),
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
            Visibility(
              visible: widget.tabType == TabType.available,
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: ToggleButtonWidget(
                  title: 'Marketplace',
                  isSelected: false,
                  selectedAction: () async {
                    widget.onMarketplaceSelected(AuctionType.marketplace);
                  },
                  unselectedAction: () async {
                    widget.onMarketplaceUnselected();
                  },
                ),
              ),
            ),
            SizedBox(width: 10),
          ]
              .divide(const SizedBox(width: 8.0))
              .addToStart(const SizedBox(width: 20.0)),
        ),
      ),
    );
  }
}
