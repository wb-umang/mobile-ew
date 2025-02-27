import 'package:every_watch/core/common/entities/watch_detail_entity.dart';
import 'package:every_watch/core/common/widgets/watch_card/watch_card_widget.dart';
import 'package:every_watch/core/utils/date_time_parser.dart';
import 'package:every_watch/core/utils/temp/map_to_login_data_struct.dart';
import 'package:every_watch/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class WatchListingView extends StatefulWidget {
  final List<WatchDetailEntity> watchListing;

  const WatchListingView({super.key, required this.watchListing});

  @override
  State<WatchListingView> createState() => _WatchListingViewState();
}

class _WatchListingViewState extends State<WatchListingView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(18, 14, 18, 16),
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
          child: WatchCardWidget(
            key: Key(
              'Keyn5s_${watchListingsItem.watchId.toString()}',
            ),
            brand: watchListingsItem.manufactureName ?? '-',
            model: valueOrDefault<String>(
              watchListingsItem.modelName,
              '-',
            ),
            priceTitle: 'Estimates',
            price: watchListingsItem.minEstUsd.toString(),
            auctionLocation: watchListingsItem.eventCityName ?? '-',
            auctionDate: DateTimeParser.formatDate(
                watchListingsItem.eventPublishEndDate ?? ''),
            auctionLotType: watchListingsItem.auctionLotType ?? '-',
            imagePath: watchListingsItem.primaryImage?.url ?? '-',
          ),
        );
      },
    );
  }
}
