import 'package:every_watch/core/error/exceptions.dart';
import 'package:every_watch/core/error/failures.dart';
import 'package:every_watch/features/home/data/datasources/home_remote_data_source.dart';
import 'package:every_watch/features/home/data/models/watch_detail_model.dart';
import 'package:every_watch/features/home/data/models/watch_listing_filter_model.dart';
import 'package:every_watch/features/home/domain/repository/home_reposity.dart';
import 'package:fpdart/fpdart.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  const HomeRepositoryImpl(this.homeRemoteDataSource);

  @override
  Future<Either<Failure, List<WatchDetailModel>>> getWatchListing(
      {required WatchListingFilterModel filter}) async {
    try {
      final result = await homeRemoteDataSource.getWatchListing(filter: filter);
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
