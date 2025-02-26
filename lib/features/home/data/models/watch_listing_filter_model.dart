import 'package:every_watch/core/common/entities/watch_listing_filter_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'watch_listing_filter_model.g.dart';

@JsonSerializable()
class WatchListingFilterModel extends WatchListingFilterEntity {
  WatchListingFilterModel({
    required super.filterData,
    required super.sortType,
    required super.sortColumn,
    required super.from,
    required super.size,
  });

  factory WatchListingFilterModel.fromJson(Map<String, dynamic> json) =>
      _$WatchListingFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$WatchListingFilterModelToJson(this);
}
