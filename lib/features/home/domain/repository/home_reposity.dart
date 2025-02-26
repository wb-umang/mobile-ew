import 'package:every_watch/core/error/failures.dart';
import 'package:every_watch/features/home/data/models/watch_detail_model.dart';
import 'package:every_watch/features/home/data/models/watch_listing_filter_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<WatchDetailModel>>> getWatchListing({
    required WatchListingFilterModel filter,
  });
}
