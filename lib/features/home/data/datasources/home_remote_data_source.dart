import 'package:every_watch/features/home/data/models/watch_detail_model.dart';
import 'package:every_watch/features/home/data/models/watch_listing_filter_model.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<WatchDetailModel>> getWatchListing({
    required WatchListingFilterModel filter,
  });
}
