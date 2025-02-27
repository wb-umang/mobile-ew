import 'package:every_watch/core/common/widgets/icon_button/icon_button_widget.dart';
import 'package:every_watch/features/home/domain/enums/home_enums.dart';
import 'package:every_watch/flutter_flow/custom_icons.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class TopTabHomeWidget extends StatefulWidget {
  final TabType selectedTab;
  final Function(TabType) onAvailableSelected;
  final Function(TabType) onHistoricalSelected;

  const TopTabHomeWidget({
    super.key,
    required this.selectedTab,
    required this.onAvailableSelected,
    required this.onHistoricalSelected,
  });

  @override
  State<TopTabHomeWidget> createState() => _TopTabHomeWidgetState();
}

class _TopTabHomeWidgetState extends State<TopTabHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButtonWidget(
          name: 'Available',
          icon: Icon(
            FFIcons.kwaiting,
            color: FlutterFlowTheme.of(context).primary,
            size: 16.0,
          ),
          isSelected: widget.selectedTab == TabType.available,
          selectedAction: () => widget.onAvailableSelected(TabType.available),
          unselectedAction: () => widget.onAvailableSelected(TabType.available),
        ),
        IconButtonWidget(
          name: 'Historical',
          icon: Icon(
            FFIcons.kresetSettings,
            color: FlutterFlowTheme.of(context).primary,
            size: 16.0,
          ),
          isSelected: widget.selectedTab == TabType.historical,
          selectedAction: () => widget.onHistoricalSelected(TabType.historical),
          unselectedAction: () =>
              widget.onHistoricalSelected(TabType.historical),
        ),
      ],
    );
  }
}
