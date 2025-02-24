import '../../core/common/widgets/notification_setting_row/notification_setting_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'push_settings_page_widget.dart' show PushSettingsPageWidget;
import 'package:flutter/material.dart';

class PushSettingsPageModel extends FlutterFlowModel<PushSettingsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NotificationSettingRow component.
  late NotificationSettingRowModel notificationSettingRowModel1;
  // Model for NotificationSettingRow component.
  late NotificationSettingRowModel notificationSettingRowModel2;
  // Model for NotificationSettingRow component.
  late NotificationSettingRowModel notificationSettingRowModel3;
  // Model for NotificationSettingRow component.
  late NotificationSettingRowModel notificationSettingRowModel4;

  @override
  void initState(BuildContext context) {
    notificationSettingRowModel1 =
        createModel(context, () => NotificationSettingRowModel());
    notificationSettingRowModel2 =
        createModel(context, () => NotificationSettingRowModel());
    notificationSettingRowModel3 =
        createModel(context, () => NotificationSettingRowModel());
    notificationSettingRowModel4 =
        createModel(context, () => NotificationSettingRowModel());
  }

  @override
  void dispose() {
    notificationSettingRowModel1.dispose();
    notificationSettingRowModel2.dispose();
    notificationSettingRowModel3.dispose();
    notificationSettingRowModel4.dispose();
  }
}
