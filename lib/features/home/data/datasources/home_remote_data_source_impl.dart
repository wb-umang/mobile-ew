import 'package:dio/dio.dart';
import 'package:every_watch/core/error/exceptions.dart';
import 'package:every_watch/core/network/api_client.dart';
import 'package:every_watch/core/network/api_endpoints.dart';
import 'package:every_watch/core/network/api_response.dart';
import 'package:every_watch/features/home/data/datasources/home_remote_data_source.dart';
import 'package:every_watch/features/home/data/models/auction_wise_listing_model.dart';
import 'package:every_watch/features/home/data/models/watch_detail_model.dart';
import 'package:every_watch/features/home/data/models/watch_listing_filter_model.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient apiClient;

  const HomeRemoteDataSourceImpl({
    required this.apiClient,
  });

  @override
  Future<List<WatchDetailModel>> getWatchListing(
      {required WatchListingFilterModel filter}) async {
    try {
      final response = await apiClient.get(ApiEndpoints.watchListing, query: {
        "variables": filter.toJson(),
      });

      final result = ApiResponse.fromJson(response.data);

      if (result.success) {
        final watchListing =
            AuctionWiseListingModel.fromJson(result.data).watchListings;

        return watchListing;
      } else {
        throw ServerException(result.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(e.response!.data['message'] ?? "Request failed");
      } else {
        throw ServerException(e.message ?? "Unexpected error");
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
