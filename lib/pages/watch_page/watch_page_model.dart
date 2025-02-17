import 'package:every_watch/backend/schema/structs/index.dart';
import '../../core/widgets/auction_price_card/auction_price_card_widget.dart';
import '../../core/widgets/pill_bold_button/pill_bold_button_widget.dart';
import '../../core/widgets/price_guide_card/price_guide_card_widget.dart';
import '../../core/widgets/specifications_card/specifications_card_widget.dart';
import '../../core/widgets/two_button_page_menu/two_button_page_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'watch_page_widget.dart' show WatchPageWidget;
import 'package:flutter/material.dart';

class WatchPageModel extends FlutterFlowModel<WatchPageWidget> {
  ///  Local state fields for this page.

  bool isFavorite = false;

  ///  State fields for stateful widgets in this page.
  WatchAnalysisFilterStruct? filter;

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for PillBoldButton component.
  late PillBoldButtonModel pillBoldButtonModel;
  // Model for TwoButtonPageMenu component.
  late TwoButtonPageMenuModel twoButtonPageMenuModel;
  // Model for AuctionPriceCard component.
  late AuctionPriceCardModel auctionPriceCardModel;
  // Model for SpecificationsCard component.
  late SpecificationsCardModel specificationsCardModel;
  // Model for PriceGuideCard component.
  late PriceGuideCardModel priceGuideCardModel;

  @override
  void initState(BuildContext context) {
    pillBoldButtonModel = createModel(context, () => PillBoldButtonModel());
    twoButtonPageMenuModel =
        createModel(context, () => TwoButtonPageMenuModel());
    auctionPriceCardModel = createModel(context, () => AuctionPriceCardModel());
    specificationsCardModel =
        createModel(context, () => SpecificationsCardModel());
    priceGuideCardModel = createModel(context, () => PriceGuideCardModel());
  }

  @override
  void dispose() {
    pillBoldButtonModel.dispose();
    twoButtonPageMenuModel.dispose();
    auctionPriceCardModel.dispose();
    specificationsCardModel.dispose();
    priceGuideCardModel.dispose();
  }
}
