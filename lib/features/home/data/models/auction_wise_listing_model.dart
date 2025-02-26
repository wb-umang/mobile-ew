import 'package:every_watch/features/home/data/models/watch_detail_model.dart';

class AuctionWiseListingModel {
  final List<WatchDetailModel> watchListings;

  const AuctionWiseListingModel({
    required this.watchListings,
  });

  factory AuctionWiseListingModel.fromJson(Map<String, dynamic> json) {
    var list = json['allWatchListings'] as List;
    List<WatchDetailModel> watchList =
        list.map((watchJson) => WatchDetailModel.fromJson(watchJson)).toList();

    return AuctionWiseListingModel(watchListings: watchList);
  }
}
