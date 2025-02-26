import 'package:every_watch/core/error/failures.dart';
import 'package:every_watch/core/usecase/usecase.dart';
import 'package:every_watch/features/home/data/models/watch_detail_model.dart';
import 'package:every_watch/features/home/data/models/watch_listing_filter_model.dart';
import 'package:every_watch/features/home/domain/repository/home_reposity.dart';
import 'package:fpdart/fpdart.dart';

class WatchListingUsecase
    implements Usecase<List<WatchDetailModel>, WatchListingParams> {
  final HomeRepository homeRepository;

  WatchListingUsecase(this.homeRepository);

  @override
  Future<Either<Failure, List<WatchDetailModel>>> call(
      WatchListingParams params) async {
    return await homeRepository.getWatchListing(filter: params.filter);
  }
}

class WatchListingParams {
  final WatchListingFilterModel filter;

  const WatchListingParams({
    required this.filter,
  });
}
