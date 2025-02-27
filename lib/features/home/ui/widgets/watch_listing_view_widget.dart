import 'package:every_watch/core/common/entities/watch_detail_entity.dart';
import 'package:every_watch/core/common/widgets/watch_card/watch_card_widget.dart';
import 'package:every_watch/core/utils/date_time_parser.dart';
import 'package:every_watch/core/utils/temp/map_to_old_data_struct.dart';
import 'package:every_watch/features/home/domain/enums/home_enums.dart';
import 'package:every_watch/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WatchListingView extends StatefulWidget {
  final List<WatchDetailEntity> watchListing;
  final TabType tabType;
  final bool isLoading;

  const WatchListingView({
    super.key,
    required this.watchListing,
    required this.tabType,
    required this.isLoading,
  });

  @override
  State<WatchListingView> createState() => _WatchListingViewState();
}

class _WatchListingViewState extends State<WatchListingView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(18, 14, 18, 10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // Number of columns
        crossAxisSpacing: 10, // Space between columns
        mainAxisSpacing: 10, // Space between rows
        childAspectRatio: 0.61, // Aspect ratio of items
      ),
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: widget.watchListing.length,
      itemBuilder: (context, watchListingsIndex) {
        final watchListingsItem = widget.watchListing[watchListingsIndex];
        return GestureDetector(
          onTap: () {
            FFAppState().watchListingStruct =
                mapWatchDetailToListing(watchListingsItem);
            context.push('/watch-detail');
          },
          child: Skeletonizer(
            enabled: widget.isLoading,
            child: WatchCardWidget(
              isLoading: widget.isLoading,
              key: Key(
                'Keyn5s_${watchListingsItem.watchId.toString()}',
              ),
              brand: watchListingsItem.manufactureName ?? '-',
              model: valueOrDefault<String>(
                watchListingsItem.modelName,
                '-',
              ),
              priceTitle: 'Estimates',
              price: "${watchListingsItem.netPayableUsd.toString()} USD",
              auctionLocation: widget.tabType == TabType.available
                  ? "${watchListingsItem.sellerOrganizationName ?? ""} ${watchListingsItem.organizationName != null ? "(${watchListingsItem.organizationName})" : ""}"
                  : watchListingsItem.eventCityName ?? '-',
              auctionDate: watchListingsItem.eventPublishEndDate != null
                  ? DateTimeParser.formatDate(
                      watchListingsItem.eventPublishEndDate ?? '')
                  : '',
              auctionLotType: watchListingsItem.auctionLotType ?? '-',
              imagePath: watchListingsItem.primaryImage?.url ?? '-',
            ),
          ),
        );
      },
    );
  }
}
